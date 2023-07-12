
import 'package:hive/hive.dart';

class UserModel {
  // int id;
  String username;
  String password;

  UserModel({
    // required this.id,
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toMap(UserModel userModel) {
    Map<String, dynamic> userModelMap = Map();
    // userModelMap["id"] = userModel.id;
    userModelMap["username"] = userModel.username;
    userModelMap["password"] = userModel.password;
    return userModelMap;
  }

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
    // id: json['id'] ?? 0,
    username: json['username'] ?? '',
    password: json['password'] ?? '',
  );
}