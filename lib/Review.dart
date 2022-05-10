
import 'package:banking_system/Component.dart';
import 'package:banking_system/Customers.dart';
import 'package:banking_system/SelectCustomer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class Customer extends StatelessWidget {





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: viewCustomer(context , customerInfo[0]),
      // ListView.builder(
      //     itemBuilder: (context , index)=>viewCustomer(customer[index]),
      // ),
    );
  }
}


