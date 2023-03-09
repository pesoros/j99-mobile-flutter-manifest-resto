import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:j99_mobile_flutter_manifest_resto/view/splashScreen.dart';

void main() async {
  runApp(MyApp());
  if (kDebugMode) {
    await dotenv.load(fileName: "debug.env");
  }
  if (kReleaseMode) {
    await dotenv.load(fileName: "release.env");
  }
}

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Juragan99 Trans Manifest Resto',
      home: SplashScreen(),
    );
  }
}
