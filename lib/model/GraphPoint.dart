class GraphPoint {
  final double value;

  GraphPoint({this.value});

  factory GraphPoint.fromJson(Map<String, dynamic> json) {
    return GraphPoint(value: json['value'] as double);
  }
}