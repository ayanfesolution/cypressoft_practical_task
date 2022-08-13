import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'album_list_event.dart';
part 'album_list_state.dart';

class AlbumListBloc extends Bloc<AlbumListEvent, AlbumListState> {
  AlbumListBloc() : super(AlbumListInitial());

  @override
  Stream<AlbumListState> mapEventToState(
    AlbumListEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
