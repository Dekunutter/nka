import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'alignedheader.dart';
import 'hyperlink.dart';

class StatBox extends StatelessWidget {
  StatBox({Key, key, this.title, this.keyTitle, this.valueTitle, this.stats}): super(key: Key);

  final String title, keyTitle, valueTitle;
  final Map stats;

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
              for (var rowData in stats.entries)
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Hyperlink(
                      text: rowData.key
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(rowData.value),
                    ),
                  ),
                ]),
            ],
          )],
      ),
    );
  }
}
