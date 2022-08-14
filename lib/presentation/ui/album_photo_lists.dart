import 'package:carousel_slider/carousel_slider.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/album_photo_list_bloc/album_list_bloc.dart';
import '../../data/model/photoAlbumModel.dart';

class AlbumPhotoLists extends StatefulWidget {
  const AlbumPhotoLists({required this.albumNum, Key? key}) : super(key: key);

  final int albumNum;

  @override
  State<AlbumPhotoLists> createState() => _AlbumPhotoListsState();
}

class _AlbumPhotoListsState extends State<AlbumPhotoLists> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AlbumListBloc>(context).add(GetPhotoAlbumEvent(albumId: widget.albumNum));
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
                  var currentAlbum = _photoAlbums[index];
                  print(currentAlbum.thumbnailUrl);
                  return Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: SizedBox(
                      height: 150,
                      width: 150,
                      child: ExtendedImage.network(
                        currentAlbum.thumbnailUrl ?? "",
                        cache: true,
                        enableMemoryCache: true,

                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                    scrollDirection: Axis.horizontal,
                    initialPage: 2,
                    height: 200,
                    enableInfiniteScroll: true,
                    viewportFraction: 0.5
                ));
          }),
    );
  }
}
