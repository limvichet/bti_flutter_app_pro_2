
import "package:flutter/foundation.dart";
import 'package:flutter_auth_provider_app/models/user_model.dart';
import 'package:http/http.dart' as http;


class UserService {
  static Future<UserModel> readData(String userid) async {
      setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/vnd.api+json',
      };
    http.Response response =
       await http.get(Uri.parse('http://10.0.2.2:4000/api/userDetail/userId/' + userid), headers: setHeaders());
    return compute(userModelFromJson, response.body);
  }
  
}
