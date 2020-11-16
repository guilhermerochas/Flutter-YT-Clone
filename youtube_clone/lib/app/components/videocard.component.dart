import 'package:flutter/material.dart';
import 'package:youtube_clone/app/models/YTVideo.model.dart';

Widget videoCardComponent(YTVideoModel videoModel, BuildContext context) {
  int sizes = MediaQuery.of(context).size.width.toInt() + 50;
  int daysAgo = DateTime.now().difference(videoModel.publishedDate).inDays;

  return Container(
    child: Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            videoModel.thumbnail,
            width: sizes.toDouble(),
            height: (sizes * 0.6),
          ),
          SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 9),
                child: CircleAvatar(
                  backgroundColor: Colors.orange[900],
                  radius: 22,
                ),
              ),
              Flexible(
                child: Container(
                  padding: EdgeInsets.only(left: 5, bottom: 5, right: 5),
                  child: Text(
                    videoModel.title,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 55),
            child: Row(
              children: [
                Text(videoModel.channelTitle),
                SizedBox(width: 10),
                Text("${(videoModel.fakeViews / 1000)}K views"),
                SizedBox(width: 10),
                Text("$daysAgo days ago")
              ],
            ),
          ),
        ],
      ),
    ),
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: Colors.black,
          width: 0.5,
        ),
      ),
    ),
  );
}
