import 'dart:convert';
import 'package:http/http.dart' as http;

class FetchHelper {

  final String parameters;

  FetchHelper({
    this.parameters = '',
  });

  Future<dynamic> getData() async {

    final fullUrl = 'https://api.giphy.com/v1/gifs/search?api_key=ha1Xx65kLE51wV1dDPIlw5WFe0NlREPd&q=$parameters&limit=12&offset=0&rating=g&lang=en';
    http.Response response = await http.get(Uri.parse(fullUrl));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return body;
    } else {
      print(response.statusCode);
    }
  }
}

class GifsService {
  Future<dynamic> getGifs(String parameter) async {

    FetchHelper fetchData = FetchHelper(parameters: parameter);
    var decodedData = await fetchData.getData();
    return decodedData;
  }


}