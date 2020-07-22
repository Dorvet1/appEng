import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'bancoDeDados.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

final double _min = 0;
final double _max = 60;
double _value = 33;
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'APP Engenharia ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(10),
            child: Center(
                child: Column(
              children: <Widget>[
                Container(
                  height: 250,
                  child: SfRadialGauge(
                      enableLoadingAnimation: true,
                      animationDuration: 3000,
                      title: GaugeTitle(text: "Velocidade"),
                      axes: <RadialAxis>[
                        RadialAxis(
                          minimum: 0,
                          maximum:120,
                        ),
                      ]),
                ),
                Divider(),
                Text("Temperatura"),
                Container(
                  height: 200,
                  child: SfCartesianChart(
                    zoomPanBehavior: ZoomPanBehavior(
                        enableDoubleTapZooming: true,
                        enablePinching: true,
                        enablePanning: true,
                        maximumZoomLevel: 20),
                    primaryXAxis: CategoryAxis(),
                    series: <ChartSeries>[
                      LineSeries<SalesData, String>(
                        dataSource: [
                          SalesData(" 1", 10),
                          SalesData(" 2", 2),
                          SalesData(" 3", 50),
                          SalesData(" 4", 730),
                          SalesData(" 5", 10),
                        ],
                        xValueMapper: (SalesData sales, _) => sales.year,
                        yValueMapper: (SalesData sales, _) => sales.sales,
                      )
                    ],
                  ),
                ),
                Divider(),
                Text("Combustivel"),
              Container(
                width: 50,
                height: 150,
                child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  series: <CartesianSeries>[
                    ColumnSeries<SalesData, String>(
                      dataSource: [
                      SalesData (" ", 2),
                    ],
                    xValueMapper: (SalesData sales,_)=>sales.year,
                    yValueMapper: (SalesData sales, _)=> sales.sales,
                    )
                   
                  ]

                ),
              )],)
            )));
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}

dynamic getcolumndData() {
  List<SalesData> columnData = <SalesData>[SalesData("GASOLINA / LITROS ", 10)];
}
