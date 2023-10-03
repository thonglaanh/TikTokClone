import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String uid;
  String gender;
  String fullName;
  String email;
  String age;
  String phone;
  List<String>? following;
  List<String>? follower;
  String avatarURL;

  UserModel(
      {required this.uid,
      required this.gender,
      required this.email,
      required this.phone,
      required this.age,
      required this.avatarURL,
      required this.fullName,
      this.follower,
      this.following});
  Map<String, dynamic> toJson() => {
        "uid": uid,
        "gender": gender,
        "fullName": fullName,
        "email": email,
        "age": age,
        "phone": phone,
        "avatarURL": avatarURL,
        "following": following,
        "follower": follower
      };
}
