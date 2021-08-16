import 'package:http/http.dart' as http;
import 'dart:async';

void main(){
   deleteAlbum(1);
}

Future<http.Response> deleteAlbum(int id) async {
  final http.Response response = await http.delete(
      Uri.parse('https://jsonplaceholder.typicode.com/albums/$id'),
      headers: <String, String>{
         'Content-Type': 'application/json; charset=UTF-8'
      });
  return response;
}
