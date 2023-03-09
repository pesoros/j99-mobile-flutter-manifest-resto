// ignore_for_file: non_constant_identifier_names

import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

changeStatus(String ticket_number) async {
  String url = dotenv.env['BASE_URL'] + "/resto/changestatus";
  // String url = "https://api.j99dev.my.id/resto/changestatus";

  Uri parseUrl = Uri.parse(url);
  final response = await http.post(parseUrl, headers: {
    "Content-Type": "application/x-www-form-urlencoded"
  }, body: {
    "ticket_number": ticket_number,
    "status": "1",
  });

  return response.statusCode;
}
