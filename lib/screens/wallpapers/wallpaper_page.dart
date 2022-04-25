import 'package:flutter/material.dart';

import 'package:wallpaper_app/screens/wallpapers/model/wallpaper_model.dart';
import 'package:wallpaper_app/screens/wallpapers/widgets/grid_wallpaper.dart';
import 'package:wallpaper_app/screens/add_new_wallpaper/add_new_wallpaper_page.dart';

class WallpaperPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = WallpaperModelItems().items;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallpapers Page'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () =>
                Navigator.of(context).pushNamed(AddNewWallpaperPage.routeName),
          )
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: items.length,
        itemBuilder: (ctx, i) => GridWallpaper(items[i]),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 3 / 5,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}
