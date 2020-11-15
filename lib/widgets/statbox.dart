import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nka/model/RecentEmail.dart';
import 'package:nka/pages/emailanalytics.dart';

import 'alignedheader.dart';
import 'hyperlink.dart';

class StatBox extends StatelessWidget {
  StatBox({Key key, this.title, this.keyTitle, this.valueTitle, this.stats, this.values}): super(key: key);

  final String title, keyTitle, valueTitle;
  final List<RecentEmail> stats;
  final List<int> values;

  BoxDecoration statBoxBorder() {
    return BoxDecoration(
      border: Border.all(),
    );
  }

  // TODO: Container height should be made dynamic
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: statBoxBorder(),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          AlignedHeader(
            text: title,
            fontSize: 14,
          ),
          SizedBox(height: 10),
          Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(children: [
                Text(keyTitle),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(valueTitle),
                ),
              ]),
              for (var position = 0; position < stats.length; position++)
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    // TODO: Clicking on this hyperlink should open up a new page populated with the information in the stat object
                    child: Hyperlink(
                      text: stats[position].name,
                      navigation: MaterialPageRoute(builder: (context) => EmailAnalyticsPage(stats: stats[position]))
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(values[position].toString()),
                    ),
                  ),
                ]),
            ],
          )],
      ),
    );
  }
}
