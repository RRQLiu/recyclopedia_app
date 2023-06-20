import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:recyclopedia/providers/category_provider.dart';
import 'package:recyclopedia/screens/all_categories.dart';
import 'package:recyclopedia/widgets/all.dart';


/// This widget is to render the default home page.
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var categoryProvider = context.watch<CategoryProvider>();
    var title = categoryProvider.title;
    var categories = categoryProvider.displayedCategories;

    return Center(
      // makes the home page scrollable
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // title "Popular categories", four default Popular categories, widget AllCategory
          children: [
            AppHeader(),
            SizedBox(height: 10),
            Text(title,
                style: GoogleFonts.poppins(
                    fontSize: 27.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: GridView.builder(
                    shrinkWrap: true,
                    // makes the popular category part not scrollable
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      childAspectRatio: 1 / 1.1,
                    ),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      Map item = categories[index];
                      return ClickableTrashItem(item);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  // TODO: Add transition to All Category view
                  child: Text("See All",
                      style: GoogleFonts.poppins(
                          fontSize: 15.0, fontWeight: FontWeight.bold)),
                ),
                AllCategory()
              ],
            )
          ],
        ),
      ),
    );
  }
}

