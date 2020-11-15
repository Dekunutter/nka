import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nka/model/EmailPerformance.dart';
import 'package:nka/model/RecentEmail.dart';
import 'package:nka/widgets/alignedheader.dart';
import 'package:nka/widgets/chart.dart';
import 'package:nka/widgets/overviewbox.dart';
import 'package:nka/widgets/paddedtext.dart';

class EmailAnalyticsPage extends StatelessWidget {
  EmailAnalyticsPage({Key key, this.stats}): super(key: key);

  final RecentEmail stats;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${stats.name} Analytics"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '${_formatNumber(100.0)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            PaddedText(
              text: 'From this email',
              fontSize: 12,
              paddingLeft: 10,
              paddingRight: 10,
            ),
            SizedBox(height: 20),
            SimpleLineChart(dailyData: stats.revenue),
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
                  OverviewBox.withEmailData(EmailPerformance(sent: stats.sent, opened: stats.opened, clicked: stats.clicked, purchased: stats.purchased)),
                  SizedBox(height: 10),
                  OverviewBox.withDeliverability(stats.unsubscribed, stats.markedAsSpam),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static String _formatNumber(double value) {
    return NumberFormat.simpleCurrency().format(value);
  }
}