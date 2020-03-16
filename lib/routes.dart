import 'package:flutter/widgets.dart';
import 'screens/DataEntryPage.dart';
import 'screens/GraphsPage.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/entries": (BuildContext context) => DataEntryPage(),
  "/graphs": (BuildContext context) => GraphsPage()
};