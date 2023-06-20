import 'package:flutter/material.dart';

/// The AssetsProvider provides tend to provide images across the app, currently only used for the app logo.
class AssetsProvider extends ChangeNotifier {
  Image appLogo = const Image(
  image: ExactAssetImage("/recyclepedia_logo.jpg"),
  height: 75.0,
  width: 75.0,
);
}