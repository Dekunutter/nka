class RevenueStat {
  final String name;
  final String value;

  RevenueStat({
    this.name,
    this.value,
  });

  factory RevenueStat.fromJson(Map<String, dynamic> json) {
    return RevenueStat(
      name: json['name'] as String,
      value: json['value'] as String,
    );
  }
}