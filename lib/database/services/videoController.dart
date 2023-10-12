import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tiktok/database/models/video.model.dart';

class VideoController extends GetxController {
  final Rx<List<Video>> _videoList = Rx<List<Video>>([]);
  List<Video> get videoList => _videoList.value;

  @override
  void onInit() {
    super.onInit();
    final CollectionReference videosCollection =
        FirebaseFirestore.instance.collection('videos');

    _videoList.bindStream(
      videosCollection.snapshots().map(
        (QuerySnapshot query) {
          List<Video> relVal = [];
          for (var element in query.docs) {
            final video = Video.fromDocumentSnapShot(element);
            relVal.add(video);
          }
          return relVal;
        },
      ),
    );
  }
}
