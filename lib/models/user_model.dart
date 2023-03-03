class UserModel {
  final String? id;
  final String name;
  final String email;

  const UserModel({
    this.id,
    required this.name,
    required this.email,
  });

  toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }
}
