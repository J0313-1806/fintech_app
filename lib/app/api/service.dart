import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:fintech_app/app/model/json_model.dart';

class Api {
  static String uri = "https://jsonplaceholder.typicode.com/posts";
  static Uri url = Uri.parse(uri);

  static Future<List<Model>> modelData() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final result = modelFromJson(response.body);
        return result;
      } else {
        log('StatusCode: ${response.statusCode}');
      }
    } catch (e) {
      log(e.toString());
    }
    return [];
  }
}
