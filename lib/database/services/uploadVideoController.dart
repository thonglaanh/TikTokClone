import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/database/models/video.model.dart';
import 'package:tiktok/screens/main/mainScreen.dart';
import 'package:tiktok/widgets/snackbar.dart';
import 'package:video_compress/video_compress.dart';

class UploadVideoController extends GetxController {
  //Lấy hình ảnh thu nhỏ của video
  getThumnailImage(String videoFilePath) async {
    final thumbnailImage = await VideoCompress.getFileThumbnail(videoFilePath);
    return thumbnailImage;
  }

  //Nén video lại
  compressVideoFile(String videoFilePath) async {
    final compressVideoFilePath = await VideoCompress.compressVideo(
        videoFilePath,
        quality: VideoQuality.LowQuality);
    return compressVideoFilePath!.file;
  }

  //Tải hình ảnh thu nhỏ của video lên firebase
  uploadThumnailImageToFirebaseStorage(
      String videoID, String videoFilePath) async {
    UploadTask thumbnailUploadTask = FirebaseStorage.instance
        .ref()
        .child("All thumnails")
        .child(videoID)
        .putFile(await getThumnailImage(videoFilePath));
    TaskSnapshot snapshot = await thumbnailUploadTask;
    String downloadUrlOfUploadVideo = await snapshot.ref.getDownloadURL();
    return downloadUrlOfUploadVideo;
  }

  //Tải video đã nén lên firebase
  uploadCompressedVideoImageToFirebaseStorage(
      String videoID, String videoFilePath) async {
    UploadTask videoUploadTask = FirebaseStorage.instance
        .ref()
        .child("All videos")
        .child(videoID)
        .putFile(await compressVideoFile(videoFilePath));
    TaskSnapshot snapshot = await videoUploadTask;
    String downloadUrlOfUploadVideo = await snapshot.ref.getDownloadURL();
    return downloadUrlOfUploadVideo; //Trả về đường dẫn tải video
  }

  //Tạo đối tượng video và lưu vào firebase
  saveVideoInfomationToFirebase(String artistSongName, String descriptionTags,
      String videoFilePath, BuildContext context) async {
    try {
      DocumentSnapshot userDocumentSnapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      String videoId = DateTime.now().microsecondsSinceEpoch.toString();
// Video to Firebase
      String videoDownloadUrl =
          await uploadCompressedVideoImageToFirebaseStorage(
              videoId, videoFilePath);
      // Thumbnail to Firebase
      String thumbnailDownloadUrl =
          await uploadThumnailImageToFirebaseStorage(videoId, videoFilePath);

      //upload
      Video videoObj = Video(
        userId: FirebaseAuth.instance.currentUser!.uid,
        userName:
            (userDocumentSnapshot.data() as Map<String, dynamic>)["fullName"],
        userAvatar:
            (userDocumentSnapshot.data() as Map<String, dynamic>)["avatarURL"],
        videoId: videoId,
        totalShares: 0,
        totalComments: 0,
        likesList: [],
        artistSongName: artistSongName,
        descriptionTags: descriptionTags,
        thumbnailUrl: thumbnailDownloadUrl,
        videoUrl: videoDownloadUrl,
        publishedDateTime: DateTime.now().microsecondsSinceEpoch,
      );
      await FirebaseFirestore.instance
          .collection("videos")
          .doc(videoId)
          .set(videoObj.toJson());

      await getSnackBar('Success', "Upload video thành công", Colors.green)
          .show(context);
      Get.to(const MainScreen());
    } catch (e) {
      Get.snackbar(
          "Upload video failed", "Your video not upload to Firebase.Try Again");
    }
  }
}
