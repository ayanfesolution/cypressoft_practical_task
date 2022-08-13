part of 'album_list_bloc.dart';

abstract class AlbumListState extends Equatable {
  const AlbumListState();
}

class AlbumListInitial extends AlbumListState {
  @override
  List<Object> get props => [];
}
