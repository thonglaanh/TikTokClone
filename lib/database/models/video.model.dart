import 'package:cloud_firestore/cloud_firestore.dart';

class Video {
  String? userId;
  String? userName;
  String? videoId;
  int? totalComments;
  int? totalShares;
  List? likesList;
  String? artistSongName;
  String? descriptionTags;
  String? videoUrl;
  String? thumbnailUrl;
  int? publishedDateTime;
  Video({
    this.userId,
    this.userName,
    this.videoId,
    this.totalComments,
    this.totalShares,
    this.likesList,
    this.artistSongName,
    this.descriptionTags,
    this.videoUrl,
    this.thumbnailUrl,
    this.publishedDateTime,
  });
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
    );
  }
}
