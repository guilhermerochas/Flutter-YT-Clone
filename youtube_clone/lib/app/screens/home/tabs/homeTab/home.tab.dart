import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_clone/app/components/videocard.component.dart';
import 'package:youtube_clone/app/screens/home/tabs/homeTab/home.tab.controller.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeTabController>(
      builder: (context, controller, _) {
        controller.init();
        return FutureBuilder(
          future: controller.getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data);
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, item) {
                  return videoCardComponent(
                    snapshot.data[item],
                    context,
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                  child: Text(
                snapshot.error,
                style: TextStyle(fontSize: 20),
              ));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        );
      },
    );
  }
}
