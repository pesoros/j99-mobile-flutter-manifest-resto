import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:j99_mobile_flutter_manifest_resto/controller/loginController.dart';
import 'package:j99_mobile_flutter_manifest_resto/view/dashboardScreen.dart';
import 'package:j99_mobile_flutter_manifest_resto/view/loginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:j99_mobile_flutter_manifest_resto/variables.dart' as variable;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  checkAuth() async {
    final prefs = await SharedPreferences.getInstance();
    final String email = prefs.getString('email');
    final String password = prefs.getString('password');
    if (email != null && password != null) {
      login(email, password).then((val) async {
        var statusCode = val.statusCode;
        var res = jsonDecode(val.body);
        if (statusCode == 200) {
          setState(() {
            variable.resto_id = res['resto_detail']['resto_id'].toString();
          });
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => DashboardScreen(),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
          );
        }
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
    }
  }

  @override
  void initState() {
    checkAuth();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: CupertinoActivityIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}
