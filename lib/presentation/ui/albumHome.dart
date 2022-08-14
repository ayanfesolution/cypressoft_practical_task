
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/networkLayer/apiservices.dart';
import '../utilities/constants.dart';
import 'album_photo_lists.dart';
import 'feature.dart';

class AlbumList extends StatefulWidget {
  const AlbumList({Key? key}) : super(key: key);

  @override
  State<AlbumList> createState() => _AlbumListState();
}

class _AlbumListState extends State<AlbumList> {
  final ApiServices apiServices = ApiServices();
  List<int>  albumList = [];

  @override
  void initState() {
    // TODO: implement initState
    initAction();
    super.initState();
  }

  Future<void> initAction() async {
    var list = await apiServices.getTheAlbumIdLists();
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      albumList = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title:  const Text('Practical Task'),
      ),
      body: albumList.isNotEmpty ?
            CarouselSlider.builder(
                  itemCount: albumList.length,
                  itemBuilder: (BuildContext context, int index, int pageViewIndex){
                  int num = albumList[index];
                   return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                            Padding(
                                padding: const EdgeInsets.only(top: 5, left: 8),
                                child: Text('Album Title $num', style: textTheme.headline5,),
                             ),
                            AlbumPhotoLists(albumId: num,),
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
      ) :
            Center(
                child: Column(
                  children: const [
                        CircularProgressIndicator(),
                        SizedBox(
                          height: 20.0,
                      ),
                        Text('Loading at the moment, please hold the line')
                      ],
                 ),
         )
    );
  }
}
