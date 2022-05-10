


import 'package:banking_system/Review.dart';
import 'package:banking_system/Customers.dart';
import 'package:banking_system/HomeLayout.dart';
import 'package:banking_system/TransactionScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqlite_api.dart';

import 'Component.dart';


void main()
async{

  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  runApp(MyApp());
}

// Stateless
// Stateful

// class MyApp

class MyApp extends StatelessWidget
{
  
  // constructor
  // build

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homelayout(),
    );
  }


}