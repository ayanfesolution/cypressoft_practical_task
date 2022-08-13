import 'package:flutter/material.dart';
import 'presentation/ui/albumHome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practical Task',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.indigo,
      ),
      home: AlbumList(),
    );
  }
}