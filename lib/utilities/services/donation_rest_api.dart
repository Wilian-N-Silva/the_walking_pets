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
      Uri.parse('$baseUrl/user/donation/list/${currentUser.id}'),
      headers: requestHeaders,
    );
  }

  static Future insertAdoption(
      {required int animalId,
      required int partnerId,
      required int addressId,
      String? observations}) async {
    Map<String, String> requestHeaders = {
      'content-type': 'application/json',
      'x-hasura-admin-secret': hasuraSecret,
    };

    return await http.post(
      Uri.parse('$baseUrl/adoption/insert'),
      headers: requestHeaders,
      body: jsonEncode({
        'id_animal': '$animalId',
        'id_partner': '$partnerId',
        'id_address': '$addressId',
        'observations': observations
      }),
    );
  }
}
