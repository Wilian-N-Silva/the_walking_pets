import 'dart:convert';

import 'package:the_walking_pets/constants/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:the_walking_pets/utilities/helpers/fakedata/user_data.dart';

class DonationAPI {
  static Future getDonationsByUser() async {
    Map<String, String> requestHeaders = {
      'content-type': 'application/json',
      'x-hasura-admin-secret': hasuraSecret,
    };

    return await http.get(
      Uri.parse('$baseUrl/api/rest/user/donation/list/${currentUser.id}'),
      headers: requestHeaders,
    );
  }

  static Future insertAdoption({
    required int animalId,
    required int partnerId,
  }) async {
    Map<String, String> requestHeaders = {
      'content-type': 'application/json',
      'x-hasura-admin-secret': hasuraSecret,
    };

    return await http.post(
      Uri.parse('$baseUrl/api/rest/adoption/insert'),
      headers: requestHeaders,
      body: jsonEncode({
        'id_animal': '$animalId',
        'id_partner': '$partnerId',
      }),
    );
  }
}
