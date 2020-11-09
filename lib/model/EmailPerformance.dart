class EmailPerformance {
  final int sent, opened, clicked, purchased;

  EmailPerformance({this.sent = 0, this.opened = 0, this.clicked = 0, this.purchased = 0});

  factory EmailPerformance.fromJson(Map<String, dynamic> json) {
    return EmailPerformance(
      sent: json['sent'] as int,
      opened: json['opened'] as int,
      clicked: json['clicked'] as int,
      purchased: json['purchased'] as int,
    );
  }
}