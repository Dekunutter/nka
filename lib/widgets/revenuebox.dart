import 'package:flutter/material.dart';
import 'package:nka/widgets/paddedtext.dart';

import '../model/RevenueStat.dart';

import 'alignedheader.dart';

class RevenueBox extends StatelessWidget {
  RevenueBox({Key key, this.title, this.stats}): super(key: key);

  final String title;
  final List<RevenueStat> stats;

  BoxDecoration revenueBoxBorder() {
    return BoxDecoration(
      borderRadius: new BorderRadius.all(Radius.circular(10.0)),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.15),
          spreadRadius: 1,
          blurRadius: 3,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: revenueBoxBorder(),
      margin: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: AlignedHeader(
            text: title,
            fontSize: 12,
          ),
          ),
          new Container(
            height: 1,
            color: Color(0xfff6f7f8),
          ),
          Padding(
            padding: EdgeInsets.only(left: 5, right: 5, bottom: 10),
          child: Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            columnWidths: {
              0: FlexColumnWidth(5),
              1: FlexColumnWidth(5),
              2: FlexColumnWidth(1),
            },
            children: [
              for (var position = 0; position < stats.length; position++)
                TableRow(children: [
                   PaddedText(
                    text: stats[position].name,
                    fontColor: Color(0xffa3a9ac),
                    paddingTop: 15,
                    paddingBottom: 15,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(stats[position].value.toString()),
                  ),
                  PaddedText(
                    text: " >",
                    fontColor: Color(0xffa3a9ac),
                    paddingTop: 15,
                    paddingBottom: 15,
                  ),
                ]),
            ]
          ),
          ),
        ],
      ),
    );
  }
}