import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:groceryhome/widgets/store_card.dart';

class StoreList extends StatelessWidget {
  static List<DocumentSnapshot> documents;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('vendors').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) CircularProgressIndicator();
          if (snapshot.hasError)
            Text('Error while Loading :' + snapshot.error.toString());
          documents = snapshot.data.documents;
          List<StoreCard> stores = List();
          for (var document in documents) {
            stores.add(StoreCard(storeData: document
                // TODO Adding Ratings,isOpen and Image Url
                ));
          }
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start, children: stores);
        });
  }
}
