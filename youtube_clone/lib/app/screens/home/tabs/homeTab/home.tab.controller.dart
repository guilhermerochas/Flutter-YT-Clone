import 'package:chopper/chopper.dart';
import 'package:flutter/foundation.dart';
import 'package:youtube_clone/app/models/YTVideo.model.dart';
import 'package:youtube_clone/app/services/ytvideos.service.dart';

class HomeTabController with ChangeNotifier {
  ChopperClient _client;
  List<YTVideoModel> _videos = [];

  List<YTVideoModel> get videos => _videos;

  createClient() {
    _client = ChopperClient(
      baseUrl: "https://www.googleapis.com/youtube/v3",
      services: [
        YTVideosService.create(),
      ],
    );
  }

  getData() async {
    try {
      var data = await _client.getService<YTVideosService>().getVideos();
      if (data.isSuccessful) {
        _videos = YTVideoModel.fromJson(data.body.toString());
        print("Success");
        notifyListeners();
      } else {
        print("Error: ${data.error}");
        print('Status Code: ${data.statusCode}');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
