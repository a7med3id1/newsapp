import 'package:flutter/material.dart';
import 'package:news/api/api_service.dart';
import 'package:news/news/news_item.dart';
import 'package:news/widgets/error_indecator.dart';
import 'package:news/widgets/loading_indecator.dart';

class NewsList extends StatelessWidget {
  const NewsList({required this.sourceId});

  final String sourceId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: APIService.getNews(sourceId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingIndecator();
        } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
          return const ErrorIndecator();
        }
        final newsList = snapshot.data?.news ?? [];
        return ListView.builder(
          itemBuilder: (_, int index) => NewsItem(newsList[index]),
          itemCount: newsList.length,
        );
      },
    );
  }
}
