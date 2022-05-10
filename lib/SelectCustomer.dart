
import 'package:banking_system/Customers.dart';
import 'package:banking_system/HomeLayout.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import 'Component.dart';

class selectCustomer extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Select Customer to Transfer to"
        ),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => GestureDetector(
            onTap: (){
              Receiver.add(customer[index]);
              update(context, customerInfo[0] ,Receiver[count] , int.parse(num[count]));
              count ++ ;
              navigateTo(context, homelayout());
            },
            child: selectCustomerToTransfer(customer[index])),
        separatorBuilder: (context , index)=>Container(
          width: double.infinity,
          height: 1.0,
          color: Colors.grey,
        ),
        itemCount: customer.length,
      ),



    );
  }


}
