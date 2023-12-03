class OfferModel {
  final String title;
  final String content;
  final DateTime createdAt;

  const OfferModel({
    required this.title,
    required this.content,
    required this.createdAt,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
      title: json['title'] as String,
      content: json['content'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }
}
