import 'dart:convert';
import 'dart:io';
import 'dart:async';


class Digimon {
  final String name;
  String imageUrl;
  String apiname;
  String levelDigimon;

  int rating = 10;

  Digimon(this.name);

  Future getImageUrl() async {
    if (imageUrl != null) {
      return;
    }

    HttpClient http = new HttpClient();
    try {
      apiname = name.toLowerCase();
      var uri = new Uri.https('www.mockachino.com', '/a7c6b2c6-280a-41/$apiname');
      var request = await http.getUrl(uri);
      var response = await request.close();
      var responseBody = await response.transform(utf8.decoder).join();

      Map<String, dynamic> data = json.decode(responseBody);
      imageUrl = data['img'];
      levelDigimon = data["level"];

      print(levelDigimon);
    } catch (exception) {
      print(exception);
    }
  }
}
