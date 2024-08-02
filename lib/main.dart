



import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'dart:io';

import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:project1/assesment/sign_in.dart';
import 'package:project1/screen/home_screen.dart';
import 'package:project1/screen/login_screen.dart';
import 'package:project1/waste/otp_screen.dart';
import 'package:project1/waste/phone.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyAlxDSwLP8UWpEgr8zBbVk--kOYczaUe30",
        appId: "1:412287394608:android:0a7bfa4e54ccd5252c1ef5",
        messagingSenderId: "412287394608",
        projectId:  "project1-ea692",
        storageBucket: "project1-ea692.appspot.com",
        ),
  )
      : await Firebase.initializeApp();

  // Get.put(AuthController());

  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false ,
      home:SignIn(),
     // home: HomeScreen(),
    );
  }
}