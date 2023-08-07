class CategoryModel {
  final String id;
  final String title;
  final String icon;
  final String gender;

  const CategoryModel({
    required this.title,
    required this.icon,
    required this.id,
    required this.gender,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
        id: json['id'] as String,
        title: json['title'] as String,
        icon: json['icon'] as String,
        gender: json['gender'] as String,
    );
  }
}
