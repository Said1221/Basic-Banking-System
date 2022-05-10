
import 'package:banking_system/Component.dart';
import 'package:banking_system/Customers.dart';
import 'package:banking_system/TransactionScreen.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class homelayout extends StatefulWidget {

  @override
  State<homelayout> createState() => _homelayoutState();
}

class _homelayoutState extends State<homelayout> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createDatabase();
  }


  var scaffoldKey = GlobalKey<ScaffoldState>();



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,


        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [

              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Online Banking System",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Expanded(
                child: Container(
                  child: Row(
                    children: [
                      Column(
                        children: [
                          IconButton(onPressed: ()
                          {

                            navigateTo(context, home());
                          },
                              icon: (Icon(
                                Icons.person,
                                size: 40,
                              )),
                          ),
                          Text(
                            "View Customers",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        children: [
                          IconButton(onPressed: ()
                          {
                          navigateTo(context, transaction());
                          },
                            icon: (Icon(
                              Icons.transfer_within_a_station,
                              size: 40,
                            )),
                          ),
                          Text(
                              "View all Transactions",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void createDatabase()async{

    database = await openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database , version) async {
        print("Database created");
        await database.execute('CREATE TABLE customer (name TEXT , email TEXT , phone INTEGER , balance DOUBLE)').then((value){
          print("table created");
          database.transaction((txn)
          {
            txn.rawInsert('INSERT INTO customer (name , email , phone , balance) VALUES ("Tifa" , "Tifa@gmail.com" , "01001524632" , "500")');
            txn.rawInsert('INSERT INTO customer (name , email , phone , balance) VALUES ("Said" , "Said@gmail.com" , "01032469875" , "250")');
            txn.rawInsert('INSERT INTO customer (name , email , phone , balance) VALUES ("Belal" , "Belal@gmail.com" , "01002654870" , "1500")');
            txn.rawInsert('INSERT INTO customer (name , email , phone , balance) VALUES ("Ahmed" , "Ahmed@gmail.com" , "01092116304" , "2300")');
            txn.rawInsert('INSERT INTO customer (name , email , phone , balance) VALUES ("Abou elftoh" , "Abou elftoh@gmail.com" , "01000256841" , "3000")');
            txn.rawInsert('INSERT INTO customer (name , email , phone , balance) VALUES ("Hima" , "Hima@gmail.com" , "01061547441" , "4500")');
            txn.rawInsert('INSERT INTO customer (name , email , phone , balance) VALUES ("Omar" , "Omar@gmail.com" , "01032654123" , "120")');
            txn.rawInsert('INSERT INTO customer (name , email , phone , balance) VALUES ("Sharaf" , "Sharaf@gmail.com" , "01098523146" , "6020")');
            txn.rawInsert('INSERT INTO customer (name , email , phone , balance) VALUES ("Hoda" , "Hoda@gmail.com" , "01092012025" , "1205")');
            txn.rawInsert('INSERT INTO customer (name , email , phone , balance) VALUES ("Zayed" , "Zayed@gmail.com" , "01021822230" , "2203")').then((value){
              print("Database Inserted");
            }).catchError((error){
              print("error Inserted ${error.toString()}");
            });
            return null;
          } );
        }).catchError((error){
          print('${error.toString()}');
        });
      },

      onOpen: (database){

          getDataFromDatabase(database).then((value){
          customer = value;
          print("database opened");

        });
      }
    );

  }






}
