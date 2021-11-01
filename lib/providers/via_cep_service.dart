import 'package:http/http.dart' as http;
import 'package:the_walking_pets/model/util/result_viacep.dart';

class ViaCepService {
  static Future<ResultViacep> fetchCep({required String cep}) async {
    final response =
        await http.get(Uri.parse('https://viacep.com.br/ws/$cep/json/'));
    if (response.statusCode == 200) {
      return ResultViacep.fromJson(response.body);
    } else {
      throw Exception('Requisição inválida!');
    }
  }
}
