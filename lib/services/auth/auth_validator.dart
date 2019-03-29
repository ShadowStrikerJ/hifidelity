import 'dart:async';

mixin AuthValidators{
  var emailValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink){
      if (email.contains("@")) {
        sink.add(email);
      } else {
        sink.addError("Not a valid email");
      }
    }
  );

    var passwordValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink){
      if (password.length>=8 && password.length<=24) {
        sink.add(password);
      } else {
        sink.addError("Password length must be greater than 8 and less than 24");
      }
    }
  );
}