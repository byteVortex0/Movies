import 'package:flutter/material.dart';

import 'core/services/sevices_locater.dart';
import 'core/utils/app_string.dart';
import 'movies/presentation/screens/movies_screen.dart';

void main() {
  ServicesLocater().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppString.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade900,
      ),
      home: const MoviesScreen(),
    );
  }
}
