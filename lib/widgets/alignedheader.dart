import 'package:flutter/widgets.dart';

class AlignedHeader extends StatelessWidget {
  AlignedHeader({
    Key key,
    this.text = '',
    this.fontSize = 16,
    this.alignment = Alignment.centerLeft,
  }): super(key: key);

  final String text;
  final double fontSize;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: fontSize,
        ),
      ),
    );
  }
}