import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:nka/model/GraphData.dart';
import 'package:nka/model/GraphPoint.dart';

import 'chartbutton.dart';

class SimpleLineChart extends StatefulWidget {
  final bool animate;
  final GraphData dailyData, weeklyData, monthlyData, yearlyData, alltimeData;

  SimpleLineChart({Key key, this.animate, this.dailyData, this.weeklyData, this.monthlyData, this.yearlyData, this.alltimeData}): super(key: key);

  @override
  _SimpleLineChartState createState() => _SimpleLineChartState();
}

class _SimpleLineChartState extends State<SimpleLineChart> {
  GraphData displayedData = GraphData();

  void _updateDisplayedGraphData(GraphData dataToDisplay) async {
    displayedData = dataToDisplay;
    setState(() {});
  }

  bool _isButtonActive(GraphData dataToDisplay) {
    return (displayedData == dataToDisplay) ? true : false;
  }

  @mustCallSuper
  void didUpdateWidget(Widget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateDisplayedGraphData(widget.dailyData);
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
          height: 200,
          child: LineChart(
            LineChartData(lineBarsData: [
                LineChartBarData(spots: _convertToSeriesList(displayedData.campaign),
                  isCurved: true,
                  colors: [Color(0xff00534e)],
                  dotData: FlDotData(
                    show: false,
                  ),
                  belowBarData: BarAreaData(
                    show: true,
                    colors: [Color(0xff003a33)]
                  )
                ),
                LineChartBarData(spots: _convertToSeriesList(displayedData.flow),
                  isCurved: true,
                  colors: [Color(0xff1a7471)],
                  dotData: FlDotData(
                    show: false,
                  ),
                  belowBarData: BarAreaData(
                      show: true,
                      colors: [Color(0xff07453f)]
                  )
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
              backgroundColor: Color(0xff00332c),
            ),
          ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: GestureDetector(
                    onTap: () {
                      _updateDisplayedGraphData(widget.dailyData);
                    },
                    child: ChartButton(text: '1W', active: _isButtonActive(widget.dailyData)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: GestureDetector(
                    onTap: () {
                      _updateDisplayedGraphData(widget.weeklyData);
                    },
                    child: ChartButton(text: '1M', active: _isButtonActive(widget.weeklyData)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: GestureDetector(
                    onTap: () {
                      _updateDisplayedGraphData(widget.monthlyData);
                    },
                    child: ChartButton(text: '1Q', active: _isButtonActive(widget.monthlyData)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: GestureDetector(
                    onTap: () {
                      _updateDisplayedGraphData(widget.yearlyData);
                    },
                    child: ChartButton(text: '1Y', active: _isButtonActive(widget.yearlyData)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: GestureDetector(
                    onTap: () {
                      _updateDisplayedGraphData(widget.alltimeData);
                    },
                    child: ChartButton(text: 'ALL', active: _isButtonActive(widget.alltimeData)),
                  ),
                ),
              ]
            ),
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
