class DbTables {
  static const String savedclubs = "savedclubs";
}

class ClubFields {
  static final List<String> columns = [
    id,
    clubName,
    address,
    closeTime,
    clubCordinates,
    maxMembersAtTime,
    currentMembers,
    images,
    openTime,
    subscriptionPlans,
    isSaved,
  ];

  // Column names
  static const String id = "_id";
  static const String clubName = "clubName";
  static const String address = "address";
  static const String closeTime = "closeTime";
  static const String clubCordinates = "clubCordinates";
  static const String maxMembersAtTime = "maxMembersAtTime";
  static const String currentMembers = "currentMembers";
  static const String images = "images";
  static const String openTime = "openTime";
  static const String subscriptionPlans = "subscriptionPlans";
  static const String isSaved = "isSaved";
}
