import 'package:chopper/chopper.dart';
import 'package:flutter/foundation.dart';
import 'package:youtube_clone/app/models/YTVideo.model.dart';
import 'package:youtube_clone/app/services/ytvideos.service.dart';

class HomeTabController with ChangeNotifier {
  ChopperClient _client;
  dynamic _data;

  dynamic get data => _data;

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
        this._data = await data.body;
        print("Success");
        testList();
      } else {
        print("Error: ${data.error}");
        print('Status Code: ${data.statusCode}');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  testList() {
    try {
      List<YTVideoModel> videos = YTVideoModel.fromJson(data);
      print(videos);
    } catch (e) {
      print('Error: ' + e.toString());
    }
  }
}
