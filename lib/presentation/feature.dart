import 'package:flutter/material.dart';

class FeaturesPack extends StatefulWidget {
  FeaturesPack({required this.albumId, Key? key}) : super(key: key);
  int albumId;

  @override
  State<FeaturesPack> createState() => _FeaturesPackState();
}

class _FeaturesPackState extends State<FeaturesPack> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Album Title ${widget.albumId}'),
        ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 150,
                width: 150,
                child: Image.network(''),
              );
            }
        )
      ],
    );
  }
}
