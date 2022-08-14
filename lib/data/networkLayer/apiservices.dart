import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../../presentation/utilities/constants.dart';
import '../model/photoAlbumModel.dart';

class ApiServices {

  Future<dynamic> getThePhotoAlbum(int albumId) async {
    var url = Uri.parse("$baseAlbumUrl$albumId");
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      return body;
    } else {
      throw Exception("Something gone wrong, ${response.statusCode}");
    }
  }


  Future<List<PhotoAlbums>> getAllThePhotoAlbumsIds() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/photos");
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print('Get photo IDs: Response status: ${response.statusCode}');
        print('Get photo IDs  : Response body: ${response.body}');
      }
      final body = json.decode(response.body) as List;
      return body.map((dynamic json) {
        final albumData = json as Map<String, dynamic>;
        return PhotoAlbums(
            albumId: albumData['albumId'],
        );
      }).toList();
    } else {
      throw Exception("Something gone wrong, ${response.statusCode}");
    }
  }

  Future<List<int>> getTheAlbumIdLists() async {
    List<PhotoAlbums> idLists = await getAllThePhotoAlbumsIds();
    List<int> albumIds = [];
    for (var i = 0; i < idLists.length; i++) {
      // TO DO
      albumIds.add(idLists[i].albumId ?? 0);
    }
    var uniqueList = albumIds.toSet().toList();
    print(uniqueList);
    return uniqueList;
  }

}