import 'package:flutter/material.dart';

class BottomNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      // elevation: 20.0,
      color: Color(0xFFF7FBFC),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black87,
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
                color: Colors.blue,
              ),
              onPressed: () {},
            ),
            IconButton(
              iconSize: 30.0,
              padding: EdgeInsets.only(right: 28.0),
              icon: Icon(
                Icons.location_on,
                color: Colors.blue,
              ),
              onPressed: () {},
            ),
            IconButton(
              iconSize: 30.0,
              padding: EdgeInsets.only(left: 28.0),
              icon: Icon(
                Icons.favorite,
                color: Colors.blue,
              ),
              onPressed: () {},
            ),
            IconButton(
              iconSize: 30.0,
              padding: EdgeInsets.only(right: 28.0),
              icon: Icon(
                Icons.person_pin,
                color: Colors.blue,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
