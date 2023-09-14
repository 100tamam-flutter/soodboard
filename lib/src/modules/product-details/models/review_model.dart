import 'package:soodboard/src/models/user_mode.dart';

import '../../../models/file_model.dart';

class ReviewModel {
  final String id;
  final UserModel user;
  final double rate;
  final String comment;
  final List<FileModel> images;
  final DateTime dateTime;

  const ReviewModel({
    required this.id,
    required this.user,
    required this.rate,
    required this.comment,
    required this.images,
    required this.dateTime,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id'] as String,
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      rate: json['rate'] as double,
      comment: json['comment'] as String,
      images: (json['images'] as List)
          .map(
            (e) => FileModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      dateTime: DateTime.parse(json['date']),
    );
  }
}
