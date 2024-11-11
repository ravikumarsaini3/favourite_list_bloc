import 'package:favourite_list/screen/favourite_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'favouritebloc/favouritebloc.dart';
import 'repositiory/favouritelistrepo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Favouritebloc(Favouritelistrepo()),
      child: MaterialApp(
          title: ' Favourite Appp ',
          themeMode: ThemeMode.dark,
          theme: ThemeData(
              // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
              brightness: Brightness.dark),
          home: const FavouriteListScreen()),
    );
  }
}
