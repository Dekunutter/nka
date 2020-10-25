import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class Hyperlink extends StatelessWidget {
  Hyperlink({
    Key,
    key,
    this.text = '',
  }): super(key: Key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: TextStyle(
          color: Colors.blue,
          decoration: TextDecoration.underline
        ),
      ),
    );
  }
}