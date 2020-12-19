import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nka/model/GraphData.dart';
import 'package:nka/widgets/alignedheader.dart';
import 'package:nka/widgets/earningtrendbox.dart';
import 'package:nka/widgets/overviewbox.dart';
import 'package:nka/widgets/paddedtext.dart';
import 'package:nka/widgets/revenuebox.dart';
import 'package:nka/widgets/statbox.dart';

import '../model/EmailPerformance.dart';
import '../model/GraphPoint.dart';
import '../model/RecentEmail.dart';
import '../model/RevenueStat.dart';
import '../widgets/chart.dart';
import '../nka.dart';

class AnalyticsPage extends StatefulWidget {
  AnalyticsPage({Key key, this.title}): super(key: key);

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
      this.recentEmailData,
      this.revenueStatsByType,
      this.revenueStatsByChannel
      );
  double income;
  int time;
  bool loading;
  GraphData dailyData;
  GraphData weeklyData;
  GraphData monthlyData;
  GraphData yearlyData;
  GraphData alltimeData;
  EmailPerformance performanceData;
  List<RecentEmail> recentEmailData;
  List<RevenueStat> revenueStatsByType;
  List<RevenueStat> revenueStatsByChannel;

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
    recentEmailData,
    revenueStatsByType,
    revenueStatsByChannel
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
          recentEmailData ?? this.recentEmailData,
          revenueStatsByType ?? this.revenueStatsByType,
          revenueStatsByChannel ?? this.revenueStatsByChannel,
      );
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  AnalyticsModel model = AnalyticsModel(0.0, 0, false, null, null, null, null, null, EmailPerformance(), List(), List(), List());

  void updateModel(Function update) => setState(() {
    model = update();
  });

  void _updateIncome(Future<double> getIncome(), Function update) async {
    update(() => model.copyWith(income: 0.0, time: 0, loading: true));
    var income = await getIncome();
    update(() => model.copyWith(income: income, time: 0, loading: false));
  }

  void _updateDailyGraphData(Future<GraphData> parseDailyGraphData(), Function update) async {
    update(() => model.copyWith(dailyData: null, loading: true));
    var data = await parseDailyGraphData();
    update(() => model.copyWith(dailyData: data, loading: false));
  }

  void _updateWeeklyGraphData(Future<GraphData> parseWeeklyGraphData(), Function update) async {
    update(() => model.copyWith(weeklyData: null, loading: true));
    var data = await parseWeeklyGraphData();
    update(() => model.copyWith(weeklyData: data, loading: false));
  }

  void _updateMonthlyGraphData(Future<GraphData> parseMonthlyGraphData(), Function update) async {
    update(() => model.copyWith(monthlyData: null, loading: true));
    var data = await parseMonthlyGraphData();
    update(() => model.copyWith(monthlyData: data, loading: false));
  }

  void _updateYearlyGraphData(Future<GraphData> parseYearlyGraphData(), Function update) async {
    update(() => model.copyWith(yearlyData: null, loading: true));
    var data = await parseYearlyGraphData();
    update(() => model.copyWith(yearlyData: data, loading: false));
  }

  void _updateAllTimeGraphData(Future<GraphData> parseAllTimeGraphData(), Function update) async {
    update(() => model.copyWith(alltimeData: null, loading: true));
    var data = await parseAllTimeGraphData();
    update(() => model.copyWith(alltimeData: data, loading: false));
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

  void _updateRevenueStatsByType(Future<List<RevenueStat>> parseRevenueStatsByType(), Function update) async {
    update(() => model.copyWith(revenueStatsByType: List<RevenueStat>(), loading: true));
    var data = await parseRevenueStatsByType();
    update(() => model.copyWith(revenueStatsByType: data, loading: false));
  }

  void _updateRevenueStatsByChannel(Future<List<RevenueStat>> parseRevenueStatsByChannel(), Function update) async {
    update(() => model.copyWith(revenueStatsByChannel: List<RevenueStat>(), loading: true));
    var data = await parseRevenueStatsByChannel();
    update(() => model.copyWith(revenueStatsByChannel: data, loading: false));
  }

  @override
  void initState() {
    super.initState();

    _updateIncome(getIncome, (func) => updateModel(func));
    _updateDailyGraphData(parseDailyGraphData, (func) => updateModel(func));
    _updateWeeklyGraphData(parseWeeklyGraphData, (func) => updateModel(func));
    _updateMonthlyGraphData(parseMonthlyGraphData, (func) => updateModel(func));
    _updateYearlyGraphData(parseYearlyGraphData, (func) => updateModel(func));
    _updateAllTimeGraphData(parseAllTimeGraphData, (func) => updateModel(func));
    _updateEmailPerformance(parseOverallEmailPerformanceData, (func) => updateModel(func));
    _updateRecentEmailData(parseRecentEmailData, (func) => updateModel(func));
    _updateRevenueStatsByType(parseRevenueStatsByType, (func) => updateModel(func));
    _updateRevenueStatsByChannel(parseRevenueStatsByChannel, (func) => updateModel(func));

  }

  @override
  Widget build(BuildContext context) {
    return AnalyticsPageUI.buildUI(context,
      widget.title,
      model
    );
  }
}

class AnalyticsPageUI {
  static buildUI(BuildContext context,
      String title,
      AnalyticsModel model) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xfff6f7f8),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: model.loading ? ( [new CircularProgressIndicator()] ) :
          ([
            /*Container(
              color: Color(0xff262545),
              child: Column(
                children: [Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${_formatNumber(model.income)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        backgroundColor: Color(0xff262545),
                      ),
                    ),
                  ]
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
              ]),
            ),
            SimpleLineChart(dailyData: model.dailyData, weeklyData: model.weeklyData, monthlyData: model.monthlyData, yearlyData: model.yearlyData, alltimeData: model.alltimeData),
            */Stack(children: [
              new Column(
                children: <Widget>[
                  new Container(
                    height: MediaQuery.of(context).size.height * .25,
                    color: Color(0xff00332c),
                  ),
                  new Container(
                    height: MediaQuery.of(context).size.height * .40,
                    color: Color(0xff07453f),
                  ),
                  new Container(
                    height: MediaQuery.of(context).size.height * .35,
                    color: Color(0xfff6f7f8),
                  )
                ],
              ),
              /*Container(
                  alignment: Alignment.topCenter,
                  padding: new EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .05,
                      right: 20.0,
                      left: 20.0),
                  child: new Container(
                    height: 200.0,
                    width: MediaQuery.of(context).size.width,
                    child: new Card(
                      color: Colors.white,
                      elevation: 4.0,
                    ),
                  ),
              ),*/
              Column(
                children: [
                  SizedBox(height: 60),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Text(
                            'TOTAL REVENUE',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ]
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${_formatNumber(model.income)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                      ]
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PaddedText(
                        text: '\$18,380 from NKA',
                        fontSize: 12,
                        fontColor: Colors.white,
                        paddingTop: 5,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  SimpleLineChart(dailyData: model.dailyData, weeklyData: model.weeklyData, monthlyData: model.monthlyData, yearlyData: model.yearlyData, alltimeData: model.alltimeData),
                  SizedBox(height: 16),
                  RevenueBox(title: 'REVENUE BY MESSAGE TYPE', stats:  model.revenueStatsByType),
                  RevenueBox(title: 'REVENUE BY CHANNEL', stats: model.revenueStatsByChannel),
                  EarningTrendBox(),
                ],
              ),
              /*Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * .65,
              color: Colors.grey,
              child: Column(
                children: [
                  SizedBox(height: 10),
                  RevenueBox(title: 'REVENUE BY MESSAGE TYPE', stats:  model.revenueStatsByType),
                  RevenueBox(title: 'REVENUE BY CHANNEL', stats: model.revenueStatsByChannel),
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
            ),*/
            ]),
          ]),
        ),
      ),
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: update,
        tooltip: 'Update',
        child: Icon(Icons.update),
      ),*/
    );
  }

  static String _formatNumber(double value) {
    return NumberFormat.simpleCurrency().format(value);
  }
}