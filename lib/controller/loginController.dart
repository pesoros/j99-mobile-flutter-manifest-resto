import 'package:http/http.dart' as http;

login(String email, password) async {
  String url = "https://api.j99dev.my.id/resto/login";

  Uri parseUrl = Uri.parse(url);
  final response = await http.post(parseUrl, headers: {
    "Content-Type": "application/x-www-form-urlencoded"
  }, body: {
    "email": email,
    "password": password,
  });

  return response;
}
