import 'package:flutter/widgets.dart';
import 'screens/DataEntryPage/DataEntryPage.dart';
import 'screens/GraphsPage/GraphsPage.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/entries": (BuildContext context) => DataEntryPage(),
  "/graphs": (BuildContext context) => GraphsPage()
};