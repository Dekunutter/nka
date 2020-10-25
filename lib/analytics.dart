import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nka/widgets/AlignedHeader.dart';
import 'file:///C:/Users/Deku/Documents/programming/nka/lib/widgets/overviewbox.dart';
import 'file:///C:/Users/Deku/Documents/programming/nka/lib/widgets/statbox.dart';
import 'package:nka/widgets/PaddedText.dart';

import 'widgets/chart.dart';
import 'nka.dart';

class AnalyticsPage extends StatefulWidget {
  AnalyticsPage({Key, key, this.title}): super(key: Key);

  final String title;

  @override
  _AnalyticsPageState createState() => _AnalyticsPageState();
}

class AnalyticsModel {
  const AnalyticsModel(this.income, this.time, this.loading);
  final double income;
  final int time;
  final bool loading;
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  AnalyticsModel model = AnalyticsModel(0.0, 0, false);

  void updateModel(Function update) => setState(() {
    model = update();
  });

  /*void _updateIncomeAsState() async {
    setState(() { _loading = true; });

    var income = await getIncome();

    setState(() {
      _income = income;
      _loading = false;
    });
  }*/

  void _updateIncome(Future<double> getIncome(), Function update) async {
    update(() => AnalyticsModel(0.0, 0, true));
    var income = await getIncome();
    update(() => AnalyticsModel(income, 0, false));
  }

  @override
  Widget build(BuildContext context) {
    return AnalyticsPageUI.buildUI(context,
      widget.title,
        () => _updateIncome(getIncome, (func) => updateModel(func)),
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
            SimpleLineChart.withSampleData(),
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
                  OverviewBox(stats: {'Sent' : '30.4K', 'Opened' : '20.3%', 'Clicked' : '10.7%', 'Purchased' : '2.8%'}),
                  SizedBox(height: 10),
                  // TODO: StatBox information should be turned into model data and passed through.
                  StatBox(title: 'Recent emails', keyTitle: 'Name', valueTitle: 'Opens', stats: {'Email 1' : '100', 'Email 2' : '200', 'Email 3' : '100', 'Email 4' : '200', 'Email 5' : '100'}),
                  SizedBox(height: 10),
                  StatBox(title: 'Recent automations', keyTitle: 'Name', valueTitle: 'Automations', stats: {'Email 1' : '100', 'Email 2' : '200'}),
                  SizedBox(height: 20),
                  AlignedHeader(
                    text: 'Contact performance',
                  ),
                  SizedBox(height: 10),
                  StatBox(title: 'Favourite segments', keyTitle: 'Name', valueTitle: 'Size', stats: {'Email 1' : '100', 'Email 2' : '200'}),
                  SizedBox(height: 10),
                  StatBox(title: 'Recent forms', keyTitle: 'Name', valueTitle: 'Submissions', stats: {'Email 1' : '100', 'Email 2' : '200'}),
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