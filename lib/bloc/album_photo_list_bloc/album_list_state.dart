part of 'album_list_bloc.dart';

abstract class AlbumListState extends Equatable {
  @override
  List<Object> get props => [];
}

class AlbumListInitial extends AlbumListState {}

class GetPhotoAlbumLoading extends AlbumListState {}

class GetPhotoAlbumSuccess extends AlbumListState {
  final List<PhotoAlbums>? photoAlbums;
  GetPhotoAlbumSuccess({this.photoAlbums});
  @override
  List<Object> get props => [photoAlbums!];
}

class GetPhotoAlbumError extends AlbumListState {
  final String? error;
  GetPhotoAlbumError({this.error});
  @override
  List<Object> get props => [error!];
}