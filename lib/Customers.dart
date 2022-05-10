
import 'package:banking_system/Component.dart';
import 'package:banking_system/Review.dart';
import 'package:flutter/material.dart';

class home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "All Customer"
        ),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => GestureDetector(
            onTap: (){
              customerInfo.clear();
              customerInfo.add(customer[index]);
              navigateTo(context, Customer());
            },
            child: builditems(customer[index])),
        separatorBuilder: (context , index)=> Container(
          width: double.infinity,
          height: 1.0,
          color: Colors.grey,
        ),
        itemCount: customer.length,
      ),

    );


  }
}
