import 'package:flutter/material.dart';
import 'package:groceryhome/constants/constants.dart';
import 'package:groceryhome/providers/user_data.dart';
import 'package:groceryhome/screens/FirstScreen.dart';
import 'package:groceryhome/widgets/custom_heading.dart';
import 'package:groceryhome/widgets/store_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static final String id = 'homepage';
  void getCurrentUser(context) async {
    FirebaseUser currentUser;
    currentUser = await FirebaseAuth.instance.currentUser();
    print('${currentUser.displayName} connected');
  }

  @override
  Widget build(BuildContext context) {
    getCurrentUser(context);
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
                    onPressed: (() async {
                      if (context.read<UserData>().isConnected)
                        // CircularProgressIndicator();
                        await FirebaseAuth.instance.signOut();
                      print('User Signed Out');
                      Navigator.pushNamedAndRemoveUntil(
                          context, FirstScreen.id, (route) => false);
                      context.read<UserData>().toggleConnected();
                      context.read<UserData>().storeUserDataLocally('', '');
                    }))
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
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
                    hintText: 'Search Products or Stores ',
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
          ),
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
          Padding(
            padding: EdgeInsets.all(10.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              for (int i = 0; i < 20; i++) ...[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: StoreCard(), //TODO Adding Individual Store Names
                )
              ],
            ]),
          ),
        ],
      ),
    );
  }
}
