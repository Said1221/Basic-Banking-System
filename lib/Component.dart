
import 'package:banking_system/Review.dart';
import 'package:banking_system/HomeLayout.dart';
import 'package:banking_system/SelectCustomer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqlite_api.dart';

List<Map> customer = [];
List<Map> customerInfo = [];
List<Map> Receiver = [];
List<Map> Sender = [];

List<String>num = [];

var valueTransfer = TextEditingController();
var count = 0;

Database? database;

late double balance;
late int phone;

late double balance2;
late int phone2;

Future<List<Map>> getDataFromDatabase(database) async {
  return await database!.rawQuery('SELECT * FROM customer');
}


void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);

Widget builditems(Map model)=> Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${model['name']}",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.phone,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 3,
                ),
                Text(
                  "${model['phone']}",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
        Spacer(),
        Text(
          "${model['balance']} EGP",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.indigo
          ),
        ),
      ],

    ),
  );


Widget viewCustomer(context , Map model2)=> Padding(
     padding: const EdgeInsets.all(8.0),

     child: Column(
      children: [

        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment. center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("assets/profile.png"),
                maxRadius: 50,
                backgroundColor: Colors.white,
              ),
            ],
          ),
        ),

        Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  "Name : ${model2['name']}",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Email : ${model2['email']}",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Phone : ${model2['phone']}",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Current Balance : ${model2['balance']}",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),


                Container(
                  child: MaterialButton(onPressed: ()
                  {
                    showAlertDialog(context , Map());
                  },

                    child: Text(
                      "Transfer",
                    ),
                    minWidth: double.infinity,
                    height: 50,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
     ),
   );



Widget selectCustomerToTransfer(Map model)=> Padding(
  padding: const EdgeInsets.all(8.0),
  child: Row(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${model['name']}",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.phone,
              ),
              SizedBox(
                width: 3,
              ),
              Text(
                "${model['phone']}",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
      Spacer(),
      Text(
        "${model['balance']}",
        style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.indigo
        ),
      ),
    ],

  ),
);


Widget ViewTransactions(Map model3 , Map model4 , model5)=> Padding(
  padding: const EdgeInsets.all(10.0),
  child: Row(
    children: [
      Text(
        "${model3['name']} ",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      Icon(
        Icons.arrow_forward,
      ),
      Text(
        " ${model4['name']}",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      Spacer(),
      Text(
        "$model5",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    ],
  ),
);


void showAlertDialog(BuildContext context , Map model) {
  // set up the button
  Widget okButton = TextButton(
    child: Text("Transfer"),
    onPressed: ()
    {
      num.add(valueTransfer.text);
      Sender.add(customerInfo[0]);
      navigateTo(context, selectCustomer());

    },
  );

  Widget cButton = TextButton(
    child: Text("Cancle"),
    onPressed: ()
    {
      navigateTo(context, Customer());
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("enter the amount"),
    content: TextFormField(
      controller: valueTransfer,
      keyboardType: TextInputType.number,
      validator: (value){
      },
    ),
    actions: [
      okButton,
      cButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}


void navigateAndFinish(
    context,
    widget,
    ) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
          (route) {
        return false;
      },
    );



void update(context , Map model , Map model2, x){

  //update customer sender and receiver after transaction
  balance = double.parse("${model['balance']}")-x;
  balance2 =double.parse("${model2['balance']}")+x;

  phone = int.parse("${model['phone']}");
  phone2 = int.parse("${model2['phone']}");


  //update customer sender
  database?.rawUpdate(
    'UPDATE customer SET balance= ? WHERE phone = ?',
    ['$balance', phone],
  ).then((value) {
    print("updated");
    getDataFromDatabase(database).then((value){
      customer = value;
      print("database opened");

    });

  });



  //update customer receiver
  database?.rawUpdate(
    'UPDATE customer SET balance= ? WHERE phone = ?',
    ['$balance2', phone2],
  ).then((value) {
    print("updated");
    getDataFromDatabase(database).then((value){
      customer = value;
      print("database opened");

    });

  });
}