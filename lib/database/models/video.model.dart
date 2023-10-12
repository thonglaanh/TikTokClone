import 'package:cloud_firestore/cloud_firestore.dart';

class Video {
  String userId;
  String userName;
  String videoId;
  int totalComments;
  int totalShares;
  List likesList;
  String artistSongName;
  String descriptionTags;
  String videoUrl;
  String thumbnailUrl;
  int publishedDateTime;
  String userAvatar;
  Video(
      {required this.userId,
      required this.userName,
      required this.videoId,
      required this.totalComments,
      required this.totalShares,
      required this.likesList,
      required this.artistSongName,
      required this.descriptionTags,
      required this.videoUrl,
      required this.thumbnailUrl,
      required this.publishedDateTime,
      required this.userAvatar});
  //Chuyển video thành json
  Map<String, dynamic> toJson() => {
        //dynamic : dữ liệu chưa xác định
        'userId': userId,
        'userName': userName,
        "videoId": videoId,
        "totalComments": totalComments,
        "totalShares": totalShares,
        "likesList": likesList,
        "artistSongName": artistSongName,
        "descriptionTags": descriptionTags,
        "videoUrl": videoUrl,
        "thumbnailUrl": thumbnailUrl,
        "publishedDateTime": publishedDateTime,
        "userAvatar": userAvatar
      };
  //Nhận dữ liệu từ firebase chuyển thành đối tượng video để sd
  static Video fromDocumentSnapShot(DocumentSnapshot snapshot) {
    var docSnapShot = snapshot.data() as Map<String, dynamic>;
    return Video(
        userId: docSnapShot["userId"],
        userName: docSnapShot["userName"],
        videoId: docSnapShot["videoId"],
        totalComments: docSnapShot["totalComments"],
        totalShares: docSnapShot["totalShares"],
        likesList: docSnapShot["likesList"],
        artistSongName: docSnapShot["artistSongName"],
        descriptionTags: docSnapShot["descriptionTags"],
        videoUrl: docSnapShot["videoUrl"],
        thumbnailUrl: docSnapShot["thumbnailUrl"],
        publishedDateTime: docSnapShot["publishedDateTime"],
        userAvatar: docSnapShot["userAvatar"]);
  }
}
