import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_clone/app/screens/home/tabs/homeTab/home.tab.controller.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeTabController>(
      builder: (context, controller, _) {
        controller.createClient();
        controller.getData();
        return Center(
          child: Text(
            "Home Tab",
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        );
      },
    );
  }
}
