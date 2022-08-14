part of 'album_id_bloc.dart';


abstract class AlbumIdState extends Equatable {
  @override
  List<Object> get props => [];
}

class AlbumIdInitial extends AlbumIdState {}

class GetAlbumIdLoading extends AlbumIdState {}

class GetAlbumIdSuccess extends AlbumIdState {
  final List<int>? albumId;
  GetAlbumIdSuccess({this.albumId});
  @override
  List<Object> get props => [albumId!];
}

class GetAlbumIdError extends AlbumIdState {
  final String? error;
  GetAlbumIdError({this.error});
  @override
  List<Object> get props => [error!];
}