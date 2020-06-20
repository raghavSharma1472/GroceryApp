import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:groceryhome/constants/constants.dart';
import 'package:groceryhome/providers/user_data.dart';
import 'package:groceryhome/widgets/custom_heading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:groceryhome/widgets/custom_search.dart';
import 'package:groceryhome/widgets/store_list.dart';
import 'package:provider/provider.dart';
import 'package:groceryhome/services/signingOut.dart';
import 'package:geolocator/geolocator.dart';
import 'package:groceryhome/widgets/bottomNavigator.dart';

import '../providers/user_data.dart';
import '../providers/user_data.dart';

FirebaseUser currentUser;
final _firestore = Firestore.instance;

class HomePage extends StatelessWidget {
  static final String id = 'homepage';
  final _auth = FirebaseAuth.instance;
  static double dummyLat;
  static double dummyLon;
  void getCurrentLocation(context)async{
    FirebaseUser loggedInUser ;
    loggedInUser = await _auth.currentUser();
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    try{
      _firestore.collection('users').document(loggedInUser.email).updateData({
        'latitude':position.latitude,
        'longitude':position.longitude,
      });
    }catch(e){
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    getCurrentLocation(context);
    return Scaffold(
      backgroundColor: Color(0xFFF7FBFC),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: Colors.blue,
                    ),
                    onPressed: null), //TODO Navigation Drawer
                IconButton(
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Colors.blue,
                    ),
                    onPressed: () => SignOutUser().signOutUser(context))
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
            child: Text(
              'Welcome ${context.watch<UserData>().getName ?? 'User'},',
              style: kHeadingText.copyWith(fontSize: 30.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: Text(
              'Find the daily essentials that you want',
              style: TextStyle(color: Colors.blueGrey[200], fontSize: 15.0),
            ),
          ),
          CustomSearch(
              hint: 'Search Products or Stores ',
              horPadding: 20.0,
              verPadding: 25.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.0),
            child: CustomHeading(
                heading: 'Top Selling',
                suffixText: 'ViewAll',
                onPressedSuffixTextCallback: () {}),
          ),
          SizedBox(
            height: 179.0,
            width: double.infinity,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, value) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    height: 139.0,
                    width: 139.0,
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
                    )),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.0),
            child: CustomHeading(
                heading: 'Near You',
                suffixText: 'ViewAll',
                onPressedSuffixTextCallback:
                    () {}), //TODO View All Nearby Stores
          ),
          Padding(padding: EdgeInsets.all(10.0), child: StoreList()),
        ],
      ),
      floatingActionButton: Container(
        height: 55.0,
        width: 55.0,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {},
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
            // elevation: 30.0,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigator(StoreList.documents),
    );
  }
}
