import 'package:chopper/chopper.dart';
import 'package:flutter/foundation.dart';
import 'package:youtube_clone/app/models/YTVideo.model.dart';
import 'package:youtube_clone/app/services/ytvideos.service.dart';
import '../../../../models/YTVideo.model.dart';

class HomeTabController with ChangeNotifier {
  ChopperClient _client;
  List<YTVideoModel> _videos = [];

  List<YTVideoModel> get videos => _videos;

  init() {
    _client = ChopperClient(
      baseUrl: "https://www.googleapis.com/youtube/v",
      services: [
        YTVideosService.create(),
      ],
    );
  }

  Future<List<YTVideoModel>> getData() async {
    try {
      var data = await _client.getService<YTVideosService>().getVideos();
      if (data.isSuccessful) {
        _videos = YTVideoModel.fromJson(data.body.toString());
        return _videos;
      } else {
        throw ("Erro: ${data.error}");
      }
    } catch (e) {
      throw (e);
    }
  }
}
