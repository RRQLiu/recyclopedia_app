import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:recyclopedia/providers/assets_provider.dart';
import 'package:recyclopedia/providers/category_provider.dart';

/// The AppHeader holds a general header style of the app, 
/// Map component and resource component have their own header style built in their widgets.
class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var categoryProvider = context.watch<CategoryProvider>();
    var assetsProvider = context.watch<AssetsProvider>();
    var appLogo = assetsProvider.appLogo;
    return AppBar(
      title: Column(
        children: [
          SizedBox(height: 30),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Flexible(child: appLogo),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('recyclopedia', style: GoogleFonts.poppins(fontSize: 27.0)),
              Text('your campus recycling tool',
                  style: GoogleFonts.poppins(fontSize: 15.0)),
            ])
          ]),
          // SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              onChanged: (value) => categoryProvider.search(value),
              decoration: InputDecoration(
                  filled: true,
                  border: OutlineInputBorder(),
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search...'),
            ),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
      backgroundColor: Color(0XFF2F935C),
      toolbarHeight: 210,
    );
  }
}
