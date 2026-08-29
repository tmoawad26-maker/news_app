import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/data/models/source_response.dart';
import 'package:news_app/data/services/news_api_service.dart';

class SourceViewModel extends ChangeNotifier {
  /// data
  /// method handles data
  List<SourceModel>? sources;
  bool isLoading = false;
  String? errorMessage;
  getSources({required String category}) async {
    isLoading = true;
    notifyListeners();
    try {
      final newsSources = NewsApiService.getSources(category);
      sources = await newsSources;
    }catch(e) {
      if(e is DioException){
        errorMessage = e.message;
      }
      errorMessage = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}