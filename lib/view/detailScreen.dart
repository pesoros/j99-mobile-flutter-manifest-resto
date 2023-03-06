// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:j99_mobile_flutter_manifest_resto/controller/dashboardController.dart';
import 'package:j99_mobile_flutter_manifest_resto/controller/detailController.dart';

class DetailScreen extends StatefulWidget {
  String armada;
  List<OrderDetail> order;
  DetailScreen(this.armada, this.order);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isLoad = true;
  List<OrderDetail> orderDetail = [];
  String armada = "";

  @override
  void initState() {
    setState(() {
      armada = widget.armada;
      orderDetail = widget.order;
      isLoad = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: headerWidget(context),
        body: (isLoad)
            ? Expanded(
                child: Center(
                  child: CupertinoActivityIndicator(
                    color: Colors.white,
                  ),
                ),
              )
            : (orderDetail.isEmpty)
                ? Expanded(
                    child: Center(
                      child: Text(
                        "Data Kosong",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                : bodyWidget(context),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  "assets/images/j99-logo.png",
                  width: MediaQuery.of(context).size.width / 3,
                ),
                VerticalDivider(color: Colors.white),
                Text(
                  armada ??= "",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.cancel,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      preferredSize: const Size.fromHeight(200.0),
    );
  }

  bodyWidget(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemCount: orderDetail.length,
      itemBuilder: (context, index) {
        OrderDetail x = orderDetail[index];
        return Slidable(
          enabled: (x.food_served == "0" ? true : false),
          endActionPane: ActionPane(
            motion: ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (context) async {
                  await changeStatus(x.ticket_number).then((val) {
                    if (val == 200) {
                      setState(() {
                        x.food_served = "1";
                      });
                    }
                  });
                },
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
                backgroundColor: Colors.white,
                foregroundColor: Colors.red,
                icon: Icons.food_bank,
                label: 'Hidangkan',
              ),
            ],
          ),
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15)),
              color: (x.food_served == "0" ? Colors.red : Colors.white),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Nama: " + x.name),
                      Text("Makanan: " + x.food_name),
                      Text("No. Tiket: " + x.ticket_number),
                      Text(x.food_served == "0"
                          ? "Belum Dihidangkan"
                          : "Sudah Dihidangkan"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider();
      },
    );
  }
}
