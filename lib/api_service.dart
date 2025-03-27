import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://localhost:3000';

  Future<String> getTest() async {
    final response = await http.get(Uri.parse('$baseUrl/'));
    if (response.statusCode == 200) {
      return response.body; // Retorna a resposta da API
    } else {
      throw Exception('Erro ao buscar dados');
    }
  }
}
