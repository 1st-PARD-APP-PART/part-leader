import 'package:cloud_firestore/cloud_firestore.dart';

class ReadData {
  final String name;
  final int age;

  ReadData({required this.name, required this.age});

  factory ReadData.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return ReadData(name: data['name'], age: data['age']);
  }
}

void main() async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final CollectionReference users = firestore.collection('users');

  final QuerySnapshot querySnapshot = await users.get();
  final List<ReadData> usersList = querySnapshot.docs.map((doc) => ReadData.fromSnapshot(doc)).toList();

  print(usersList);
}
