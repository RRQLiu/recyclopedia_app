import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recyclopedia/all.dart';
import 'package:recyclopedia/map_component/recycle_map_component.dart';
import 'package:recyclopedia/utils/navigate_to_map.dart';
import 'package:recyclopedia/widgets/all.dart';

/// ItemModal renders an item when click on a specific item in homepage.
class ItemModal extends StatelessWidget {
  final String itemName;
  final String itemImage;
  final List<String> recycleInformation;

  const ItemModal(this.itemName, this.itemImage, this.recycleInformation,
      {super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20), alignment: Alignment.center);
        var mapState = Provider.of<MapState>(context);

    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text(""),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Heading1(itemName)),
              ItemPreview({"name": itemName, "image": itemImage}),
              Container(
                  padding: const EdgeInsets.only(top: 30, bottom: 15),
                  child: Heading2("More information")),
              Expanded(
                // height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  // Let the ListView know how many items it needs to build.
                  itemCount: recycleInformation.length,
                  // Provide a builder function. This is where the magic happens.
                  // Convert each item into a widget based on the type of item it is.
                  itemBuilder: (context, index) {
                    final item = recycleInformation[index];
                    return ListTile(
                        leading: const Icon(Icons.recycling,
                            color: Color(0xff5FA833)),
                        title: Text(item));
                  },
                ),
              ),
              Center(
                child: ElevatedButton(
                  style: style,
                  onPressed: () {
                    // TODO: API
                    // TODO: navigate back from Map
                    mapState.setSelectedCategory(PlaceCategory.binAvailable);
                    navigateToMap(context);
                    },
                  child: const Text('Find Bin'),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(),
              Container()
            ],
          ),
        ),
      ),
    );
  }
}
