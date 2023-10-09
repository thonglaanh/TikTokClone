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
          SimpleDialogOption(
            onPressed: () {
              getVideoFile(ImageSource.gallery);
            },
            child: const Row(
              children: [
                Icon(Icons.library_add),
                Padding(
                    padding: EdgeInsets.fromLTRB(12, 8, 5, 8),
                    child: Text(
                      "Get video from Gallery",
                      style: TextStyle(fontSize: 15),
                    ))
              ],
            ),
          ),
          SimpleDialogOption(
            onPressed: () {
              getVideoFile(ImageSource.camera);
            },
            child: const Row(
              children: [
                Icon(Icons.camera),
                Padding(
                    padding: EdgeInsets.fromLTRB(12, 8, 5, 8),
                    child: Text(
                      " Video for your camera",
                      style: TextStyle(fontSize: 15),
                    ))
              ],
            ),
          ),
          SimpleDialogOption(
            onPressed: () {
              Get.back();
            },
            child: const Row(
              children: [
                Icon(Icons.image),
                Padding(
                    padding: EdgeInsets.fromLTRB(12, 8, 5, 8),
                    child: Text(
                      "Cancel",
                      style: TextStyle(fontSize: 15),
                    ))
              ],
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
