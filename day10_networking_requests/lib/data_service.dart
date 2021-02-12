import 'package:http/http.dart' as http;

class DataService {
  Future<String> makeRequestToAPI() async {
    // https://jsonplaceholder.typicode.com/users
    final baseURL = Uri.https('jsonplaceholder.typicode.com', '/users');
    final response = await http.get(baseURL);
    return response.body;
  }
}
