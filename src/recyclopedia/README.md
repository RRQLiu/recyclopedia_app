# Recyclopedia Details 

This file contains a detailed explaination of each of the components within this project. 

This folder is the **root folder** of the Flutter project, recyclopedia.

## API docs
[API documentation](https://raw.githack.com/BU-Spark/se-recyclopedia/dev/src/recyclopedia/doc/api/index.html)

### How to generate API docs
```bash
cd src/recyclopedia/
flutter pub get
export FLUTTER_ROOT=<Your Flutter SDK Path> # usually something like this: ~/.../flutter
$FLUTTER_ROOT/bin/cache/dart-sdk/bin/dart doc .
```

### Documentation Guide
[Effective Dart: Documentation](https://dart.dev/guides/language/effective-dart/documentation)

## Source File Structure
```
lib
├── all.dart
├── campus_map_unused
│   ├── all.dart
│   ├── area_location.dart
│   ├── area_location.g.dart
│   ├── campus_map.dart
│   ├── location_modal.dart
│   ├── location_provider.dart
│   └── navigate_to_location_modal.dart
├── global_configuration.dart
├── main.dart
├── map_component
│   ├── all.dart
│   ├── latlngJson.dart
│   ├── latlngJson.g.dart
│   ├── place_details.dart
│   ├── place_list.dart
│   ├── place_map.dart
│   ├── recycle_map_component.dart
│   ├── recycle_resource_place.dart
│   ├── recycle_resource_place.g.dart
│   └── stub_data.dart
├── models
│   ├── all.dart
│   ├── area_location.dart
│   ├── area_location.g.dart
│   └── resource_article.dart
├── providers
│   ├── assets_provider.dart
│   ├── category_provider.dart
│   └── location_provider.dart
├── screens
│   ├── all.dart
│   ├── all_categories.dart
│   ├── campus_map.dart
│   ├── home.dart
│   ├── item_modal.dart
│   ├── location_modal.dart
│   ├── main.dart
│   └── resources.dart
├── utils
│   ├── navigate_to_item_modal.dart
│   ├── navigate_to_location_modal.dart
│   └── navigate_to_map.dart
└── widgets
    ├── all.dart
    ├── app_header.dart
    ├── big_card.dart
    ├── clickable_trash_category.dart
    ├── heading1.dart
    ├── heading2.dart
    ├── item_preview.dart
    ├── news_card.dart
    └── resources_list.dart

```

## Assets Structure
```
assets
├── gsu.jpg
├── images
│   ├── Aluminum.png
│   ├── Balloons.png
│   ├── Batteries.png
│   ├── BerryBaskets.png
│   ├── Boxes.png
│   ├── Cans.png
│   ├── Cardboard.png
│   ├── Chopsticks.png
│   ├── FoodBox.png
│   ├── FoodCans.png
│   ├── GlassBottle.png
│   ├── Jars.png
│   ├── Jug.png
│   ├── Mail.png
│   ├── Paper.png
│   ├── PaperBags.jpg
│   ├── PaperCups.png
│   ├── PlasticBottle.png
│   ├── PlasticCups.jpg
│   ├── logo.jpg
│   ├── testimage.jpg
│   ├── testimage2.jpg
│   ├── testimage3.jpg
│   └── testimage4.jpg
├── map_markers
│   ├── blank_dark_blue.png
│   ├── blank_green.png
│   ├── blank_grey.png
│   ├── blank_light_blue.png
│   ├── blank_misc_hotel.png
│   ├── blank_orange.png
│   ├── blank_purple.png
│   ├── blank_red.png
│   └── information.png
├── recyclepedia_logo.jpg
└── warren.jpg
```

