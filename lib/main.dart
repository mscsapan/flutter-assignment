import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'view/screen_switch.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      home: ScreenSwitch(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
