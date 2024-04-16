import 'dart:convert';

import 'package:chat_app/global/enviroments.dart';
import 'package:chat_app/models/login_response.dart';
import 'package:chat_app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService with ChangeNotifier {
  late User user;

  bool _authenticate = false;

  bool get authenticate => _authenticate;

  set authenticate(bool value) {
    _authenticate = value;
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    authenticate = true;

    final data = {'email': email, 'password': password};

    final resp = await http.post(
      '${Enviroment.apiUrl}/login' as Uri,
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );

    authenticate = false;

    if (resp.statusCode == 200) {
      final loginResponse = loginResponseFromJson(resp.body);
      user = loginResponse.user;

      return true;
    } else {
      return false;
    }
  }
}
