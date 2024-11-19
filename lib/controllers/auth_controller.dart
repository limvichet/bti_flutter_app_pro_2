import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_auth_provider_app/screens/main_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> loginWithName() async {
    var headers = {'Content-Type': 'application/json'};

    try {
      // var url = Uri.parse('http://96.9.66.154:8070/api/public/login');
      // var url = Uri.parse('http://10.0.2.2:8000/api/public/login');
      var url = Uri.parse('http://10.0.2.2:4000/api/auth/login');
      Map body = {
        'email': nameController.text,
        'password': passwordController.text
      };

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        var token = json['token'];
        var email = json['user']['email'];
        var username =
            json['user']['firstname'] + " " + json['user']['lastname'];
        var userid = json['user']['_id'];

        print(username);

        final SharedPreferences? prefs = await _prefs;

        await prefs?.setString('token', token);
        await prefs?.setString('email', email);
        await prefs?.setString('username', username);
        await prefs?.setString('userid', userid);

        nameController.clear();
        passwordController.clear();
        //gohome
        Get.off(MainScreen());
      } else {
        throw jsonDecode(response.body)['message'] ?? "Unknow Error Occured";
      }
    } catch (e) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text('Error'),
              contentPadding: EdgeInsets.all(20),
              children: [Text(e.toString())],
            );
          }); // TODO
    }
  }
}
