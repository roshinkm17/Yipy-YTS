import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  getData(String apiLink) async {
    http.Response response = await http.get(apiLink);
    if (response.statusCode == 200) {
      var data = response.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
      return "error 404";
    }
  }
}
