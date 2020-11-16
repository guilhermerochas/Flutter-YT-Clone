import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_clone/app/components/videocard.component.dart';
import 'package:youtube_clone/app/screens/home/tabs/homeTab/home.tab.controller.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeTabController>(
      builder: (context, controller, _) {
        controller.createClient();
        controller.getData();
        return ListView.builder(
          itemCount: controller.videos.length,
          itemBuilder: (context, item) {
            return videoCardComponent(controller.videos[item], context);
          },
        );
      },
    );
  }
}
