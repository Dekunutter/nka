import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class ChartButton extends StatelessWidget {
  ChartButton({
    Key key,
    this.text = '',
    this.active = false,
  }): super(key: key);

  final String text;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      child: Align(
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ),
      decoration: active ? BoxDecoration(
        color: Color(0xff00332c),
        shape: BoxShape.circle,
      ): null,
    );
  }
}