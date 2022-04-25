import 'package:flutter/material.dart';

class AddNewWallpaperPage extends StatelessWidget {
  static const routeName = '/add-new-wallpaper-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new wallpaper'),
        centerTitle: true,
      ),
    );
  }
}
