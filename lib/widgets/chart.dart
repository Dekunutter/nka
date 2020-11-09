import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:nka/model/GraphPoint.dart';

class SimpleLineChart extends StatefulWidget {
  final bool animate;
  final List<GraphPoint> dailyData, weeklyData, monthlyData, yearlyData, alltimeData;

  SimpleLineChart({Key, key, this.animate, this.dailyData, this.weeklyData, this.monthlyData, this.yearlyData, this.alltimeData}): super(key: Key);

  @override
  _SimpleLineChartState createState() => _SimpleLineChartState();
}

class _SimpleLineChartState extends State<SimpleLineChart> {
  List<GraphPoint> displayedData = List<GraphPoint>();

  void _updateDisplayedGraphData(List<GraphPoint> dataToDisplay) async {
    displayedData = dataToDisplay;
    setState(() {});
  }

  @mustCallSuper
  void didUpdateWidget(Widget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateDisplayedGraphData(widget.dailyData);
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LineChart(
            LineChartData(lineBarsData: [
                LineChartBarData(spots: _convertToSeriesList(displayedData),
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
                child: GestureDetector(
                  onTap: () {
                    _updateDisplayedGraphData(widget.dailyData);
                  },
                  child: Text(
                    '1D',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: GestureDetector(
                  onTap: () {
                    _updateDisplayedGraphData(widget.weeklyData);
                  },
                  child: Text(
                    '1W',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: GestureDetector(
                  onTap: () {
                    _updateDisplayedGraphData(widget.monthlyData);
                  },
                  child: Text(
                    '1M',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: GestureDetector(
                  onTap: () {
                    _updateDisplayedGraphData(widget.yearlyData);
                  },
                  child: Text(
                    '1Y',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: GestureDetector(
                  onTap: () {
                    _updateDisplayedGraphData(widget.alltimeData);
                  },
                  child: Text(
                    'ALL',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ]
          ),
        ]
      ),
    );
  }

  static List<FlSpot> _convertToSeriesList(List<GraphPoint> customData) {
    List<FlSpot> seriesList = List();
    if (customData == null || customData.length == 0) {
      seriesList.add(new FlSpot(0.0, 0.0));
    } else {
      for (var position = 0; position < customData.length; position++) {
        seriesList.add(
            new FlSpot(position.toDouble(), customData[position].value));
      }
    }
    return seriesList;
  }
}
