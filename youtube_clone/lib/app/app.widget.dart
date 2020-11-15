import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_clone/app/app.controller.dart';
import 'package:youtube_clone/app/screens/home/home.controller.dart';
import 'package:youtube_clone/app/screens/home/home.screen.dart';
import 'package:youtube_clone/app/screens/home/tabs/emptyTab/empty.tab.controller.dart';
import 'package:youtube_clone/app/screens/home/tabs/homeTab/home.tab.controller.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppController>(
          create: (_) => AppController(),
        ),
        ChangeNotifierProvider<HomeController>(
          create: (_) => HomeController(),
        ),
        ChangeNotifierProvider<EmptyTabController>(
          create: (_) => EmptyTabController(),
        ),
        ChangeNotifierProvider<HomeTabController>(
          create: (_) => HomeTabController(),
        )
      ],
      builder: (context, _) {
        return MaterialApp(
          title: "Youtube Clone",
          debugShowCheckedModeBanner: false,
          initialRoute: "/",
          routes: {
            "/": (context) => HomeScreen(),
          },
        );
      },
    );
  }
}
