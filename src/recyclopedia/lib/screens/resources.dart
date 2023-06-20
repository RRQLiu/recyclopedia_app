import 'dart:convert';
import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recyclopedia/widgets/news_card.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'package:recyclopedia/widgets/ResourceClass.dart';

///Pull data from Strapi as list of Resource objects, store in hold.
///This is done as getAll() returns a future, and futures are not iterable.
Future<List<Resource>> getAll() async {
  List<Resource> hold = [];
  var data = await http.get(Uri.parse(
      "https://strapi-development-6fb1.up.railway.app/api/resources"));
  var jsonData = json.decode(data.body);

  final resources = jsonData['data'];
  for (var item in resources) {
    ;
    final attributes = item['attributes'];
    final format = Resource.fromJson(attributes);
    hold.add(format);
  }
  return hold;
}

/// This widget is responsible for rendering the resources page.
class ResourcesPage extends StatelessWidget {
  ///store getAll() in a Future, and use a FutureBuilder() to render the data once it arrives
  late final Future<List<Resource>> resources = getAll();

  ///For every item pulled from Strapi, render a NewsCard().
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF2F935C),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Recycling on Campus',
                style: GoogleFonts.poppins(fontSize: 27.0)),
          ],
        ),
        toolbarHeight: 210,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
      ),
      body: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  child: SingleChildScrollView(
                      child: FutureBuilder(
                          future: getAll(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              int count = 0;
                              for (var item in snapshot.data!) {
                                count++;
                              }
                              return ListView.builder(
                                  itemCount: count,
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return NewsCard(
                                      imgUrl: snapshot.data![index].imagePath,
                                      desc: snapshot.data![index].description,
                                      title: snapshot.data![index].title,
                                      postUrl: snapshot.data![index].link,
                                    );
                                  });
                            }
                            return Container(
                              child: const Center(
                                child: Text("Check Later For More"),
                              ),
                            );
                          })))
            ]),
      ),
    ));
  }
}
