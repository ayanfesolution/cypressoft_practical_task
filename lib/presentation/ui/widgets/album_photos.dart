import 'package:carousel_slider/carousel_slider.dart';
import 'package:cypressoft_practical_task/data/model/photoAlbumModel.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import '../../../data/repository/album.repository.dart';

class AlbumPhotoLists extends StatefulWidget {
  const AlbumPhotoLists({required this.albumId, Key? key}) : super(key: key);
  final int albumId;

  @override
  State<AlbumPhotoLists> createState() => _AlbumPhotoListsState();
}

class _AlbumPhotoListsState extends State<AlbumPhotoLists> {
  final AlbumRepository apiServices = AlbumRepository();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apiServices.getThePhotoAlbum(widget.albumId),
      builder:
          (BuildContext context, AsyncSnapshot<List<PhotoAlbums>> snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            height: 175,
            width: double.maxFinite,
            child: CarouselSlider.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (BuildContext context, int index, int pageViewIndex){
                  var currentAlbum = snapshot.data?[index];
                  return SizedBox(
                    height: 150,
                    width: 150,
                    child: ExtendedImage.network(
                      currentAlbum?.thumbnailUrl ?? "",
                      cache: true,
                    ),
                  );
                },
                options: CarouselOptions(
                  enableInfiniteScroll: true,
                  scrollDirection: Axis.horizontal,
                  enlargeCenterPage: false,
                  viewportFraction: 0.45,
                  height: double.maxFinite,
                )
            ),
          );
        }
        if (snapshot.hasError) {
          return const Text('Error');
        }
        return Center(
          child: Column(
            children: const [
              CircularProgressIndicator(),
              SizedBox(
                height: 20.0,
              ),
              Text('Loading at the moment, please hold the line')
            ],
          ),
        );
      },
    );
  }
}
