import 'package:babyfeed/models/Bottle.dart';
import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';

class CustomTimeChart extends StatelessWidget {
  final Future<List<Bottle>> list;
  final List<Bottle> list2;

  CustomTimeChart(this.list, [this.list2]);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: list,
      builder: (BuildContext context, AsyncSnapshot<List<Bottle>> snapshot){
        Widget children;
        List<Series<Bottle, DateTime>> series;

        if(snapshot.hasData) {
          if(snapshot.data.first.quantity == -1) {
            children = Text("No data");
          } else {
            series = [
              new Series<Bottle, DateTime>(
                  id: 'SimpleGraph',
                  domainFn: (Bottle bottle, _) => bottle.datetime,
                  measureFn: (Bottle bottle, _) => bottle.quantity,
                  colorFn: (Bottle bottle, _) => Color.fromHex(code: "#ff5733"),
                  data: snapshot.data
              )
            ];
            if(list2 != null){
              series.add(
                  new Series<Bottle, DateTime>(
                      id: 'DualGraph',
                      domainFn: (Bottle bottle, _) => bottle.datetime,
                      measureFn: (Bottle bottle, _) => bottle.quantity,
                      colorFn: (Bottle bottle, _) =>
                          Color.fromHex(code: "#0382fc"),
                      data: list2
                  )
              );
            }

            children = Padding(
                padding: new EdgeInsets.all(5.0),
                child: new SizedBox(
                  height: 100.0,
                  child: TimeSeriesChart(
                    series,
                    animate: false,
                    defaultRenderer: new LineRendererConfig(includePoints: true),
                  ),
                )
            );
          }
        } else {
          children = SizedBox(
            child: CircularProgressIndicator(),
            width: 60,
            height: 60,
          );
        }
        return children;
      }
    );
  }
}