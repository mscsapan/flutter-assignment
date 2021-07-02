import 'package:ami_coding_pari_na/screen/section_one/login.dart';
import 'package:ami_coding_pari_na/screen/section_one/registration.dart';
import 'package:flutter/material.dart';

class ScreenSwitch extends StatefulWidget {
  @override
  _ScreenSwitchState createState() => _ScreenSwitchState();
}

class _ScreenSwitchState extends State<ScreenSwitch> {
  bool switchView = true;

  switchScreen() {
    setState(() {
      switchView = !switchView;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (switchView) {
      return Login(
        isLoggedIn: switchScreen,
      );
    } else {
      return Registration(
        isRegistered: switchScreen,
      );
    }
  }
}
