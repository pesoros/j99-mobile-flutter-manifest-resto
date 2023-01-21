import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: headerWidget(context),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            bodyWidget(context),
            SizedBox(height: 30),
            buttonWidget(context),
          ],
        ),
      ),
    );
  }

  headerWidget(BuildContext context) {
    return PreferredSize(
      child: Container(
        padding: EdgeInsets.all(20),
        height: 70,
        color: Colors.black,
        child: Row(
          children: [
            Image.asset(
              "assets/images/j99-logo.png",
              width: MediaQuery.of(context).size.width / 3,
            ),
            VerticalDivider(color: Colors.white),
            Text(
              "Resto",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      preferredSize: const Size.fromHeight(200.0),
    );
  }

  bodyWidget(BuildContext context) {
    double wd = (MediaQuery.of(context).size.width / 2) - 60;
    return Expanded(
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => SplashScreen(),
                  //   ),
                  // );
                },
                child: Ink(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red,
                  ),
                  width: wd,
                  height: wd,
                  child: Center(
                    child: Text(
                      "Detail",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => SplashScreen(),
                  //   ),
                  // );
                },
                child: Ink(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red,
                  ),
                  width: wd,
                  height: wd,
                  child: Center(
                    child: Text(
                      "List",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buttonWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30, left: 30, right: 30),
      child: GestureDetector(
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Center(child: Text("Keluar")),
        ),
        onTap: () async {
          // final prefs = await SharedPreferences.getInstance();
          // await prefs.remove("email");
          // await prefs.remove("password");
          // setState(() {
          //   variable.manifest_id = null;
          //   variable.trip_id_no = null;
          //   variable.trip_date = null;
          // });
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => SplashScreen(),
          //   ),
          // );
        },
      ),
    );
  }
}
