import 'package:the_walking_pets/constants/app_constants.dart';
import 'package:the_walking_pets/model/util/address.dart';
import 'package:http/http.dart' as http;
import 'package:the_walking_pets/utilities/helpers/fakedata/user_data.dart';

class UserAPI {
  static Future getAddressesByUser() async {
    Map<String, String> requestHeaders = {
      'content-type': 'application/json',
      'x-hasura-admin-secret': hasuraSecret,
    };

    return await http.get(
      Uri.parse('$baseUrl/user/address/list/${currentUser.id}'),
      headers: requestHeaders,
    );
  }

  static Future insertAddress(Address address) async {
    Map<String, String> requestHeaders = {
      'content-type': 'application/json',
      'x-hasura-admin-secret': hasuraSecret,
    };

    return await http.post(
      Uri.parse('$baseUrl/user/address/insert'),
      headers: requestHeaders,
      body: address.toJson(),
    );
  }
}
