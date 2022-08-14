
import 'package:cypressoft_practical_task/data/model/photoAlbumModel.dart';
import 'package:hive/hive.dart';

part 'albumhive.g.dart';

@HiveType(typeId: 1)
class AlbumHive extends HiveObject{
  
  @HiveField(1)
  late List<int> albumIds;

  @HiveField(2)
  late List<PhotoAlbums> albumLists;
}