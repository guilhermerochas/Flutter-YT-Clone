import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_clone/app/screens/home/home.controller.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (context, controller, _) {
        return Scaffold(
          appBar: AppBar(
            title: Image(
              image: AssetImage('assets/ytlogo.png'),
              width: 120,
              height: 120,
            ),
            backgroundColor: Colors.white,
            actions: [
              IconButton(
                icon: Icon(Icons.video_call),
                onPressed: () {},
                iconSize: 30,
                color: Colors.black,
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
                iconSize: 30,
                color: Colors.black,
              ),
              Container(
                padding: EdgeInsets.only(right: 10, left: 5),
                child: CircleAvatar(
                  foregroundColor: Colors.blue,
                  backgroundColor: Colors.blue,
                ),
              )
            ],
            elevation: 2.0,
          ),
          body: controller.getTab(),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.local_fire_department), label: "Trending"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shop_two), label: "Subs"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.notifications,
                  ),
                  label: "Activity"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.folder), label: "Library")
            ],
            type: BottomNavigationBarType.fixed,
            elevation: 25.0,
            fixedColor: Colors.red,
            unselectedItemColor: Colors.black,
            showUnselectedLabels: true,
            backgroundColor: Colors.white,
            currentIndex: controller.getSelectedIndex(),
            onTap: (index) => controller.setSelectedIndex(index),
          ),
        );
      },
    );
  }
}
