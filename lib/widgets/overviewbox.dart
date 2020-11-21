import 'package:flutter/cupertino.dart';
import 'package:nka/model/EmailPerformance.dart';
//import 'package:flutter/material.dart';
//import 'dart:math' as math;

class OverviewBox extends StatelessWidget {
  OverviewBox({Key key, this.stats}): super(key: key);

  final Map stats;

  //TODO: Convert to K for thousands in first value and % of sent num for other three
  factory OverviewBox.withEmailData(EmailPerformance data) {
    Map convertedStats = Map();
    convertedStats["Sent"] = data.sent.toString();
    convertedStats["Opened"] = data.opened.toString();
    convertedStats["Clicked"] = data.clicked.toString();
    convertedStats["Purchased"] = data.purchased.toString();
    return new OverviewBox(stats: convertedStats);
  }

  factory OverviewBox.withDeliverability(int unsubscribes, int spam) {
    Map convertedStats = Map();
    convertedStats["Unsubscribes"] = unsubscribes.toString();
    convertedStats["Spam"] = spam.toString();
    return new OverviewBox(stats: convertedStats);
  }

  BoxDecoration overviewBoxBorder() {
    return BoxDecoration(
      border: Border.all(),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (stats.length != 2 && stats.length != 4) {
      return Container(
        decoration: overviewBoxBorder(),
        padding: EdgeInsets.all(20),
          child: Text(
            'Invalid Data',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          )
      );
    } else {
      return Container(
          decoration: overviewBoxBorder(),
          //padding: EdgeInsets.only(top: 10),
        padding: EdgeInsets.all(10),
          child: GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            childAspectRatio: 2.5,
            children: List.generate(stats.length, (index) {
              return Container(
                padding: EdgeInsets.only(top: 10),
                //color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
                child: Column(
                  children: [
                      Text(
                      stats.entries.elementAt(index).value,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                    Text(
                      stats.entries.elementAt(index).key,
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ]
                ),
              );
            }),
          ),
      );
    }
  }
}