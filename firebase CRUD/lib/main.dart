import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

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
              onPressed: () {},
            ),
            TextButton(
              child: const Text('문서에 사용자 이름과 함께 저장하기'),
              onPressed: () {},
            ),
            TextButton(
              child: const Text('Collection에 add로 저장하기'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
