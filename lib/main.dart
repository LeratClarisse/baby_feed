import 'package:flutter/material.dart';

import 'routes.dart';
import 'theme/style.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme(),
      initialRoute: "/entries",
      routes: routes
    );
  }
}