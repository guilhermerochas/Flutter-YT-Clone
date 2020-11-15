// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ytvideos.service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$YTVideosService extends YTVideosService {
  _$YTVideosService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = YTVideosService;

  @override
  Future<Response<dynamic>> getVideos() {
    final $url =
        '/playlistItems?part=snippet&maxResults=50&playlistId=PL1qWrl23uHTjajQcozlfgSkEtNWahEpKG&key=AIzaSyAIT6Q-MRTEVdqAkMtioQQeIMogIyibSiI';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
