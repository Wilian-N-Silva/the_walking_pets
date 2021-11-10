import 'package:the_walking_pets/constants/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:the_walking_pets/utilities/helpers/fakedata/user_data.dart';

class AnimalAPI {
  static Future getTasks() async {
    Map<String, String> requestHeaders = {
      'content-type': 'application/json',
      'x-hasura-admin-secret': hasuraSecret,
    };

    return await http.get(
      Uri.parse('$baseUrl/api/rest/user/animal/list/:${currentUser.id}'),
      headers: requestHeaders,
    );
  }
}
