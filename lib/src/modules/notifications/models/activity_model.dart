class ActivityModel {
  final String title;
  final String content;
  final DateTime createdAt;

  const ActivityModel({
    required this.title,
    required this.content,
    required this.createdAt,
  });

  factory ActivityModel.fromJson(Map<String, dynamic> json) {
    return ActivityModel(
      title: json['title'] as String,
      content: json['content'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }
}
