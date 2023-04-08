import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/update.dart';

class ReadPage extends StatefulWidget {
  const ReadPage({super.key});

  @override
  State<ReadPage> createState() => _ReadPageState();
}

class _ReadPageState extends State<ReadPage> {
  FirebaseFirestore DB = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final docRef =
        DB.collection("user").doc(''); // 읽어오고 싶은 collection과 문서의 이름을 넣어서 불러온다.

    final usersRef = FirebaseFirestore.instance
        .collection('user'); //읽어오고 싶은 collection의 이름을 넣어서 불러온다.

    final CollectionReference collection = FirebaseFirestore.instance
        .collection(
            'user'); // FutureBuilder가 읽어올 user collection reference를 읽어온다.

    return Scaffold(
      appBar: AppBar(
        title: const Text('ReadData'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UpdatePage()),
              );
            },
            child: const Text(
              '수정하기',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            FutureBuilder<QuerySnapshot>(
              future: collection
                  .get(), // user Collection의 저장된 내용을 snapshot으로 Future로 한번만 읽어온다.
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}'); // error가 있을 때
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // 로딩 중일 떄 화면
                  return const Text('Loading...');
                }
                return SizedBox(
                  height: 300,
                  child: ListView(
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data() as Map<String, dynamic>;
                      return ListTile(
                        title: Text(data[
                            'Name']), // 문서의 map형식으로 읽어온 data를 []에 Field 이름을 입력하여 읽어올 수 있다.
                        subtitle: Text(data['Age']),
                      );
                    }).toList(),
                  ),
                );
              },
            ),

            // StreamBuilder<QuerySnapshot>(  // Cloud Firestore의 문서들을 캡슐화하고, 문서의 데이터 및 메타데이터에 대한 정보를 쿼리의 결과로 반환하여 읽어온다.
            //     stream: FirebaseFirestore.instance.collection('user').snapshots(), // user Collection의 저장된 내용을 snapshot으로 실시간 읽어온다.
            //     builder: (context, snapshot) {
            //       if (!snapshot.hasData) {
            //         return Center(child: Text('No data'));
            //       }
            //       return SizedBox(
            //         height: 200,
            //         child: ListView.builder(
            //             itemCount: snapshot.data!.docs.length, // 읽어온 collection의 정보량만큼 listview를 통해 출력한다.
            //             itemBuilder: (context, index) {
            //               return Container(
            //                 decoration: BoxDecoration(
            //                   border: Border(
            //                     bottom: BorderSide(
            //                       color: Colors.grey,
            //                       width: 1.0,
            //                     ),
            //                   ),
            //                 ),
            //                 child: ListTile(
            //                   leading: Text(snapshot.data!.docs[index]['Name']), // snapshot의 데이터를 []안에 field 이름을 입력하여 읽어올 수 있다.
            //                   title: Text(snapshot.data!.docs[index]['Age']),
            //                   trailing: Text(snapshot.data!.docs[index]['Gender']),
            //                 ),
            //               );
            //             }),
            //       );
            //     })

            // TextButton(
            // onPressed:() async{
            //   final userSnapshot = await usersRef.get(); // get() 함수를 통해 해당 위치(usersRef)의 정보를 읽어온다.
            //   userSnapshot.docs.forEach((doc) {
            //     print(doc.data()); // 읽어온 문서의 data를 콘솔창에 출력
            //   });
            // },
            // child: Text('user 컬렌션 정보 읽어오기'))
          ],
        ),
      ),
    );
  }
}
