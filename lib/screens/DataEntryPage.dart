import 'package:babyfeed/components/CustomBottomMenu.dart';
import 'package:babyfeed/helpers/DatabaseHelper.dart';
import 'package:babyfeed/models/Bottle.dart';
import 'package:babyfeed/models/Meal.dart';
import 'package:flutter/material.dart';

class DataEntryPage extends StatefulWidget {
  DataEntryPage({Key key}) : super(key: key);

  @override
  _DataEntryPageState createState() => _DataEntryPageState();
}

class _DataEntryPageState extends State<DataEntryPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Baby Feed")
      ),
      bottomNavigationBar: CustomBottomMenu(0),
      body: Center(
        child: Column(
          children: <Widget>[
            FlatButton(
              child: Text("Add bottle"),
              onPressed: () async {
                Bottle bottle = Bottle();
                bottle.quantity = 60;
                bottle.datetime = DateTime.now();
                DatabaseHelper helper = DatabaseHelper.instance;
                int id = await helper.insertBottle(bottle);
                print('inserted row: $id');
              },
            ),
            FlatButton(
              child: Text("Add meal"),
              onPressed: () async {
                Meal meal = Meal();
                meal.totalQuantity = 60;
                meal.datetime = DateTime.now();
                meal.hasIndus = true;
                meal.indusQuantity = 20;
                DatabaseHelper helper = DatabaseHelper.instance;
                int id = await helper.insertMeal(meal);
                print('inserted row: $id');
              },
            ),

            FlatButton(
              child: Text("Drop database"),
              onPressed: () async {
                DatabaseHelper helper = DatabaseHelper.instance;
                helper.dropDatabase();
              },
            )
          ],
        )
      )
    );
  }
}