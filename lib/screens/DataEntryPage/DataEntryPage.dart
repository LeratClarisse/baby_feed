import 'package:babyfeed/components/CustomBottomMenu.dart';
import 'package:babyfeed/components/CustomHamMenu.dart';
import 'package:babyfeed/config/globals.dart' as globals;
import 'package:babyfeed/helpers/DatabaseHelper.dart';
import 'package:babyfeed/screens/DataEntryPage/components/AddPopup.dart';
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
          title: Text(globals.appTitle)
      ),
      drawer: CustomHamMenu(),
      bottomNavigationBar: CustomBottomMenu(0),
      body: Center(
        child: Column(
          children: <Widget>[
            FlatButton(
              child: Text("Add bottle"),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AddPopup(isMeal: false);
                  }
                ).then((newBottle) async {
                  if (newBottle != null){
                    DatabaseHelper helper = DatabaseHelper.instance;
                    int id = await helper.insertBottle(newBottle);
                    print('inserted row: $id');
                  }
                });
              },
            ),
            FlatButton(
              child: Text("Add meal"),
              onPressed: () async {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AddPopup(isMeal: true);
                  }
                ).then((newMeal) async {
                  if (newMeal != null){
                    DatabaseHelper helper = DatabaseHelper.instance;
                    int id = await helper.insertMeal(newMeal);
                    print('inserted row: $id');
                  }
                });
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