import 'package:soodboard/src/models/file_model.dart';

class ProfileDetail {
  final FileModel avatar;
  final String firstName;
  final String lastName;
  final String username;
  final String gender;
  final DateTime birthDate;
  final String email;
  final String phoneNumber;
  final String address;

  const ProfileDetail({
    required this.avatar,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.gender,
    required this.birthDate,
    required this.email,
    required this.phoneNumber,
    required this.address,
  });

  factory ProfileDetail.fromJson(Map<String, dynamic> json) {
    return ProfileDetail(
      avatar: FileModel.fromJson(json['avatar'] as Map<String, dynamic>),
      firstName: json['first_name'],
      lastName: json['last_name'],
      username: json['username'],
      gender: json['gender'],
      birthDate: DateTime.parse(json['birth_date']),
      email: json['email'],
      phoneNumber: json['phone_number'],
      address: json['address'],
    );
  }
}
