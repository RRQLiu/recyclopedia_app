import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';
import 'package:recyclopedia/providers/category_provider.dart';
import 'package:recyclopedia/widgets/all.dart';

// TODO: each section is taking too much vertical space
// widget for showing all categories in alphabetical groups

/// The screen to show trash of all categories. 
class AllCategory extends StatelessWidget {
  AllCategory({super.key});
  @override
  Widget build(BuildContext context) {
    var categoryProvider = context.watch<CategoryProvider>();
    final groupedData = groupBy(categoryProvider.allCategories, (item) => item['name'][0]);

    return Column(
      // title "All Category", All Categories from database
      children: [
        SizedBox(height: 20),
        Text("All Category",
            style: GoogleFonts.poppins(
                fontSize: 27.0, fontWeight: FontWeight.bold)),
        Container(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 1 / 1.2,
              ),
              itemCount: groupedData.length, // Total number of sections
              itemBuilder: (BuildContext context, int sectionIndex) {
                final sectionName = groupedData.keys.toList()[sectionIndex];
                final sectionData = groupedData[sectionName]!;
                // the column that I can't limit it's height, bad column
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    // alphabetical section name
                    Text(sectionName),
                    // trying to do dynamic height, printing out values
                    // Text(MediaQuery.of(context).size.width.toString()),
                    // Text(((sectionData.length + 1) ~/2 *(MediaQuery.of(context).size.width / 2)).toString()),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 1 / 1.1,
                      ),
                      itemCount: sectionData.length,
                      itemBuilder: (context, index) {
                        Map item = sectionData[index];
                        return ClickableTrashItem(item);
                      },
                    ),
                  ],
                );
              }),
        ),
      ],
    );
  }
}
