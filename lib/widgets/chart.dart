import 'package:charts_flutter/flutter.dart' as charts;
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SimpleLineChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SimpleLineChart(this.seriesList, {this.animate});

  /// Creates a [LineChart] with sample data and no transition.
  factory SimpleLineChart.withSampleData() {
    return new SimpleLineChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      //child: charts.LineChart(seriesList, animate: animate),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LineChart(
            LineChartData(lineBarsData: [
                LineChartBarData(spots: [
                    new FlSpot(0, 5),
                    new FlSpot(1, 25),
                    new FlSpot(2, 100),
                    new FlSpot(3, 75),
                  ],
                  isCurved: true,
                  colors: [Colors.blue],
                  dotData: FlDotData(
                    show: false,
                  ),
                )
              ],
              titlesData: FlTitlesData(
                show: false,
              ),
              axisTitleData: FlAxisTitleData(
               show: false,
              ),
              gridData: FlGridData(
                show: false,
              ),
              borderData: FlBorderData(
                show: false,
              ),
              lineTouchData: LineTouchData(
                enabled: false,
              ),
            )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Text(
                '1D',
                style: TextStyle(
                  fontSize: 14,
                ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  '1W',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  '1M',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  '1Y',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  'ALL',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ]
          ),
        ]
      ),
    );
  }


  //TODO: Remove this logic and all flutter_chart imports and dependencies if fl_chart works out better
  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      new LinearSales(0, 5),
      new LinearSales(1, 25),
      new LinearSales(2, 100),
      new LinearSales(3, 75),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}