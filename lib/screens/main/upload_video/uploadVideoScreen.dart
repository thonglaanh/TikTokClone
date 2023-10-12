import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok/screens/main/upload_video/uploadForm.dart';

class UploadVideoScreen extends StatefulWidget {
  const UploadVideoScreen({super.key});
  @override
  State<UploadVideoScreen> createState() => _UploadVideoScreenState();
}

class _UploadVideoScreenState extends State<UploadVideoScreen> {
  getVideoFile(ImageSource sourceImg) async {
    final videoFile = await ImagePicker().pickVideo(source: sourceImg);
    if (videoFile != null) {
      Get.to(UploadForm(
        videoFile: File(videoFile.path),
        videoPath: videoFile.path,
      ));
    }
  }

  displayDialogBox() {
    return showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        children: [
          _buildSimpleDialogOption(
            Icons.library_add,
            "Get video from Gallery",
            () {
              getVideoFile(ImageSource.camera);
            },
          ),
          _buildSimpleDialogOption(Icons.camera, "Video for your camera", () {
            getVideoFile(ImageSource.camera);
          }),
          _buildSimpleDialogOption(Icons.cancel, "Cancel", () {
            Get.back();
          }),
        ],
      ),
    );
  }

  Widget _buildSimpleDialogOption(
      IconData icon, String text, VoidCallback onPressed) {
    return SimpleDialogOption(
      onPressed: onPressed,
      child: Row(
        children: [
          Icon(icon),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 5, 8),
            child: Text(
              text,
              style: const TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            onPressed: () {
              displayDialogBox();
            },
            child: const Text('Upload video')),
      ),
    );
  }
}
