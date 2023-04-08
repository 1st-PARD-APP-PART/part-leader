import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Read.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Namecontroller = TextEditingController();
  final Agecontroller = TextEditingController();
  final Gendercontroller = TextEditingController();

  FirebaseFirestore DB = FirebaseFirestore.instance;

  var now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Create'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: Namecontroller,
              decoration: const InputDecoration(
                  hintText: '이름을 입력해주세요.'), // 입력하여 저장할 내용들
            ),
            TextField(
              controller: Agecontroller,
              decoration:
                  const InputDecoration(hintText: '나이를입력해주세요.'), // 입력하여 저장할 내용들
            ),
            TextField(
              controller: Gendercontroller,
              decoration: const InputDecoration(
                  hintText: '성별을 입력해주세요.'), // 입력하여 저장할 내용들
            ),
            TextButton(
              child: const Text('Collection에 저장하기'),
              onPressed: () {
                //                       DB
                //     .collection("user") // FireStore에 입력받은 값들 user collection에 저장하기
                //     .doc() // doc을 빈칸으로 두어 문서에 의미 있는 ID가 없는 경우 자동 ID를 생성하여 저장한다.
                //     .set({
                //   'TimeStamp': now, // text, bool, int 값 등 다양한 값들을 Map 형식으로 Field에 저장한다.
                //   'Name': Namecontroller.text,
                //   'Age': Agecontroller.text,
                //   'Gender': Gendercontroller.text
                // }).whenComplete(() {
                //   print('저장 성공');
                //   Namecontroller.clear();
                //   Agecontroller.clear();
                //   Gendercontroller.clear();
                //    Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => const ReadPage()),
                //   );
                // });
                DB
                    .collection("user")
                    .doc(Namecontroller.text) //  삭제하고 싶은 문서를 지정한다.
                    .update({
                  // 문서를 삭제 함수를 통해 firestore에 저장된 문서를 삭제한다.
                  'Name': FieldValue.delete(), // 삭제하고 싶은 field 값을 삭제하며 업데이트 시켜
                });
              },
            ),
            TextButton(
              child: const Text('문서에 사용자 이름과 함께 저장하기'),
              onPressed: () {
                DB
                    .collection("user")
                    .doc(Namecontroller
                        .text) // FireStore에 입력받은 값들 user colletion 안에 사용자 이름을 문서 이름으로 저장하기
                    .set({
                  'TimeStamp': now,
                  'Name': Namecontroller.text,
                  'Age': Agecontroller.text,
                  'Gender': Gendercontroller.text
                }).whenComplete(() {
                  print('저장 성공');
                  Namecontroller.clear();
                  Agecontroller.clear();
                  Gendercontroller.clear();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ReadPage()),
                  );
                });
              },
            ),
            TextButton(
              child: const Text('Collection에 add로 저장하기'),
              onPressed: () {
                DB.collection("user").add({
                  // 문서에 의미 있는 ID가 없는 경우 자동 ID를 생성하여 저장한다.
                  'TimeStamp': now,
                  'Name': Namecontroller.text,
                  'Age': Agecontroller.text,
                  'Gender': Gendercontroller.text
                }).whenComplete(() {
                  print('저장 성공');
                  Namecontroller.clear();
                  Agecontroller.clear();
                  Gendercontroller.clear();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ReadPage()),
                  );
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
