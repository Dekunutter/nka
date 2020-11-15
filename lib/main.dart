import 'package:flutter/material.dart';

import 'pages/analytics.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NKA',
      home: AnalyticsPage(title: 'Analytics'),
      );
    }
}