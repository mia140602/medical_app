class UserModel {
  final String id;
  final String email;
  // final String password;
  final String? name;
  final String? nickName;
  final String? birthday;
  final String? gender;

  UserModel({
    required this.id,
    required this.email,
    // required this.password,
     this.name,
     this.nickName,
     this.birthday,
     this.gender,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'] ?? '',
      // password: json['password'] ?? '',
      name: json['name'] ?? '',
      nickName: json['nickName'] ?? '',
      birthday: json['birthday'] ?? '',
      gender: json['gender'] ?? '',
      );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'nickName': nickName,
      'birthday': birthday,
      'gender': gender,
    };
  }
}