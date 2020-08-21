import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:emergencyBhaktapur/Process/Storage.dart';
class APIRequest {
  List data;
  var itemCount;
  Storage storage = new Storage('db');

  Future<String> getData() async {
    var response = await http.get(
      Uri.encodeFull("http://neofusionsoc.com/fireBrigade"),
      headers: {
        "Accept": "application/json",
      },
    );
    if (response.statusCode == 200) {
      print(response.body.toString());
      storage.writeData(response.body.toString());
    } else {
      print("Request failed with status:${response.statusCode}");
    }
  }
}
