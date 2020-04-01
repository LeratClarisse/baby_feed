import 'package:flutter/material.dart';

class CustomHamMenu extends StatelessWidget {
  CustomHamMenu();

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Data entry"),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/entries');
              },
            ),
            ListTile(
              title: Text("Graphs"),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/graphs');
              },
            ),
            ListTile(
              title: Text("About"),
            ),
            ListTile(
              title: Text("Donate"),
            ),
            ListTile(
                title: Text("Watch ads for support")
            ),
          ],
        )
    );
  }
}