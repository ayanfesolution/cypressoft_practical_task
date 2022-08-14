part of 'album_id_bloc.dart';


abstract class AlbumIdEvent extends Equatable {}

class GetAlbumIdEvent extends AlbumIdEvent {
  final int? albumId;
  GetAlbumIdEvent({this.albumId});
  @override
  List<Object> get props => [albumId!];
}