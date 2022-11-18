import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'resources/local/dbs/app_db.dart';
import '../pages/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.I.registerSingleton<AppDatabase>(await $FloorAppDatabase.databaseBuilder('repository_app.db').build());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            appBarTheme: const AppBarTheme(color: Colors.white, elevation: 0)),
        home: const HomePage());
  }
}
