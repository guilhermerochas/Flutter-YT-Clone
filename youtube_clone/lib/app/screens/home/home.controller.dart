import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:youtube_clone/app/screens/home/tabs/HomeTab/home.tab.dart';
import 'package:youtube_clone/app/screens/home/tabs/emptyTab/empty.tab.dart';

class HomeController with ChangeNotifier {
  int _selectedIndex = 0;
  List<Widget> _tabs = [HomeTab(), EmptyTab()];

  List<BottomNavigationBarItem> _items = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    BottomNavigationBarItem(
        icon: Icon(Icons.local_fire_department), label: "Trending"),
    BottomNavigationBarItem(icon: Icon(Icons.shop_two), label: "Subscriptions"),
    BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Activity"),
    BottomNavigationBarItem(icon: Icon(Icons.folder), label: "Library")
  ];

  int getSelectedIndex() => _selectedIndex;

  Widget getTab() {
    return _tabs[_selectedIndex != 0 ? 1 : 0];
  }

  setSelectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }

  List<BottomNavigationBarItem> getItems() => _items;
}
