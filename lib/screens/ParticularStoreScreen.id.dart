import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:groceryhome/widgets/storecontents.dart';
import 'package:groceryhome/widgets/storemap.dart';

class ParticularStoreScreen extends StatelessWidget {
  final DocumentSnapshot storeData;
  ParticularStoreScreen({this.storeData});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 3,
            child: StoreMap(
                storeData.data['latitude'],
                storeData.data['longitude'],
                storeData.data['name'],
                storeData.data['isOpen'] ?? 'Open Noww'),
          ),
          Container(child: StoreContents(storeData))
        ],
      ),
    );
  }
}
