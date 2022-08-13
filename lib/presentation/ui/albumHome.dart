
import 'package:flutter/material.dart';
import '../../data/networkLayer/apiservices.dart';
import '../utilities/constants.dart';
import 'feature.dart';

class AlbumList extends StatefulWidget {
  const AlbumList({Key? key}) : super(key: key);

  @override
  State<AlbumList> createState() => _AlbumListState();
}

class _AlbumListState extends State<AlbumList> {
  final ApiServices apiServices = ApiServices();
  List albumList = [];

  @override
  void initState() {
    // TODO: implement initState
    initAction();
    super.initState();
  }

  Future<void> initAction() async {
    var list = await apiServices.getTheAlbumIdLists();
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
      body: ListView.builder(
          itemCount: albumList.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            int num = albumList[index] ?? 0;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 8),
                  child: Text('Album Title $num', style: textTheme.headline5,),
                ),
                FeaturesPack(albumId: num,),
                const Divider(
                  thickness: 2.5,
                  color: kLineColor,
                )
              ],
            );
          }),
      // FutureBuilder(
      //     future: apiServices.getTheAlbumIdLists(),
      //     builder: (BuildContext context, AsyncSnapshot<List<int>> snapshot) {
      //       if (snapshot.hasData) {
      //         ListView.builder(
      //             itemCount: snapshot.data?.length,
      //             shrinkWrap: true,
      //             itemBuilder: (BuildContext context, int index) {
      //               int num = snapshot.data?[index] ?? 0;
      //               return Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   Padding(
      //                     padding: const EdgeInsets.only(top: 5, left: 8),
      //                     child: Text('Album Title $num', style: textTheme.headline5,),
      //                   ),
      //                   FeaturesPack(albumId: num,),
      //                   const Divider(
      //                     thickness: 2.5,
      //                     color: kLineColor,
      //                   )
      //                 ],
      //               );
      //             });
      //       }
      //       if (snapshot.hasError) {
      //         return Text('Error');
      //       }
      //       return Center(
      //           child: Column(
      //             children: const [
      //               CircularProgressIndicator(),
      //               SizedBox(
      //                 height: 20.0,
      //               ),
      //               Text('Loading at the moment, please hold the line')
      //             ],
      //           )
      //       );
      //     }
      // ),
    );
  }
}
