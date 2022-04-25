import 'package:flutter/material.dart';

import 'package:wallpaper_app/screens/wallpapers/model/wallpaper_model.dart';
import 'package:wallpaper_app/screens/detail_wallpaper/detail_wallpaper_page.dart';

class GridWallpaper extends StatelessWidget {
  GridWallpaper(this.model);

  final WallpaperModel model;

  @override
  Widget build(BuildContext context) {
    final sizeDevice = MediaQuery.of(context).size;
    Image image = Image.network(
      model.fromUrlWallpaper,
      width: sizeDevice.width,
      height: sizeDevice.height,
      fit: BoxFit.cover,
    );
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(
        DetailWallpaperPage.routeName,
        arguments: [model, image],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(8.0),
        ),
        child: FittedBox(
          fit: BoxFit.cover,
          child: image,
        ),
      ),
    );
  }
}
