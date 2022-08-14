import 'package:cypressoft_practical_task/bloc/album_home_id_bloc/album_id_bloc.dart';
import 'package:cypressoft_practical_task/presentation/ui/album_list_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import 'data/model/albumhive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(AlbumHiveAdapter());
  await Hive.openBox('albumList');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
            create: (context) => AlbumIdBloc(),
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