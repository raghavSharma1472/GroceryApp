import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:groceryhome/constants/constants.dart';
import 'package:groceryhome/widgets/custom_search.dart';
import 'package:groceryhome/widgets/social_media_circle.dart';
import 'package:url_launcher/url_launcher.dart';

class StoreContents extends StatelessWidget {
  final DocumentSnapshot storeData;
  StoreContents(this.storeData);

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(storeData.data['name'],
                      style: kHeadingText.copyWith(
                          fontWeight: FontWeight.w600, fontSize: 25.0)),
                ],
              ),
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
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '★ ${storeData.data['ratings'] ?? '4.5'}',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18.0,
                    fontFamily: 'book-antiqua'),
              ),
              Wrap(
                children: <Widget>[
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
              ),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  SocialMediaCircle(
                    mainColor: Colors.blue,
                    iconColor: Colors.white,
                    borderColor: Colors.blue,
                    containedIcon: Icons.call,
                    onPressed: () =>
                        _makePhoneCall('tel:${storeData.data['phone']}'),
                  ),
                  Text(
                    'Call',
                    style: kHeadingText,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  SocialMediaCircle(
                    mainColor: Colors.blue,
                    iconColor: Colors.white,
                    borderColor: Colors.blue,
                    containedIcon: Icons.mail_outline,
                    onPressed: () =>
                        _makePhoneCall('mailto:<${storeData.data['email']}>'),
                  ),
                  Text(
                    'Mail',
                    style: kHeadingText,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  SocialMediaCircle(
                    mainColor: Colors.blue,
                    iconColor: Colors.white,
                    borderColor: Colors.blue,
                    containedIcon: Icons.bookmark_border,
                  ),
                  Text(
                    'Save',
                    style: kHeadingText,
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            ],
          ),
          Divider(),
          CustomSearch(
            hint: 'Search Products',
            horPadding: 0.0,
            verPadding: 0.0,
          ),

          // DefaultTabController(
          //     length: 2,
          //     initialIndex: 1,
          //     child: TabBar(tabs: [
          //       Padding(
          //         padding: const EdgeInsets.all(8.0),
          //         child: Text('Popular Items', style: kHeadingText),
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.all(8.0),
          //         child: Text(
          //           'Discounts',
          //           style: kHeadingText,
          //         ),
          //       )
          //     ])),
          GridView.count(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              children: List.generate(6, (index) => ItemCard())),
        ],
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          height: 100.0,
          width: 100.0,
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
      ],
    );
  }
}
