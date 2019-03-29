import 'dart:async';
import 'package:hifidelity/services/auth/auth_validator.dart';
import 'package:rxdart/rxdart.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationBloc with AuthValidators{
  final _userController =BehaviorSubject<FirebaseUser>();
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _successfulLoginController = BehaviorSubject<bool>();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Function(String) get emailChanged => _emailController.sink.add;
  Function(String) get passwordChanged => _passwordController.sink.add;

  Stream<String> get email => _emailController.stream.transform(emailValidator);
  Stream<String> get password => _passwordController.stream.transform(passwordValidator);
  Stream<bool> get successfulLogin => _successfulLoginController.stream;

  Stream<bool> get submitCheck => Observable.combineLatest2(email, password, (e,p)=>true);

  submit()
  {
    try {_firebaseAuth.signInWithEmailAndPassword(email: _emailController.value, password: _passwordController.value).then((firebaseUser){
      _userController.sink.add(firebaseUser);
      _successfulLoginController.sink.add(true);
      print('Successful login: $firebaseUser');
    });
    } catch (e) {
      print(e);
    }
  }


  void dispose() {
    _userController?.close();
    _emailController?.close();
    _passwordController?.close();
    _successfulLoginController?.close();
  }

}