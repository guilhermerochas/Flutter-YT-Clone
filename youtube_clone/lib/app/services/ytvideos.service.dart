import 'package:chopper/chopper.dart';
import 'dart:async';

part 'ytvideos.service.chopper.dart';

@ChopperApi(baseUrl: '/')
abstract class YTVideosService extends ChopperService {
  static YTVideosService create([ChopperClient client]) =>
      _$YTVideosService(client);
}
