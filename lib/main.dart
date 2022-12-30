import 'package:flutter/material.dart';
import 'package:j99_mobile_flutter_manifest_resto/view/login.dart';
import 'package:j99_mobile_flutter_manifest_resto/view/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Juragan99 Trans Manifest Resto',
      home: Login(),
    );
  }
}
