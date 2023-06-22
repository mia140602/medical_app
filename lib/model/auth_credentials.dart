class AuthCredentials{
  final String useremail;
  final String? userpassword;
  String? userId;
  String? username;

  AuthCredentials({this.username,
   required this.useremail, this.userpassword,this.userId
  });
}