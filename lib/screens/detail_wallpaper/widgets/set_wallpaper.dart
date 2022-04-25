import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/file.dart';

enum WallpaperType { home, lock, both }

class SetWallpaper {
  static Future<String> setWallpaper(
      WallpaperType wallpaperType, File file, Size sizeDevice) async {
    const channel =
        MethodChannel('com.example.wallpaper_app/wallpaper_channel');
    try {
      final int result = await channel.invokeMethod('setWallpaper', [
        file.path,
        wallpaperType.index + 1,
        sizeDevice.width.toInt(),
        sizeDevice.height.toInt(),
      ]);
      print('Wallpaper Updated.... $result');
      if (result == 0) return 'Successful';
      return 'Error';
    } on PlatformException catch (e) {
      print("Failed to Set Wallpaper: '${e.message}'.");
      return 'Failed to Set Wallpaper: ${e.message}.';
    }
  }
}
