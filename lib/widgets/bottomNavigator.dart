import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:groceryhome/screens/mapscreen.dart';

class BottomNavigator extends StatefulWidget {
  final List<DocumentSnapshot> documents;
  BottomNavigator(this.documents);
  @override
  _BottomNavigatorState createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  List<Color> navTab = [Colors.blue, Colors.blue, Colors.blue, Colors.blue];
  _tabColorSwitch(int index) {
    setState(() {
      navTab = [Colors.blue, Colors.blue, Colors.blue, Colors.blue];
      navTab[index] = Colors.grey[200];
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      // elevation: 20.0,
      color: Color(0xFFF7FBFC),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF40576E),
          // gradient: LinearGradient(
          //   colors: [Color(0xFFDCEFF4), Color(0xFAE7F8FC)],
          // ),
          borderRadius: BorderRadius.circular(30.0),
        ),
        height: 60.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            IconButton(
              iconSize: 30.0,
              padding: EdgeInsets.only(left: 28.0),
              icon: Icon(
                Icons.home,
                color: navTab[0],
              ),
              tooltip: 'Home',
              onPressed: () {
                _tabColorSwitch(0);
              },
            ),
            IconButton(
              iconSize: 30.0,
              padding: EdgeInsets.only(right: 28.0),
              icon: Icon(
                Icons.location_on,
                color: navTab[1],
              ),
              tooltip: 'Map',
              onPressed: () {
                _tabColorSwitch(1);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MapScreen(widget.documents)));
              },
            ),
            IconButton(
              iconSize: 30.0,
              padding: EdgeInsets.only(left: 28.0),
              icon: Icon(
                Icons.favorite,
                color: navTab[2],
              ),
              tooltip: 'Favourites',
              onPressed: () {
                {
                  _tabColorSwitch(2);
                }
              },
            ),
            IconButton(
              iconSize: 30.0,
              padding: EdgeInsets.only(right: 28.0),
              icon: Icon(
                Icons.person_pin,
                color: navTab[3],
              ),
              tooltip: 'Profile',
              onPressed: () {
                {
                  _tabColorSwitch(3);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
