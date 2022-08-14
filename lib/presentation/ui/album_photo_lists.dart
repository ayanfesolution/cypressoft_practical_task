import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/album_list_bloc.dart';
import '../../data/model/photoAlbumModel.dart';

class AlbumPhotoLists extends StatefulWidget {
  AlbumPhotoLists({required this.albumId, Key? key}) : super(key: key);

  int albumId;

  @override
  State<AlbumPhotoLists> createState() => _AlbumPhotoListsState();
}

class _AlbumPhotoListsState extends State<AlbumPhotoLists> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AlbumListBloc>(context).add(GetPhotoAlbumEvent(albumId: widget.albumId));
  }

  List<PhotoAlbums> _photoAlbums = [];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 175,
      width: double.maxFinite,
      child: BlocConsumer<AlbumListBloc, AlbumListState>(
          bloc: BlocProvider.of<AlbumListBloc>(context),
          listener: (context, state) {
            if (state is GetPhotoAlbumError) {

            }
            if (state is GetPhotoAlbumSuccess) {
              _photoAlbums = state.photoAlbums!;
            }
          },
          builder: (context, state) {
            if (state is GetPhotoAlbumLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return CarouselSlider.builder(
                itemCount: _photoAlbums.length,
                itemBuilder: (context, index, pageIndex) {
                  print(_photoAlbums.length);
                  var currentAlbum = _photoAlbums[index];
                  return Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: SizedBox(
                      height: 150,
                      width: 150,
                      child: Image.network(
                        currentAlbum.thumbnailUrl ?? "",
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
                options: CarouselOptions(

                    scrollDirection: Axis.horizontal,
                    height: 200,
                    enableInfiniteScroll: true,
                    viewportFraction: 0.5
                ));
          }),
    );
  }
}
