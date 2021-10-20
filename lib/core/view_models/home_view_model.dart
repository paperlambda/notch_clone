import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:notch_clone/core/dio_client.dart';
import 'package:notch_clone/core/models/news.dart';

class HomeViewModel extends ChangeNotifier {
  List<News> featuredNews = <News>[];
  final DioClient _dioClient = DioClient();

  Future<void> getFeaturedNews() async {
    final Response<List<dynamic>> resp = await _dioClient.dio.get('/news');
    this.featuredNews = resp.data!.map((item) => News.fromJson(item)).toList();
    notifyListeners();
  }
}