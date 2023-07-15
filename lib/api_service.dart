import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:humble/user_model.dart';

class APIService {

  Future<List<User>> fetchData() async {
    final response = await http.get(Uri.parse('https://reqres.in/api/users'));

    if (response.statusCode == 200) {
      List<User> users = [];
      var decodedResponse = jsonDecode(response.body) as Map;
      decodedResponse['data'].forEach((e) {
        users.add(User.fromJson(e));
      });
      return users;
    } else {
      // If the server did not return a successful response, throw an error
      throw Exception('Failed to load data');
    }
  }
}
