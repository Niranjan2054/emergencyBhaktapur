import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:emergencyBhaktapur/Process/Storage.dart';
class APIRequest {
  APIRequest({this.st,this.apiUrl});
  String apiUrl,st;

  Storage storage;
  Future<String> getData() async {
    var response = await http.get(
      Uri.encodeFull(this.apiUrl),
      headers: {
        "Accept": "application/json",
      },
    );
    if (response.statusCode == 200) {
      print(response.body.toString());
      storage = new Storage(this.st);
      storage.writeData(response.body.toString());
    } else {
      print("Request failed with status:${response.statusCode}");
    }
  }
}