import 'package:soodboard/src/models/file_model.dart';

class UserModel {
  final String id;
  final String name;
  final FileModel avatar;

  const UserModel({
    required this.id,
    required this.name,
    required this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      avatar: FileModel.fromJson(json['avatar'] as Map<String, dynamic>),
    );
  }
}
