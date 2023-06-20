import 'package:flutter/material.dart';
import 'package:recyclopedia/map_component/all.dart';
import 'package:recyclopedia/screens/all.dart';
import 'package:recyclopedia/screens/campus_map.dart';

/// MainPage hosts all components of the app, including a home page, a map page, and a resources page.
class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = Home();
        break;
      case 1:
        page = RecycleMapComponent();
        // page = CampusMap();
        break;
      case 2:
        page = ResourcesPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SafeArea(
            //   child: NavigationRail(
            //     extended: constraints.maxHeight >= 500,
            //     destinations: [
            //       NavigationRailDestination(
            //         icon: Icon(Icons.home),
            //         label: Text('Home'),
            //       ),
            //       NavigationRailDestination(
            //         icon: Icon(Icons.favorite),
            //         label: Text('Favorites'),
            //       ),
            //     ],
            //     selectedIndex: selectedIndex,
            //     onDestinationSelected: (value) {
            //       setState(() {
            //         selectedIndex = value;
            //       });
            //     },
            //   ),
            // ),
            Expanded(
              child: Container(
                // color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'map',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info_outline_rounded),
              label: 'resource',
            ),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
        ),
      );
    });
  }
}
