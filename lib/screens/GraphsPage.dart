import 'package:babyfeed/components/CustomBottomMenu.dart';
import 'package:babyfeed/helpers/DatabaseHelper.dart';
import 'package:babyfeed/models/Bottle.dart';
import 'package:babyfeed/models/Meal.dart';
import 'package:flutter/material.dart';
import 'package:babyfeed/config/globals.dart' as globals;

class GraphsPage extends StatefulWidget {
  GraphsPage({Key key}) : super(key: key);

  @override
  _GraphsPageState createState() => _GraphsPageState();
}

class _GraphsPageState extends State<GraphsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(globals.appTitle)
      ),
      bottomNavigationBar: CustomBottomMenu(1),
      body: Center(
        child: Column(
          children: <Widget>[
            FlatButton(
              child: Text("Read bottles"),
              onPressed: () async {
                DatabaseHelper helper = DatabaseHelper.instance;
                List<Bottle> bottles = await helper.queryAllBottles();
                if (bottles == null) {
                  print('read no bottle');
                } else {
                  bottles.forEach((bottle){
                    print('read row ${bottle.id}: ${bottle.quantity} ${bottle.datetime}');
                  });
                }
              },
            ),
            FlatButton(
              child: Text("Read meals"),
              onPressed: () async {
                DatabaseHelper helper = DatabaseHelper.instance;
                List<Meal> meals = await helper.queryAllMeals();
                if (meals == null) {
                  print('read no meal');
                } else {
                  meals.forEach((meal){
                    print('read row ${meal.id}: ${meal.totalQuantity} ${meal.datetime} ${meal.hasIndus} ${meal.indusQuantity}');
                  });
                }
              },
            )
          ],
        )
      )
    );
  }
}