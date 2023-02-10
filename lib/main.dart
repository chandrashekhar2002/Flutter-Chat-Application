import 'dart:async';
import 'package:flutter/material.dart';
import 'login.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(home: myApp(),));
}

class myApp extends StatefulWidget{
  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Column(
        children: [
          Center(
            child: Container(
              height: 100,
              width: 100,
              margin: EdgeInsets.fromLTRB(80, 260, 80, 0),
              child: Image.asset('assets/images/fb.png',
                height: 140,
                width: 140,
              ),
            ),
          ),
          Text("Luna", style: TextStyle(fontSize: 40, color: Colors.black87),)
        ],
      ),
    ),
    );
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => login())
          );
        }
    );
  }
}