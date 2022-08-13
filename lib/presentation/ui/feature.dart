import 'package:cypressoft_practical_task/data/model/photoAlbumModel.dart';
import 'package:flutter/material.dart';
import '../../data/networkLayer/apiservices.dart';

class FeaturesPack extends StatefulWidget {
  FeaturesPack({required this.albumId, Key? key}) : super(key: key);
  int albumId;

  @override
  State<FeaturesPack> createState() => _FeaturesPackState();
}


class _FeaturesPackState extends State<FeaturesPack> {
  final ApiServices apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apiServices.getThePhotoAlbum(widget.albumId),
      builder: (BuildContext context, AsyncSnapshot<List<PhotoAlbums>> snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            height: 175,
            width: double.maxFinite,
            child: ListView.builder(
                itemCount: snapshot.data?.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  var currentAlbum = snapshot.data?[index];
                  return Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: SizedBox(
                      height: 150,
                      width: 150,
                      child: Image.network(
                        currentAlbum?.thumbnailUrl ?? "https://via.placeholder.com/150/92c952",
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
                }
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
