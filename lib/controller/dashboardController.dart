// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

import 'package:http/http.dart' as http;

getOrder(String date, restoId) async {
  String url = "https://api.j99dev.my.id/resto/order";

  Uri parseUrl = Uri.parse(url);
  final response = await http.post(parseUrl, headers: {
    "Content-Type": "application/x-www-form-urlencoded"
  }, body: {
    "date": date,
    "restoid": restoId,
  });

  var res = jsonDecode(response.body);

  List<Order> list = [];

  for (var data in res['data'] as List) {
    List<OrderDetail> listDetail = [];
    for (var order in data["order"] as List) {
      listDetail.add(
        OrderDetail(
          name: order["name"],
          ticket_number: order["ticket_number"],
          trip: order["trip"],
          food_name: order["food_name"],
          armada_class: order["armada_class"],
          armada: order["armada"],
          food_served: order["food_served"],
        ),
      );
    }
    list.add(Order(
      trip_assign: data["trip_assign"],
      trip_date: data["trip_date"],
      armada: data["armada"],
      order: listDetail,
    ));
  }

  return list;
}

class Order {
  String trip_assign;
  String trip_date;
  String armada;
  List<OrderDetail> order;
  Order({
    this.trip_assign,
    this.trip_date,
    this.armada,
    this.order,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'trip_assign': trip_assign,
      'trip_date': trip_date,
      'armada': armada,
      'order': order.map((x) => x.toMap()).toList(),
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      trip_assign: map['trip_assign'] as String,
      trip_date: map['trip_date'] as String,
      armada: map['armada'] as String,
      order: List<OrderDetail>.from(
        (map['order'] as List<int>).map<OrderDetail>(
          (x) => OrderDetail.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) =>
      Order.fromMap(json.decode(source) as Map<String, dynamic>);
}

class OrderDetail {
  String name;
  String ticket_number;
  String trip;
  String food_name;
  String armada_class;
  String armada;
  String food_served;
  OrderDetail({
    this.name,
    this.ticket_number,
    this.trip,
    this.food_name,
    this.armada_class,
    this.armada,
    this.food_served,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'ticket_number': ticket_number,
      'trip': trip,
      'food_name': food_name,
      'armada_class': armada_class,
      'armada': armada,
      'food_served': food_served,
    };
  }

  factory OrderDetail.fromMap(Map<String, dynamic> map) {
    return OrderDetail(
      name: map['name'] as String,
      ticket_number: map['ticket_number'] as String,
      trip: map['trip'] as String,
      food_name: map['food_name'] as String,
      armada_class: map['armada_class'] as String,
      armada: map['armada'] as String,
      food_served: map['food_served'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderDetail.fromJson(String source) =>
      OrderDetail.fromMap(json.decode(source) as Map<String, dynamic>);
}
