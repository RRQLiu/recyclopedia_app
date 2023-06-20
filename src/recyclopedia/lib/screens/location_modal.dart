import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recyclopedia/widgets/all.dart';

/// LocationModal renders the item when a place is clicked. Currently not in use.
@Deprecated("use PlaceDetails in place_details.dart")
class LocationModal extends StatefulWidget {
  final String name;
  final String address;
  final String image;
  final Map<String, List<String>> howToFindBins;
  const LocationModal(this.name, this.address, this.image, this.howToFindBins,
      {super.key});

  @override
  State<LocationModal> createState() => _LocationModalState();
}

class _LocationModalState extends State<LocationModal> {
  late String selectedBin;

  @override
  void initState() {
    super.initState();
    selectedBin = widget.howToFindBins.keys.first;
  }

  @override
  Widget build(BuildContext context) {
    final String locationName = widget.name;
        final String locationAddress = widget.address;
    final String locationImage = widget.image;
    final Map<String, List<String>> howToFindBins = widget.howToFindBins;
    final List<String> bins = howToFindBins.keys.toList();
    List<String> howToFindBin = howToFindBins[selectedBin]!;
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
                  child: Heading1(locationName)),
              Container(
                child: Text(locationAddress,
                    style: GoogleFonts.poppins(
                        fontSize: 18.0, fontWeight: FontWeight.normal)),
              ),
              ItemPreview({"image": locationImage}),
              Expanded(
                // height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  // Let the ListView know how many items it needs to build.
                  itemCount: bins.length,
                  // Provide a builder function. This is where the magic happens.
                  // Convert each item into a widget based on the type of item it is.
                  itemBuilder: (context, index) {
                    // final item = bins[index];
                    // return Text("gesture");
                    return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedBin = bins[index];
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.green),
                            ),
                          ),
                          child: Text(
                            bins[index],
                            style: TextStyle(fontSize: 20),
                          ),
                        ));
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  // Let the ListView know how many items it needs to build.
                  itemCount: howToFindBin.length,
                  // Provide a builder function. This is where the magic happens.
                  // Convert each item into a widget based on the type of item it is.
                  itemBuilder: (context, index) {
                    return ListTile(
                        leading: CircleAvatar(child: Text(index.toString())),
                        title: Text(howToFindBin[index]));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class ItemModal extends StatelessWidget {
//   final String locationName;
//   final String locationImage;
//   final String locationAddress;
//   final Map<String, List<String>> locationInformation;

//   ItemModal(this.locationName, this.locationImage, this.locationAddress, this.locationInformation,
//       {super.key});

//   @override
//   Widget build(BuildContext context) {
//     // final ButtonStyle style = ElevatedButton.styleFrom(
//     //     textStyle: const TextStyle(fontSize: 20), alignment: Alignment.center);

//     return Material(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text(""),
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//         ),
//         body: Container(
//           padding: const EdgeInsets.only(left: 15, right: 15),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                   padding: const EdgeInsets.only(bottom: 15),
//                   child: Heading1(locationName)),
//               Container(
//                 child: Text(locationAddress,
//                     style: GoogleFonts.poppins(
//                         fontSize: 27.0, fontWeight: FontWeight.bold)),
//               ),
//               ItemPreview({"name": locationName, "image": locationImage}),
//               Container(
//                   padding: const EdgeInsets.only(top: 30, bottom: 15),
//                   child: Heading2("More information")),
//               Expanded(
//                 // height: 100,
//                 child: ListView.builder(
//                   scrollDirection: Axis.vertical,
//                   // Let the ListView know how many items it needs to build.
//                   itemCount: locationInformation.length,
//                   // Provide a builder function. This is where the magic happens.
//                   // Convert each item into a widget based on the type of item it is.
//                   itemBuilder: (context, index) {
//                     final item = locationInformation[index];
//                     return ListTile(
//                         leading: const Icon(Icons.recycling,
//                             color: Color(0xff5FA833)),
//                         title: Text(item));
//                   },
//                 ),
//               ),
//               Center(
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                       textStyle: const TextStyle(fontSize: 20),
//                       alignment: Alignment.center),
//                   onPressed: () {},
//                   child: const Text('Find Bin'),
//                 ),
//               ),
//               SizedBox(
//                 height: 50,
//               ),
//               Container(),
//               Container()
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
