import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class Hyperlink extends StatelessWidget {
  Hyperlink({
    Key key,
    this.text = '',
    this.navigation,
  }): super(key: key);

  final String text;
  final MaterialPageRoute navigation;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          navigation,
        );
      },
      child: RichText(
        text: TextSpan(
          text: text,
          style: TextStyle(
            color: Colors.blue,
            decoration: TextDecoration.underline
          ),
        ),
      ),
    );
  }
}