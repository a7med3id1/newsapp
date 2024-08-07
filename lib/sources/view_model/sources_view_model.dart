import 'package:flutter/material.dart';
import 'package:news/api/api_service.dart';
import 'package:news/models/source_response/source.dart';

class SourcesViewModel with ChangeNotifier {
  List<Source> sources = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> getSources(String categoryId) async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await APIService.getSources(categoryId);
      if (response.status == 'ok') {
        sources = response.sources ?? [];
      } else {
        errorMessage = 'Failed to get sources';
      }
    } catch (error) {
      errorMessage = 'Failed to get sources';
    }
    isLoading = false;
    notifyListeners();
  }
}
