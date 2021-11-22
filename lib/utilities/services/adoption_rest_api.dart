import 'package:the_walking_pets/constants/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:the_walking_pets/model/animal/enrollment.dart';

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

  static Future insertEnrollment(Enrollment enrollment) async {
    Map<String, String> requestHeaders = {
      'content-type': 'application/json',
      'x-hasura-admin-secret': hasuraSecret,
    };

    return await http.post(
      Uri.parse('$baseUrl/adoption/enroll'),
      headers: requestHeaders,
      body: enrollment.toJson(),
    );
  }
}
