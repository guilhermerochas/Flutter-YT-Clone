import 'package:chopper/chopper.dart';
import 'package:youtube_clone/app/utils/constant.util.dart';

part 'ytvideos.service.chopper.dart';

@ChopperApi(
    baseUrl:
        "/playlistItems?part=snippet&maxResults=50&playlistId=PL1qWrl23uHTjajQcozlfgSkEtNWahEpKG&key=${ConstantUtil.API_KEY}")
abstract class YTVideosService extends ChopperService {
  static YTVideosService create([ChopperClient client]) =>
      _$YTVideosService(client);

  @Get()
  Future<Response> getVideos();
}
