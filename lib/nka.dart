import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:nka/model/EmailPerformance.dart';

import 'model/GraphData.dart';
import 'model/RecentEmail.dart';
import 'model/RevenueStat.dart';

// TODO: Add typedef or whatever is needed to read from a file, JsonDecode is in place to read the json file when we start using one
typedef dynamic JsonDecode(String source);
JsonDecode get jsonDecode => json.decode;

Future<double> _getIncome(JsonDecode jsonDecode) async {
  return 100000.0;
}

Future<double> getIncome() => _getIncome(jsonDecode);

Future<String> _loadFromAsset(String filename) async {
  return await rootBundle.loadString("assets/$filename");
}

Future<GraphData> parseDailyGraphData() async {
  final response = await _loadFromAsset("dailygraph.json");
  final jsonResponse = jsonDecode(response);
  return GraphData.fromJson(jsonResponse);
}

Future<GraphData> parseWeeklyGraphData() async {
  final response = await _loadFromAsset("weeklygraph.json");
  final jsonResponse = jsonDecode(response);
  return GraphData.fromJson(jsonResponse);
}

Future<GraphData> parseMonthlyGraphData() async {
  final response = await _loadFromAsset("monthlygraph.json");
  final jsonResponse = jsonDecode(response);
  return GraphData.fromJson(jsonResponse);
}

Future<GraphData> parseYearlyGraphData() async {
  final response = await _loadFromAsset("yearlygraph.json");
  final jsonResponse = jsonDecode(response);
  return GraphData.fromJson(jsonResponse);
}

Future<GraphData> parseAllTimeGraphData() async {
  final response = await _loadFromAsset("alltimegraph.json");
  final jsonResponse = jsonDecode(response);
  return GraphData.fromJson(jsonResponse);
}

Future<EmailPerformance> parseOverallEmailPerformanceData() async {
  final response = await _loadFromAsset("emailperformance.json");
  final jsonResponse = jsonDecode(response);
  return EmailPerformance.fromJson(jsonResponse);
}

Future<List<RecentEmail>> parseRecentEmailData() async {
  final response = await _loadFromAsset("recentemails.json");
  final jsonResponse = jsonDecode(response)["recent_emails"] as List;
  return jsonResponse.map((json) => RecentEmail.fromJson(json)).toList();
}

Future<List<RecentEmail>> parseRecentEmailData2() async {
  final response = await _loadFromAsset("recentemails.json");
  final jsonResponse = jsonDecode(response)["recent_emails"] as List;
  return jsonResponse.map((json) => RecentEmail.fromJson(json)).toList();
}

Future<List<RevenueStat>> parseRevenueStatsByType() async {
  final response = await _loadFromAsset("revenuestatstype.json");
  final jsonResponse = jsonDecode(response)["revenue_stats"] as List;
  return jsonResponse.map((json) => RevenueStat.fromJson(json)).toList();
}

Future<List<RevenueStat>> parseRevenueStatsByChannel() async {
  final response = await _loadFromAsset("revenuestatschannel.json");
  final jsonResponse = jsonDecode(response)["revenue_stats"] as List;
  return jsonResponse.map((json) => RevenueStat.fromJson(json)).toList();
}