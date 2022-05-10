
import 'package:banking_system/Component.dart';
import 'package:flutter/material.dart';

class transaction extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Transactions Screen",
        ),
      ),
      body: ListView.separated(

          itemBuilder: (BuildContext , index) => ViewTransactions(Sender[index] , Receiver[index] , num[index]),
          separatorBuilder: (context , index) => Container(
            height: 1,
            color: Colors.grey,
            // width: double.infinity,
          ),
          itemCount: num.length,
      ),
    );
  }
}
