import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_bloc_mvvm/model/user.dart';
import 'package:http/http.dart' as http;

class Service {
  Future<User> getData(int id) async {
    try {
      final uri = Uri.parse('https://reqres.in/api/users/$id');
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final object = jsonDecode(response.body);
        final user = (object as Map<String, dynamic>)['data'];
        return User.fromJson(user);
      } else {
        throw Exception('failed to load data');
      }
    } catch (e) {
      rethrow;
    }
  }
}
