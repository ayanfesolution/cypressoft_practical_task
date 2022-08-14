import 'package:cypressoft_practical_task/bloc/album_home_id_bloc/album_id_bloc.dart';
import 'package:cypressoft_practical_task/bloc/album_photo_list_bloc/album_list_bloc.dart';
import 'package:cypressoft_practical_task/presentation/ui/album_list_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AlbumListBloc(),
          ),
          BlocProvider(
            create: (context) => AlbumIdBloc(),
          )
        ],
        child: MaterialApp(
          title: 'Practical Task',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.indigo,
          ),
          home: const AlbumListTitle(),
        ),
    );
  }
}