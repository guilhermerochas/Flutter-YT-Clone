import 'dart:convert';
import 'package:intl/intl.dart';

class YTVideoModel {
  String _title;
  String _channelTitle;
  String _thumbnail;
  static const int _fakeViews = 10000;
  DateTime _publishedDate;

  YTVideoModel(
      {String title,
      String channelTitle,
      String thumbnail,
      DateTime publishedDate}) {
    this._title = title;
    this._channelTitle = channelTitle;
    this._thumbnail = thumbnail;
    this._publishedDate = publishedDate;
  }

  String get title => _title;
  set title(String value) => _title = value;

  String get channelTitle => _channelTitle;
  set channelTitle(String value) => _channelTitle = value;

  String get thumbnail => _thumbnail;
  set thumbnail(String value) => _thumbnail = value;

  int get fakeViews => _fakeViews;

  DateTime get publishedDate => _publishedDate;
  set publishedDate(DateTime value) => publishedDate;

  String toString() {
    return "Title: $_title}\nChannel: $_channelTitle\nThumbnail: $_thumbnail\nDate: ${_publishedDate.toString()}";
  }

  static List<YTVideoModel> fromJson(String jsonString) {
    final Map<String, dynamic> data = jsonDecode(jsonString);
    //int videos = int.parse(data['pageInfo']['totalResults']);
    List<YTVideoModel> list = [];
    var format = DateFormat('yyyy-MM-ddTH:mm:ssZ');
    int count =
        int.tryParse(data['pageInfo']['totalResults'].toString()).toInt();

    for (int i = 0; i < count; i++) {
      list.add(
        YTVideoModel(
          title: data["items"][i]["snippet"]["title"],
          channelTitle: data["items"][i]["snippet"]["channelTitle"],
          thumbnail: data['items'][i]["snippet"]["thumbnails"]["standard"]
              ["url"],
          publishedDate: format.parse(
            data['items'][i]['snippet']['publishedAt'],
          ),
        ),
      );
    }
    return list;
  }
}
