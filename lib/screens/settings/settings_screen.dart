import 'package:flutter/material.dart';
import 'package:hifidelity/components/app_inherited_widget.dart';
import 'package:hifidelity/components/localization_drawer.dart';
import 'package:hifidelity/components/navigation_drawer.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final walletAddresses = [
    WalletAddress(
      address: '1BvBMSEYstWetqTFn5Au4m4GFg7xJaNVN2',
      isValid: true,
    ),
    WalletAddress(
      address: '3J98t1WpEZ73CNmQviecrnyiWrnqRhWNLy',
      isValid: true,
    ),
    WalletAddress(
      address: 'bc1qar0srrr7xfkvy5l643lydnw9re59gtzzwf5mdq',
      isValid: false,
    ),
  ];

  void _drawerLanguageButtonClicked(BuildContext cxt) {
    _scaffoldKey.currentState.openEndDrawer();
  }

  final divider = Divider(height: 1, color: Colors.black);

  void showRemoveWalletAddressDialog(BuildContext cxt) {
    showDialog(context: cxt, builder: (BuildContext context) {
      return AlertDialog(
        content: Text(AppInheritedWidget.of(cxt).text('WalletDeleteAreYouSure', category: 'settings')),
        actions: [
          FlatButton(
            onPressed: () => Navigator.of(cxt).pop(),
            child: Text(AppInheritedWidget.of(cxt).text('NoUpper')),
          ),
          FlatButton(
            onPressed: () => Navigator.of(cxt).pop(),
            child: Text(AppInheritedWidget.of(cxt).text('YesUpper')),
          ),
        ],
      );
    });
  }

  void showAddWalletAddressDialog(BuildContext cxt) {
    showDialog(context: cxt, builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 2),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: AppInheritedWidget.of(cxt).text('WalletAddress', category: 'settings'),
              ),
            ),
          ],
        ),
        actions: [
          FlatButton(
            onPressed: () => Navigator.of(cxt).pop(),
            child: Text(AppInheritedWidget.of(cxt).text('CancelUpper')),
          ),
          FlatButton(
            onPressed: () => Navigator.of(cxt).pop(),
            child: Text(AppInheritedWidget.of(cxt).text('Add', category: 'settings')),
          ),
        ],
      );
    });
  }

  void showManagePersonalInfoDialog(BuildContext cxt) {
    final nameController = TextEditingController(text: 'Tanya Michaelson');
    final addressController = TextEditingController(text: '137 Normany Way Rd');
    final cityController = TextEditingController(text: 'Harrisburg, PA, 17109');
    final emailController = TextEditingController(text: 'testlongemail@email.com');
    final phoneController = TextEditingController(text: '1-646-555-1234');
    showDialog(context: cxt, builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 2),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: AppInheritedWidget.of(cxt).text('Name', category: 'settings'),
              ),
            ),
            TextField(
              controller: addressController,
              decoration: InputDecoration(
                hintText: AppInheritedWidget.of(cxt).text('Address', category: 'settings'),
              ),
            ),
            TextField(
              controller: cityController,
              decoration: InputDecoration(
                hintText: AppInheritedWidget.of(cxt).text('CityStateZip', category: 'settings'),
              ),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: AppInheritedWidget.of(cxt).text('Email', category: 'settings'),
              ),
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                hintText: AppInheritedWidget.of(cxt).text('PhoneNumber', category: 'settings'),
              ),
            ),
          ],
        ),
        actions: [
          FlatButton(
            onPressed: () => Navigator.of(cxt).pop(),
            child: Text(AppInheritedWidget.of(cxt).text('CancelUpper')),
          ),
          FlatButton(
            onPressed: () => Navigator.of(cxt).pop(),
            child: Text(AppInheritedWidget.of(cxt).text('SaveUpper')),
          ),
        ],
      );
    });
  }

  void showChangePasswordDialog(BuildContext cxt) {
    showDialog(context: cxt, builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 2),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: AppInheritedWidget.of(cxt).text('Password', category: 'settings'),
              ),
            ),
          ],
        ),
        actions: [
          FlatButton(
            onPressed: () => Navigator.of(cxt).pop(),
            child: Text(AppInheritedWidget.of(cxt).text('CancelUpper')),
          ),
          FlatButton(
            onPressed: () => Navigator.of(cxt).pop(),
            child: Text(AppInheritedWidget.of(cxt).text('SaveUpper')),
          ),
        ],
      );
    });
  }

  Widget padListItem({Widget child}) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: child,
    );
  }

  Widget buildListViewActionRow({ String text, VoidCallback callback }) {
    var widget = padListItem(
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(child: Container()),
          Icon(
            MdiIcons.chevronRight,
            color: Colors.grey[800],
          ),
        ],
      ),
    );

    if (callback != null) {
      widget = Material(
        child: InkWell(
          onTap: callback,
          child: widget,
        ),
      );
    }

    return widget;
  }

  List<Widget> buildWalletList(BuildContext cxt) {
    List<Widget> wallets = [];

    for (var address in walletAddresses) {
      wallets.add(
        Material(
          child: InkWell(
            onLongPress: () => showRemoveWalletAddressDialog(cxt),
            child: padListItem(
              child: Row(
                children: [
                  Text(
                    address.address,
                  ),
                  Expanded(child: Container()),
                  Icon(
                    address.isValid ? MdiIcons.checkCircleOutline : MdiIcons.cancel,
                    color: address.isValid ? Colors.green : Colors.red,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
      wallets.add(divider);
    }

    wallets.add(
      buildListViewActionRow(
        text: AppInheritedWidget.of(cxt).text('Manage', category: 'settings'),
        callback: () => showAddWalletAddressDialog(cxt),
      ),
    );

    return wallets;
  }

  List<Widget> buildPersonalInfo(BuildContext cxt) {
    return [
      padListItem(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Tanya Michaelson'),
            Text('137 Normany Way Rd'),
            Text('Harrisburg, PA, 17109'),
            Text('testlongemail@email.com'),
            Text('1-646-555-1234'),
          ],
        ),
      ),
      divider,
      buildListViewActionRow(
        text: AppInheritedWidget.of(cxt).text('Manage', category: 'settings'),
        callback: () => showManagePersonalInfoDialog(cxt),
      ),
    ];
  }

  List<Widget> buildLanguageSetting(BuildContext cxt) {
    final language = AppInheritedWidget.of(cxt).language;
    return [
      buildListViewActionRow(
        text: language.name,
        callback: () => _drawerLanguageButtonClicked(cxt),
      ),
    ];
  }

  List<Widget> buildChangePassword(BuildContext cxt) {
    return [
      buildListViewActionRow(
        text: AppInheritedWidget.of(cxt).text('ChangePassword', category: 'settings'),
        callback: () => showChangePasswordDialog(cxt),
      ),
    ];
  }

  Widget buildSettingsSectionHeader(String text) {
    return Padding(
      padding: EdgeInsets.only(left: 16, top: 16, bottom: 6),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.grey[800],
        ),
      ),
    );
  }

  Widget buildSettingsFloatingSection({Widget child}) {
    return FractionallySizedBox(
      widthFactor: 0.93,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black, width: 0.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              offset: Offset(2, 2),
              blurRadius: 2,
              spreadRadius: 0,
            ),
          ],
        ),
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext cxt) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 57, 153, 184),
        title: Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: Center(child: Image.asset('assets/images/7tk_title.png')),
        ),
        actions: [
          InkWell(
            onTap: () => _drawerLanguageButtonClicked(cxt),
            child: Row(
              children: [
                Text(AppInheritedWidget.of(cxt).language.displayCode),
                Padding(
                  padding: EdgeInsets.only(left: 8, right: 12),
                  child: Icon(MdiIcons.earth, size: 32),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.grey[300],
        child: ListView(
          children: [
            buildSettingsSectionHeader(AppInheritedWidget.of(cxt).text('Wallets', category: 'settings')),
            buildSettingsFloatingSection(
              child: Column(
                children: buildWalletList(cxt),
              ),
            ),
            buildSettingsSectionHeader(AppInheritedWidget.of(cxt).text('PersonalInfo', category: 'settings')),
            buildSettingsFloatingSection(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: buildPersonalInfo(cxt),
              ),
            ),
            buildSettingsSectionHeader(AppInheritedWidget.of(cxt).text('Language', category: 'settings')),
            buildSettingsFloatingSection(
              child: Column(
                children: buildLanguageSetting(cxt),
              ),
            ),
            buildSettingsSectionHeader(AppInheritedWidget.of(cxt).text('Password', category: 'settings')),
            buildSettingsFloatingSection(
              child: Column(
                children: buildChangePassword(cxt),
              ),
            ),
          ],
        ),
      ),
      drawer: NavigationDrawer(),
      endDrawer: LocalizationDrawer(),
    );
  }
}

class WalletAddress {
  final String address;
  final bool isValid;

  WalletAddress({
    this.address,
    this.isValid,
  });
}