import 'package:uuid/uuid.dart';

class WallpaperModel {
  final String id;
  final String nameWallpaper;
  final String fromUrlWallpaper;

  WallpaperModel({
    required this.id,
    required this.nameWallpaper,
    required this.fromUrlWallpaper,
  });
}

class WallpaperModelItems {
  final List<WallpaperModel> _items = [
    /// Проверка на работоспособность от URL
    WallpaperModel(
      id: const Uuid().v4(),
      nameWallpaper: 'Page 1',
      fromUrlWallpaper:
          'https://i.pinimg.com/originals/e4/82/f8/e482f8ee2b423e36210f49b23e0d9947.jpg',
    ),
    WallpaperModel(
      id: const Uuid().v4(),
      nameWallpaper: 'Page 2',
      fromUrlWallpaper:
          'https://3dnews.ru/assets/external/illustrations/2020/06/01/1012324/591.jpg',
    ),
    WallpaperModel(
      id: const Uuid().v4(),
      nameWallpaper: 'Page 3',
      fromUrlWallpaper:
          'https://img1.akspic.ru/previews/5/0/4/5/6/165405/165405-otrazhenie-planeta-voda-gidroresursy-zhidkiy-360x640.jpg',
    ),
    WallpaperModel(
      id: const Uuid().v4(),
      nameWallpaper: 'Page 4',
      fromUrlWallpaper:
          'https://wallpapershome.ru/images/pages/ico_v/21906.jpg',
    ),
    WallpaperModel(
      id: const Uuid().v4(),
      nameWallpaper: 'Page 5',
      fromUrlWallpaper:
          'https://i.artfile.ru/1920x1080_34131_[www.ArtFile.ru].jpg',
    ),
  ];

  List<WallpaperModel> get items => [..._items];

  void addToItems() {}

  void deleteFromItems() {}
}
