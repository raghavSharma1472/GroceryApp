import 'package:flutter/material.dart';
import 'package:groceryhome/constants/constants.dart';

class StoreCard extends StatelessWidget {
  final String storeName;
  final bool isOpen;
  final double rating;
  final double distance;
  StoreCard(
      {this.storeName = 'Dummy Store Name',
      this.isOpen = true,
      this.rating = 4.5,
      this.distance = 1.2});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 110.0,
            width: 110.0,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xA1DCEFF4), Color(0x00E7F8FC)],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0)),
            child: Center(
              child: Icon(
                Icons.broken_image,
                color: Colors.blue[300],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 7.0),
                Text(
                  storeName,
                  style: kHeadingText.copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5.0),
                if (isOpen)
                  Text(
                    'Open Now',
                    style: kHeadingText.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                        fontSize: 18.0),
                  )
                else
                  Text(
                    'Closed Now',
                    style: kHeadingText.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.red,
                        fontSize: 18.0),
                  ),
                SizedBox(height: 5.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '★ $rating ',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18.0,
                          fontFamily: 'book-antiqua'),
                    ),
                    Icon(
                      Icons.location_on,
                      color: Colors.blue,
                    ),
                    Text(
                      distance.toString() + ' km',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18.0,
                          fontFamily: 'book-antiqua'),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
