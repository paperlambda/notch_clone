import 'package:flutter/material.dart';
import 'package:notch_clone/core/constants.dart';
import 'package:notch_clone/ui/views/home_view.dart';
import 'package:notch_clone/ui/views/news_detail_view.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomeView());
      case newsDetailRoute:
        return MaterialPageRoute(builder: (_) => NewsDetailView());
      default:
        return MaterialPageRoute(builder: (_) => HomeView());
    }
  }
}