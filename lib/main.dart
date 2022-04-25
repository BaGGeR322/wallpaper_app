import 'package:flutter/material.dart';

import 'package:wallpaper_app/screens/wallpapers/wallpaper_page.dart';
import 'package:wallpaper_app/screens/detail_wallpaper/detail_wallpaper_page.dart';
import 'package:wallpaper_app/screens/add_new_wallpaper/add_new_wallpaper_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wallpaper app',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: WallpaperPage(),
      routes: {
        DetailWallpaperPage.routeName: (_) => DetailWallpaperPage(),
        AddNewWallpaperPage.routeName: (_) => AddNewWallpaperPage(),
      },
    );
  }
}
