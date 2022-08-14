import 'package:cypressoft_practical_task/data/model/photoAlbumModel.dart';
import 'package:cypressoft_practical_task/data/networkLayer/apiservices.dart';

class AlbumRepository {
  final ApiServices _apiServices = ApiServices();

  Future<List<PhotoAlbums>> getThePhotoAlbum(int albumId) async {
    var data = await _apiServices.getThePhotoAlbum(albumId) as List;
    return data.map((dynamic json) {
      final albumData = json as Map<String, dynamic>;
      return PhotoAlbums(
        thumbnailUrl: albumData['thumbnailUrl'],
      );
    }).toList();
  }

  Future<List<PhotoAlbums>> getAllThePhotoAlbumsIds() async {
    var data = await _apiServices.getAllThePhotoAlbumsIds() as List;
    return data.map((dynamic json) {
      final albumData = json as Map<String, dynamic>;
      return PhotoAlbums(
        albumId: albumData['albumId'],
      );
    }).toList();
  }

  Future<List<int>> getTheAlbumIdLists() async {
    List<PhotoAlbums> idLists = await getAllThePhotoAlbumsIds();
    List<int> albumIds = [];
    for (var i = 0; i < idLists.length; i++) {
      albumIds.add(idLists[i].albumId ?? 0);
    }
    var uniqueList = albumIds.toSet().toList();
    return uniqueList;
  }
}
