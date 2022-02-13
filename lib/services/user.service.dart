import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rgit_flutter/models/user.model.dart';

class UserService {
  Future<List<User>?> getUsers() async {
    List<User>? _users;
    try {
      final res = await http.get(
        Uri.parse('https://reqres.in/api/users'),
      );
      if (res.statusCode == 200) {
        final data = jsonDecode(res.body)['data'];
        _users = List<User>.from(
          data.map(
            (x) => User.fromMap(x),
          ),
        );
      }
    } catch (e) {
      throw Exception('Could not get users');
    }
    return _users;
  }

  Future<User?> getUserDetails(int id) async {
    User? _user;
    try {
      final res = await http.get(
        Uri.parse('https://reqres.in/api/users/$id'),
      );
      if (res.statusCode == 200) {
        final data = jsonDecode(res.body)['data'];
        _user = User.fromMap(data);
      }
    } catch (e) {
      throw Exception('Could not get user details');
    }
    return _user;
  }
}
