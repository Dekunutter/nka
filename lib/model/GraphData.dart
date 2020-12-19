import 'GraphPoint.dart';

class GraphData {
  final List<GraphPoint> campaign, flow;

  GraphData({
    this.campaign,
    this.flow,
  });

  factory GraphData.fromJson(Map<String, dynamic> json) {
    return GraphData(
      campaign: (json['campaign']['points'] as List).map((value) =>  GraphPoint.fromJson(value)).toList(),
      flow: (json['flow']['points'] as List).map((value) =>  GraphPoint.fromJson(value)).toList(),
    );
  }
}