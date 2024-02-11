class Cordinates {
  final double latitude;
  final double longitude;

  Cordinates({required this.latitude, required this.longitude});

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  // Convert from JSON
  factory Cordinates.fromJson(Map<String, dynamic> json) {
    return Cordinates(
      latitude: json['latitude'] as double,
      longitude: json['longitude'] as double,
    );
  }
}
