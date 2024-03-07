import 'package:flutter/material.dart';
import 'package:news_app/views/CategoryPage/catPage.dart';
import 'package:news_app/views/HomePage/homePage.dart';
import 'package:news_app/views/SearchPage/searchPage.dart';

class BarController extends ChangeNotifier{
  int index = 0;
  //int get currentIndex => index;
  var pages = [
    HomePage(),
    CategoryPage(),
    SearchPage()
  ];

  void changePage(int tapIndex){
    index = tapIndex;
    notifyListeners();
  }
}