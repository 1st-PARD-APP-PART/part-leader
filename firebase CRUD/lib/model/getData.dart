
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'model.dart';


class ItemProvider with ChangeNotifier {
  late CollectionReference itemsReference;
  List<ReadData> items = [];

  ItemProvider({reference}) {
    itemsReference = reference ?? FirebaseFirestore.instance.collection('user');
  }

  Future<void> fetchItems() async {
    items = await itemsReference.get().then( (QuerySnapshot results) {
      return results.docs.map( (DocumentSnapshot document) {
        return ReadData.fromSnapshot(document);
      }).toList();
    });
    notifyListeners();
  }
}
