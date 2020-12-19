import 'package:flutter/material.dart';

class EarningTrendBox extends StatelessWidget {
  EarningTrendBox();

  BoxDecoration rearningTrendBoxBorder() {
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
      decoration: rearningTrendBoxBorder(),
      margin: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              'placeholder'
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                TextSpan(
                    text: "You've earned ",
                    style: TextStyle(color: Colors.black)
                ),
                TextSpan(
                  text: "\$3,923.91",
                  style: TextStyle(
                    color: Color(0xff268953),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: " more from NKA this quarter than the last quarter.",
                    style: TextStyle(color: Colors.black)
                ),
              ])
            ),
          ),
        ],
      ),
    );
  }
}