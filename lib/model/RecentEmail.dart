class RecentEmail {
  final String name;
  final int sent, opened, conversions, clicked, purchased, unsubscribed, markedAsSpam;
  final List<double> revenue;

  RecentEmail({
    this.name,
    this.sent,
    this.opened,
    this.conversions,
    this.clicked,
    this.purchased,
    this.unsubscribed,
    this.markedAsSpam,
    this.revenue
  });

  factory RecentEmail.fromJson(Map<String, dynamic> json) {
    return RecentEmail(
      name: json['name'] as String,
      sent: json['sent'] as int,
      opened: json['opens'] as int,
      conversions: json['conversions'] as int,
      clicked: json['clicked'] as int,
      purchased: json['purchased'] as int,
      unsubscribed: json['unsubscribed'] as int,
      markedAsSpam: json['marked_as_spam'] as int,
      revenue: new List<double>.from(json['revenue_history']),
    );
  }
}