class FeedModel {
  final String title;
  final String content;
  final DateTime createdAt;
  final String image;

  const FeedModel({
    required this.title,
    required this.content,
    required this.createdAt,
    required this.image,
  });

  factory FeedModel.fromJson(Map<String, dynamic> json) {
    return FeedModel(
      title: json['title'] as String,
      content: json['content'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      image: json['image'] as String,
    );
  }
}
