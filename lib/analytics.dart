import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nka/widgets/alignedheader.dart';
import 'package:nka/widgets/overviewbox.dart';
import 'package:nka/widgets/paddedtext.dart';
import 'package:nka/widgets/statbox.dart';

import 'model/EmailPerformance.dart';
import 'model/GraphPoint.dart';
import 'model/RecentEmail.dart';
import 'widgets/chart.dart';
import 'nka.dart';

class AnalyticsPage extends StatefulWidget {
  AnalyticsPage({Key, key, this.title}): super(key: Key);

  final String title;

  @override
  _AnalyticsPageState createState() => _AnalyticsPageState();
}

class AnalyticsModel {
  AnalyticsModel(
      this.income,
      this.time,
      this.loading,
      this.dailyData,
      this.weeklyData,
      this.monthlyData,
      this.yearlyData,
      this.alltimeData,
      this.performanceData,
      this.recentEmailData
      );
  double income;
  int time;
  bool loading;
  List<GraphPoint> dailyData;
  List<GraphPoint> weeklyData;
  List<GraphPoint> monthlyData;
  List<GraphPoint> yearlyData;
  List<GraphPoint> alltimeData;
  EmailPerformance performanceData;
  List<RecentEmail> recentEmailData;

  AnalyticsModel copyWith({
    income,
    time,
    loading,
    dailyData,
    weeklyData,
    monthlyData,
    yearlyData,
    alltimeData,
    performanceData,
    recentEmailData
  }) =>
      AnalyticsModel(
          income ?? this.income,
          time ?? this.time,
          loading ?? this.loading,
          dailyData ?? this.dailyData,
          weeklyData ?? this.weeklyData,
          monthlyData ?? this.monthlyData,
          yearlyData ?? this.yearlyData,
          alltimeData ?? this.alltimeData,
          performanceData ?? this.performanceData,
          recentEmailData ?? this.recentEmailData
      );
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  AnalyticsModel model = AnalyticsModel(0.0, 0, false, List(), List(), List(), List(), List(), EmailPerformance(), List());

  void updateModel(Function update) => setState(() {
    model = update();
  });

  void _updateIncome(Future<double> getIncome(), Function update) async {
    update(() => model.copyWith(income: 0.0, time: 0, loading: true));
    var income = await getIncome();
    update(() => model.copyWith(income: income, time: 0, loading: false));
  }

  void _updateDailyGraphData(Future<List<GraphPoint>> parseDailyGraphData(), Function update) async {
    update(() => model.copyWith(dailyData: List<GraphPoint>()));
    var data = await parseDailyGraphData();
    update(() => model.copyWith(dailyData: data));
  }

  void _updateWeeklyGraphData(Future<List<GraphPoint>> parseWeeklyGraphData(), Function update) async {
    update(() => model.copyWith(weeklyData: List<GraphPoint>()));
    var data = await parseWeeklyGraphData();
    update(() => model.copyWith(weeklyData: data));
  }

  void _updateMonthlyGraphData(Future<List<GraphPoint>> parseMonthlyGraphData(), Function update) async {
    update(() => model.copyWith(monthlyData: List<GraphPoint>()));
    var data = await parseMonthlyGraphData();
    update(() => model.copyWith(monthlyData: data));
  }

  void _updateYearlyGraphData(Future<List<GraphPoint>> parseYearlyGraphData(), Function update) async {
    update(() => model.copyWith(yearlyData: List<GraphPoint>()));
    var data = await parseYearlyGraphData();
    update(() => model.copyWith(yearlyData: data));
  }

  void _updateAllTimeGraphData(Future<List<GraphPoint>> parseAllTimeGraphData(), Function update) async {
    update(() => model.copyWith(alltimeData: List<GraphPoint>()));
    var data = await parseAllTimeGraphData();
    update(() => model.copyWith(alltimeData: data));
  }

  void _updateEmailPerformance(Future<EmailPerformance> parseOverallEmailPerformanceData(), Function update) async {
    update(() => model.copyWith(performanceData: null, loading: true));
    var data = await parseOverallEmailPerformanceData();
    update(() => model.copyWith(performanceData: data, loading: false));
  }

  void _updateRecentEmailData(Future<List<RecentEmail>> parseRecentEmailData(), Function update) async {
    update(() => model.copyWith(recentEmailData: List<RecentEmail>(), loading: true));
    var data = await parseRecentEmailData();
    update(() => model.copyWith(recentEmailData: data, loading: false));
  }

  @override
  Widget build(BuildContext context) {
    return AnalyticsPageUI.buildUI(context,
      widget.title,
        () {
          _updateIncome(getIncome, (func) => updateModel(func));
          _updateDailyGraphData(parseDailyGraphData, (func) => updateModel(func));
          _updateWeeklyGraphData(parseWeeklyGraphData, (func) => updateModel(func));
          _updateMonthlyGraphData(parseMonthlyGraphData, (func) => updateModel(func));
          _updateYearlyGraphData(parseYearlyGraphData, (func) => updateModel(func));
          _updateAllTimeGraphData(parseAllTimeGraphData, (func) => updateModel(func));
          _updateEmailPerformance(parseOverallEmailPerformanceData, (func) => updateModel(func));
          _updateRecentEmailData(parseRecentEmailData, (func) => updateModel(func));
        },
      model
    );
  }
}

class AnalyticsPageUI {
  static buildUI(BuildContext context,
      String title,
      Function update,
      AnalyticsModel model) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: model.loading ? ( [new CircularProgressIndicator()] ) :
          ([
            Text(
              '${_formatNumber(model.income)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PaddedText(
                  text: '+\$798',
                  fontSize: 12,
                  paddingLeft: 10,
                  paddingRight: 10,
                ),
                PaddedText(
                  text: '^ 9.81%',
                  fontSize: 12,
                  paddingLeft: 10,
                  paddingRight: 10,
                ),
                PaddedText(
                  text: 'Past month',
                  fontSize: 12,
                  paddingLeft: 10,
                  paddingRight: 10,
                ),
              ],
            ),
            SizedBox(height: 20),
            SimpleLineChart(dailyData: model.dailyData, weeklyData: model.weeklyData, monthlyData: model.monthlyData, yearlyData: model.yearlyData, alltimeData: model.alltimeData),
            SizedBox(height: 30),
            Container(
              margin: EdgeInsets.all(20),
              child: Column(
                children: [
                  //TODO: Breakout into own left-aligned text widget class
                  AlignedHeader(
                    text: 'Email performance',
                  ),
                  SizedBox(height: 10),
                  OverviewBox.withEmailData(model.performanceData),
                  SizedBox(height: 10),
                  StatBox(title: 'Recent emails', keyTitle: 'Name', valueTitle: 'Opens', stats: model.recentEmailData, values: model.recentEmailData.map((recentEmail) => recentEmail.opened).toList()),
                  SizedBox(height: 10),
                  StatBox(title: 'Recent automations', keyTitle: 'Name', valueTitle: 'Automations', stats: model.recentEmailData, values: model.recentEmailData.map((recentEmail) => recentEmail.conversions).toList()),
                  SizedBox(height: 20),
                  AlignedHeader(
                    text: 'Contact performance',
                  ),
                  SizedBox(height: 10),
                  StatBox(title: 'Favourite segments', keyTitle: 'Name', valueTitle: 'Size', stats: model.recentEmailData, values: model.recentEmailData.map((recentEmail) => recentEmail.sent).toList()),
                  SizedBox(height: 10),
                  StatBox(title: 'Recent forms', keyTitle: 'Name', valueTitle: 'Submissions', stats: model.recentEmailData, values: model.recentEmailData.map((recentEmail) => recentEmail.clicked).toList()),
                ],
              ),
            ),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: update,
        tooltip: 'Update',
        child: Icon(Icons.update),
      ),
    );
  }

  static String _formatNumber(double value) {
    return NumberFormat.simpleCurrency().format(value);
  }
}