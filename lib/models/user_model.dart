import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String name;
  final String email;

  const UserModel({
    this.id,
    required this.name,
    required this.email,
  });

  static fromFirestore(DocumentSnapshot doc) {
    return UserModel.fromJson(doc.data() as Map<String, dynamic>);
  }

  toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }

  static fromJson(Map<String, dynamic> data) {
    return UserModel(
      id: data['id'],
      name: data['name'],
      email: data['email'],
    );
  }
}
