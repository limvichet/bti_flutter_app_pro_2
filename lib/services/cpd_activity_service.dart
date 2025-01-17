import "package:flutter/foundation.dart";
import 'package:http/http.dart' as http;
import '../models/cpd_activity_model.dart';

class CpdActivityService {
  static Future<CpdActivityModel> readData() async {
    setHeaders() => {
          'Content-type': 'application/json',
          'Accept': 'application/vnd.api+json',
        };
    http.Response response = await http.get(
        Uri.parse(
            'http://10.0.2.2:8000/api/public/cpd/search-box-cpd-activities'),
        headers: setHeaders());
    return compute(cpdActivityModelFromJson, response.body);
  }
}
