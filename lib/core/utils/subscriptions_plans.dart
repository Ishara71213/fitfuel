class SubscriptionPlans {
  final String? planName;
  final int? price;
  final int? duration;

  const SubscriptionPlans({this.planName, this.price, this.duration});

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'planName': planName,
      'price': price,
      'duration': duration,
    };
  }

  // Convert from JSON
  factory SubscriptionPlans.fromJson(Map<String, dynamic> json) {
    return SubscriptionPlans(
      planName: json['planName'] as String?,
      price: json['price'] as int?,
      duration: json['duration'] as int?,
    );
  }
}
