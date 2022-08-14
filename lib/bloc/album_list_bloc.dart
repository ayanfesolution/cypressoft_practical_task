import 'package:bloc/bloc.dart';
import 'package:cypressoft_practical_task/data/model/photoAlbumModel.dart';
import 'package:cypressoft_practical_task/data/repository/album.repository.dart';
import 'package:equatable/equatable.dart';

part 'album_list_event.dart';
part 'album_list_state.dart';

class AlbumListBloc extends Bloc<AlbumListEvent, AlbumListState> {
  AlbumListBloc() : super(AlbumListInitial()) {
    on<GetPhotoAlbumEvent>((event, emit) async {
      emit(GetPhotoAlbumLoading());
      try {
        final data = await _albumRepository.getThePhotoAlbum(event.albumId!);
        emit(GetPhotoAlbumSuccess(photoAlbums: data));
      } catch (e) {
        emit(GetPhotoAlbumError(error: e.toString()));
      }
    });
  }
  final AlbumRepository _albumRepository = AlbumRepository();
}
