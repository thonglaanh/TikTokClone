import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/database/services/uploadVideoController.dart';
import 'package:tiktok/widgets/buttonAuth.dart';
import 'package:tiktok/widgets/textInput.dart';
import 'package:video_player/video_player.dart';

class UploadForm extends StatefulWidget {
  final File videoFile;
  final String videoPath;

  const UploadForm(
      {super.key, required this.videoFile, required this.videoPath});

  @override
  State<UploadForm> createState() => _UploadFormState();
}

class _UploadFormState extends State<UploadForm> {
  VideoPlayerController? playerController;
  TextEditingController inputMusicController = TextEditingController();
  TextEditingController inputContentController = TextEditingController();
  UploadVideoController uploadVideoController =
      Get.put(UploadVideoController());
  @override
  void initState() {
    setState(() {
      playerController = VideoPlayerController.file(widget.videoFile);
    });
    playerController!.initialize();
    playerController!.play();
    playerController!.setVolume(2);
    playerController!.setLooping(true);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    playerController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.4,
            height: MediaQuery.of(context).size.height / 1.35,
            child: VideoPlayer(playerController!),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            height: 50,
            child: TextInputWidget(
              textEditingController: inputMusicController,
              lableString: "Music",
              iconData: Icons.music_note,
              isObscure: false,
            ),
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: TextInputWidget(
              textEditingController: inputContentController,
              lableString: "Content description",
              iconData: Icons.content_copy,
              isObscure: false,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5),
            child: ButtonAuthWidget(
              color: Colors.black,
              label: 'Push video',
              onTap: () {
                if (inputContentController.text.isNotEmpty ||
                    inputMusicController.text.isNotEmpty) {
                  uploadVideoController.saveVideoInfomationToFirebase(
                    inputMusicController.text,
                    inputContentController.text,
                    widget.videoPath,
                    context,
                  );
                }
              },
            ),
          )
        ],
      )),
    );
  }
}
