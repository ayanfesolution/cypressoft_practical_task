import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../presentation/utilities/constants.dart';

class ApiServices {

  Future getThePhotoAlbum(albumId) async {

    http.Response response = await http.get(Uri.parse(baseAlbumUrl+'?albumId='+albumId));

    if (response.statusCode == 200) {
      //var decodeData = jsonDecode(response.body);
      if (kDebugMode) {
        print('Get Photo Album : Response status: ${response.statusCode}');
        print('Get Photo Album : Response body: ${response.body}');
      }

      return response.body;
    } else {
      if (kDebugMode) {
        print('GGet Photo Album : Response status: ${response.statusCode}');
        print('Get Photo Album : Response body: ${response.body}');
      }
    }
  }

}