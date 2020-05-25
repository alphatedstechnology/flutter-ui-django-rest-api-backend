import 'package:http/http.dart' as http;

class SearchService {
  static Future<String> searchDjangoApi(String query) async {
    String url = 'http://192.168.212.1:8000/api/books/?search=$query';
    http.Response response = await http.get(url);
    return response.body;
  }
}