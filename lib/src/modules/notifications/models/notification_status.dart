class NotificationStatus {
  final int newOffers;
  final int newFeed;
  final int newActivities;

  const NotificationStatus({
    required this.newActivities,
    required this.newFeed,
    required this.newOffers,
  });

  factory NotificationStatus.fromJson(Map<String, dynamic> json) {
    return NotificationStatus(
      newActivities: json['offers'] as int,
      newFeed: json['feed'] as int,
      newOffers: json['offers'] as int,
    );
  }
}
