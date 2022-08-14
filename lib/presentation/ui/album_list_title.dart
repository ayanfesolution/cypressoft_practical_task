import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/album_home_id_bloc/album_id_bloc.dart';
import '../utilities/constants.dart';
import 'album_photo_lists.dart';

class AlbumListTitle extends StatefulWidget {
  const AlbumListTitle({Key? key}) : super(key: key);

  @override
  State<AlbumListTitle> createState() => _AlbumListTitleState();
}

class _AlbumListTitleState extends State<AlbumListTitle> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AlbumIdBloc>(context).add(GetAlbumIdEvent());
  }

  List<int> _photoAlbums = [];
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title:  const Text('Practical Task'),
      ),
      body: BlocConsumer<AlbumIdBloc, AlbumIdState>(
          bloc: BlocProvider.of<AlbumIdBloc>(context),
          listener: (context, state) {
            if (state is GetAlbumIdError) {
              print(state.error);
            }
            if (state is GetAlbumIdSuccess) {
              _photoAlbums = state.albumId as List<int>;
            }
          },
          builder: (context, state) {
            print(state);
            if (state is GetAlbumIdLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return CarouselSlider.builder(
                itemCount: _photoAlbums.length,
                itemBuilder: (BuildContext context, int index, int pageViewIndex){
                  int num = _photoAlbums[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5, left: 8),
                        child: Text('Album Title $num', style: textTheme.headline5,),
                      ),
                      AlbumPhotoLists(albumNum: _photoAlbums[index]),
                      const Divider(
                        thickness: 2.5,
                        color: kLineColor,
                      )
                    ],
                  );
                },
                options: CarouselOptions(
                    enableInfiniteScroll: true,
                    scrollDirection: Axis.vertical,
                    enlargeCenterPage: false,
                    viewportFraction: 0.35,
                    height: double.maxFinite,
                    initialPage: 0
                )
            );
          }),
    );
  }
}
