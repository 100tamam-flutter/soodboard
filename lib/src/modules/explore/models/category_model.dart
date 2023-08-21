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

  factory CategoryModel.fromJson(String category) {
    return CategoryModel(
        id: '0',
        title: category,
        icon: '',
        gender: 'male',
    );
  }
}
