import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:j99_mobile_flutter_manifest_resto/view/dashboardScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.black),
            child: bodyWidget(context)),
      ),
    );
  }

  bodyWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 50, right: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image.asset(
          //   "assets/images/j99-logo.png",
          //   width: MediaQuery.of(context).size.width / 1.5,
          // ),
          SizedBox(height: 40),
          Container(
            padding: EdgeInsets.only(),
            height: 50,
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2, color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2, color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                  )),
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.only(),
            height: 50,
            child: TextField(
              obscureText: !passwordVisible,
              controller: passwordController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: Colors.white),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: Colors.white),
                  borderRadius: BorderRadius.circular(15),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    passwordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      passwordVisible = !passwordVisible;
                    });
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          buttonWidget(context),
        ],
      ),
    );
  }

  buttonWidget(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Center(child: Text("Masuk")),
      ),
      onTap: () async {
        // final prefs = await SharedPreferences.getInstance();
        // await Login.list(emailController.text, passwordController.text)
        //     .then((value) async {
        //   var res = jsonDecode(value.body);
        //   if (value.statusCode == 200) {
        //     await prefs.setString('email', emailController.text);
        //     await prefs.setString('password', passwordController.text);
        //     setState(() {
        //       variable.manifest_id = res['manifest']['id'].toString();
        //       variable.trip_id_no = res['manifest']['trip_id_no'].toString();
        //       variable.trip_date = res['manifest']['trip_date'].toString();
        //     });

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => DashboardScreen(),
          ),
        );
        //   } else {}
        // });
      },
    );
  }
}
