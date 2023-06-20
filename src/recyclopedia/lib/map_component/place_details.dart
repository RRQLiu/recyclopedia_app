import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:recyclopedia/widgets/all.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:recyclopedia/map_component/recycle_resource_place.dart';
import 'package:recyclopedia/map_component/recycle_map_component.dart';
import 'stub_data.dart';

/// This widget is responsible to render the details of a selected place.
class PlaceDetails extends StatefulWidget {
  final RecycleResourcePlace place;

  const PlaceDetails({
    required this.place,
    super.key,
  });

  @override
  State<PlaceDetails> createState() => _PlaceDetailsState();
}

/// Take track of the state of which detail is selected.
class _PlaceDetailsState extends State<PlaceDetails> {
  late RecycleResourcePlace _place;
  int selectedBin = 0;
  GoogleMapController? _mapController;
  final Set<Marker> _markers = {};
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  Color selectedColor = Colors.green[700]!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_place.name),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
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
                  child: Heading1(_place.name)),
              Text(_place.address,
                  style: GoogleFonts.poppins(
                      fontSize: 18.0, fontWeight: FontWeight.normal)),
              ItemPreview({"image": _place.image}),
              Container(
                alignment: Alignment.center,
                height: 70,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  // Let the ListView know how many items it needs to build.
                  itemCount: _place.bins.length,
                  // Provide a builder function. This is where the magic happens.
                  // Convert each item into a widget based on the type of item it is.
                  itemBuilder: (context, index) {
                    // final item = bins[index];
                    // return Text("gesture");
                    return Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedBin = index;
                            });
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Colors.green),
                              ),
                            ),
                            child: 
                              Row(
                                children: [
                                  Text(
                                    _place.bins[index],
                                    style: GoogleFonts.poppins(
                      fontSize: 20.0, fontWeight: FontWeight.normal, color: Colors.green[700])
                                    // const TextStyle(fontSize: 20),
                                  ),
                                  SizedBox(width: 2,),
                                  Icon(CupertinoIcons.trash, color: Colors.green[700])
                                ],
                              ),
                          )),
                    );
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  // Let the ListView know how many items it needs to build.
                  itemCount: _place.directions[selectedBin].length,
                  // Provide a builder function. This is where the magic happens.
                  // Convert each item into a widget based on the type of item it is.
                  itemBuilder: (context, index) {
                    return ListTile(
                        leading: CircleAvatar(child: Text(index.toString())),
                        title: Text(_place.directions[selectedBin][index]));
                  },
                ),
              ),
            ],
          ),
        ),
      );
  
  }

  @override
  void initState() {
    _place = widget.place;
    _nameController.text = _place.name;
    _descriptionController.text = _place.description;
    return super.initState();
  }


}

// TODO:implement the thing here to help jump using _Map
// class nearestBin_Map extends StatelessWidget{

//   GoogleMapController? _mapController;
//   late RecycleResourcePlace _place;
//   final Set<Marker> _markers = {};
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       padding: const EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 12.0),
//       children: [
//         _Map(
//           center: _place.latLng,
//           mapController: _mapController,
//           onMapCreated: _onMapCreated,
//           markers: _markers,
//         ),
//       ],
//     );
    
//   }

//   void _onMapCreated(GoogleMapController controller) {
//     _mapController = controller;
//       setState(() {
//       _markers.add(Marker(
//         markerId: MarkerId(_place.latLng.toString()),
//         position: _place.latLng,
//       ));
//     });
//   }

// }

/// This map is independent from the big map, used as a child of other components, only displaying marker on the map for 1 place.
class _Map extends StatelessWidget {
  final LatLng center;

  final GoogleMapController? mapController;
  final ArgumentCallback<GoogleMapController> onMapCreated;
  final Set<Marker> markers;

  const _Map({
    required this.center,
    required this.mapController,
    required this.onMapCreated,
    required this.markers,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      elevation: 4,
      child: SizedBox(
        width: 340,
        height: 240,
        child: GoogleMap(
          onMapCreated: onMapCreated,
          initialCameraPosition: CameraPosition(
            target: center,
            zoom: 16,
          ),
          markers: markers,
          zoomGesturesEnabled: false,
          rotateGesturesEnabled: false,
          tiltGesturesEnabled: false,
          scrollGesturesEnabled: false,
        ),
      ),
    );
  }
}

