class Subscription {
  final String? subscriptionPlanName;
  final int? subscriptionDuration;
  final DateTime? startDate;
  final int? remainingDates;

  const Subscription({
    this.subscriptionPlanName,
    this.subscriptionDuration,
    this.startDate,
    this.remainingDates,
  });

  factory Subscription.fromJson(Map<String, dynamic> json) {
    return Subscription(
      subscriptionPlanName: json['subscriptionPlanName'],
      subscriptionDuration: json['subscriptionDuration'],
      startDate:
          json['startDate'] != null ? DateTime.parse(json['startDate']) : null,
      remainingDates: json['remainingDates'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'subscriptionPlanName': subscriptionPlanName,
      'subscriptionDuration': subscriptionDuration,
      'startDate': startDate?.toIso8601String(),
      'remainingDates': remainingDates,
    };
  }
}
