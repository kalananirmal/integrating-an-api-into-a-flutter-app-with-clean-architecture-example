import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:Users/config.dart';
import 'package:Users/models/user.dart';

class UsersServices {
  static Future<List<User>?> getUsers() async {
    final response = await http.get(Uri.parse(Config.BACKEND_URL));

    if (response.statusCode == 200) {
      return jsonDecode(response.body).map<User>((data) {
        return User.fromJson(data);
      }).toList();
    }
    return null;
  }
}
