import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/repository/album.repository.dart';

part 'album_id_event.dart';
part 'album_id_state.dart';

class AlbumIdBloc extends Bloc<AlbumIdEvent, AlbumIdState> {
  AlbumIdBloc() : super(AlbumIdInitial()) {
    on<GetAlbumIdEvent>((event, emit) async {
      emit(GetAlbumIdLoading());
      try {
        final data = await _albumRepository.getTheAlbumIdLists();
        emit(GetAlbumIdSuccess(albumId: data));
      } catch (e) {
        emit(GetAlbumIdError(error: e.toString()));
      }
    });
  }
  final AlbumRepository _albumRepository = AlbumRepository();
}