import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weatherio/screens/loading_screen.dart';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future fetchData() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);

      return decodedData;
    } else {
      print(response.statusCode);
    }
  }
}
