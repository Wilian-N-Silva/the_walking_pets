import 'package:the_walking_pets/constants/app_constants.dart';
import 'package:http/http.dart' as http;

class AdoptionAPI {
  static Future getAdoptionList() async {
    Map<String, String> requestHeaders = {
      'content-type': 'application/json',
      'x-hasura-admin-secret': hasuraSecret,
    };

    return await http.get(
      Uri.parse('$baseUrl/adoption/list'),
      headers: requestHeaders,
    );
  }
}
