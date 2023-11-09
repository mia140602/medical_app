class UserModel {
  final String? id;
  final String email;
  // final String password;
  final String? name;
  final String? nickName;
  final String? birthday;
  final String? gender;
  final bool? profileCompleted;

  UserModel({
    this.id,
    required this.email,
    // required this.password,
     this.name,
     this.nickName,
     this.birthday,
     this.gender,
      this.profileCompleted
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'] ?? '',
      // password: json['password'] ?? '',
      name: json['fullName'] ?? '',
      nickName: json['nickName'] ?? '',
      birthday: json['birthday'] ?? '',
      gender: json['gender'] ?? '',
      profileCompleted: json['profileCompleted']??false
      );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'nickName': nickName,
      'birthday': birthday,
      'gender': gender,
      'profileCompleted':profileCompleted
    };
  }
}