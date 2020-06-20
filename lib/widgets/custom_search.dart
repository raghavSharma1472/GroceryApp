import 'package:flutter/material.dart';

class CustomSearch extends StatelessWidget {
  final String hint;
  final double horPadding;
  final double verPadding;
  CustomSearch({this.hint, this.horPadding, this.verPadding});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: horPadding, vertical: verPadding),
      child: Material(
        elevation: 3.0,
        borderRadius: BorderRadius.circular(24.0),
        child: TextField(
          style: TextStyle(color: Colors.blue, fontSize: 17.0),
          decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {}, //TODO Search
                color: Colors.blue,
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 18.0),
              hintText: hint,
              hintStyle: TextStyle(color: Colors.blue, fontSize: 17.0),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(24.0)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey[50]),
                  borderRadius: BorderRadius.circular(24.0))),
          onChanged: (value) {}, //TODO Add Suggetions
        ),
      ),
    );
  }
}
