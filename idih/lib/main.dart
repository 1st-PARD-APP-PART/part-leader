import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:idih/util/text_styles.dart';

import 'firebase_options.dart';

void main() async {
  runApp(const MainApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text(
            'Hello World!!!',
            style: title(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
