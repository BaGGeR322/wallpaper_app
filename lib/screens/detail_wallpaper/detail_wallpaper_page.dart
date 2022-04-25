import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:wallpaper_app/screens/detail_wallpaper/widgets/set_wallpaper.dart';

import 'package:wallpaper_app/screens/wallpapers/model/wallpaper_model.dart';
import 'package:wallpaper_app/services/ui.dart';

class DetailWallpaperPage extends StatefulWidget {
  static const routeName = '/detail-wallpaper-page';

  @override
  State<DetailWallpaperPage> createState() => _DetailWallpaperPageState();
}

class _DetailWallpaperPageState extends State<DetailWallpaperPage> {
  String url =
      'https://images.unsplash.com/photo-1635593701810-3156162e184f'; // for test
  String liveUrl =
      'https://github.com/codenameakshay/sample-data/raw/main/video3.mp4'; // for test

  @override
  Widget build(BuildContext context) {
    final takeArguments =
        ModalRoute.of(context)!.settings.arguments as List<dynamic>;
    final takeModel = takeArguments[0] as WallpaperModel;
    final takeNetworkImage = takeArguments[1] as Image;
    return Scaffold(
      appBar: AppBar(
        title: Text(takeModel.nameWallpaper),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            takeNetworkImage,
            ElevatedButton(
              child: Text('Set Wallpaper To HOME!'),
              onPressed: () async {
                var file = await DefaultCacheManager()
                    .getSingleFile(takeModel.fromUrlWallpaper);
                final result = await SetWallpaper.setWallpaper(
                  WallpaperType.home,
                  file,
                  MediaQuery.of(context).size,
                );
                if (result == 'Successful') {
                  Ui.showSnackBar(context, 'Wallpaper installed successfully');
                } else if (result == 'Error') {
                  Ui.showSnackBar(context, 'Error: Wallpaper has not been set');
                } else {
                  Ui.showSnackBar(context, 'Error: $result');
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
