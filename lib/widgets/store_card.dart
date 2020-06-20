import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:groceryhome/constants/constants.dart';
import 'package:groceryhome/screens/ParticularStoreScreen.id.dart';

class StoreCard extends StatelessWidget {
  final DocumentSnapshot storeData;
  StoreCard({this.storeData});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
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
                    storeData.data['name'],
                    style: kHeadingText.copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5.0),
                  if (storeData.data['isOpen'] ?? true)
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
                        '★ ${storeData.data['ratings'] ?? '4.5'}',
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
                        '${storeData.data['distance'] ?? '1.2'} km',
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
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ParticularStoreScreen(storeData: storeData)));
      },
    );
  }
}
