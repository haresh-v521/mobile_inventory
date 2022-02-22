import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:testui/screen/editprofile.dart';
import 'package:testui/screen/homepage.dart';
import 'package:testui/screen/loginscreen.dart';
import 'package:testui/screen/productdetailes.dart';
import 'package:testui/screen/productlist.dart';
import 'package:testui/screen/profile.dart';
import 'package:testui/screen/signup.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      tools: const [
        ...DevicePreview.defaultTools,

      ],
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
    routes: {
      '/':(context)=> const ProductList(),
      '/productdetails':(context)=> const ProductDetails(),
      '/':(context)=> const Profile(),
      '/editprofile':(context)=> const EditProfile(),
        '/':(context)=> const HomePage(),
      '/login':(context)=> const LoginScreen(),
      '/signup':(context)=> const SignUPScreen(),

    },
    );
  }
}

