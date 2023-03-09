import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:j99_mobile_flutter_manifest_resto/controller/dashboardController.dart';
import 'package:j99_mobile_flutter_manifest_resto/variables.dart' as variable;
import 'package:j99_mobile_flutter_manifest_resto/view/detailScreen.dart';
import 'package:j99_mobile_flutter_manifest_resto/view/splashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  // String formattedDate = "2022-12-23";
  bool isLoad = true;
  List<Order> order = [];

  getData() async {
    await getOrder(formattedDate, variable.resto_id).then((val) {
      setState(() {
        order = val;
        isLoad = false;
      });
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

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
            (isLoad)
                ? Expanded(
                    child: Center(
                      child: CupertinoActivityIndicator(
                        color: Colors.white,
                      ),
                    ),
                  )
                : (order.isEmpty)
                    ? Expanded(
                        child: Center(
                            child: Text(
                          "Data Kosong",
                          style: TextStyle(color: Colors.white),
                        )),
                      )
                    : bodyWidget(context),
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
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(top: 20),
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          itemCount: order.length,
          itemBuilder: ((context, index) {
            Order x = order[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(x.armada, x.order),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.redAccent),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          x.armada,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            );
          }),
          separatorBuilder: ((context, index) {
            return Divider();
          }),
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
          final prefs = await SharedPreferences.getInstance();
          await prefs.remove("email");
          await prefs.remove("password");
          setState(() {
            variable.resto_id = null;
          });
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => SplashScreen(),
            ),
          );
        },
      ),
    );
  }
}
