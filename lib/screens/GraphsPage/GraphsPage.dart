  import 'package:babyfeed/components/CustomBottomMenu.dart';
import 'package:babyfeed/components/CustomHamMenu.dart';
  import 'package:babyfeed/helpers/DatabaseHelper.dart';
  import 'package:babyfeed/models/Bottle.dart';
  import 'package:babyfeed/screens/GraphsPage/components/CustomTimeChart.dart';
  import 'package:flutter/material.dart';
  import 'package:babyfeed/config/globals.dart' as globals;

  class GraphsPage extends StatefulWidget {
    GraphsPage({Key key}) : super(key: key);

    @override
    _GraphsPageState createState() => _GraphsPageState();
  }

  class _GraphsPageState extends State<GraphsPage> {
    Future<List<Bottle>> bottles;
    Future<List<Bottle>> meals;
    List<Bottle> bottlesData = null;
    DatabaseHelper helper = DatabaseHelper.instance;


    @override
    void initState() {
      super.initState();
      bottles = helper.queryAll(false);
      bottles.then((value){
        bottlesData = value;
        setState(() {});
      });
      meals = helper.queryAll(true);
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
              title: Text(globals.appTitle)
          ),
          drawer: CustomHamMenu(),
          bottomNavigationBar: CustomBottomMenu(1),
          body: Center(
            child: Column(
              children: <Widget>[
                Text("Bottles"),
                CustomTimeChart(bottles),
                Text("Meals"),
                CustomTimeChart(meals),
                CustomTimeChart(meals, bottlesData)
            ]
          )
        )
      );
    }
  }