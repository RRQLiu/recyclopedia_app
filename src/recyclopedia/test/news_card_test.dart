import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recyclopedia/screens/all.dart';
import 'package:recyclopedia/widgets/news_card.dart';
import 'package:test/test.dart';
import 'dart:convert';

void main() {
  testWidgets('NewsCard draws with image and title',
      (WidgetTester tester) async {
    await tester.pumpWidget(NewsCard(
      imgUrl: 'assets/images/defaultimage.jpg',
      desc: 'test',
      title: 'test',
      postUrl: 'test',
    ));

    Finder newscard_title = find.byKey(new Key('title'));
    await tester.enterText(newscard_title, "replaced text");

    Finder newscard_image = find.byKey(new Key('imagePath'));
    await tester.enterText(newscard_image, 'assets/images/testimage.jpg');
    await tester.pump();
  });
}
