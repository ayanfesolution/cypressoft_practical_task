part of 'album_list_bloc.dart';

abstract class AlbumListEvent extends Equatable {}

class GetPhotoAlbumEvent extends AlbumListEvent {
  final int? albumId;
  GetPhotoAlbumEvent({this.albumId});
  @override
  List<Object> get props => [albumId!];
}