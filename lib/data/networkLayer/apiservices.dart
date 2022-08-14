import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../presentation/utilities/constants.dart';

class ApiServices {

  Future<dynamic> getThePhotoAlbum(int albumId) async {
    var url = Uri.parse(baseAlbumUrl+albumId.toString());
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      return body;
    } else {
      throw Exception("Something gone wrong, ${response.statusCode}");
    }
  }

  Future<dynamic> getAllThePhotoAlbumsIds() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/photos");
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      return body;
    } else {
      throw Exception("Something gone wrong, ${response.statusCode}");
    }
  }
}