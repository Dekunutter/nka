
import 'package:flutter/widgets.dart';

class PaddedText extends StatelessWidget {
  PaddedText({
    Key key,
    this.text = '',
    this.fontSize = 14,
    this.paddingTop = 10,
    this.paddingBottom = 10,
    this.paddingLeft = 10,
    this.paddingRight = 10,
  }): super(key: key);

  final String text;
  final double fontSize,  paddingTop, paddingBottom, paddingLeft, paddingRight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: paddingTop, bottom: paddingBottom, left: paddingLeft, right: paddingRight),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
        ),
      ),
    );
  }
}