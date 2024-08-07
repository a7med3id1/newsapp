import 'package:flutter/material.dart';
import 'package:news/api/api_service.dart';
import 'package:news/sources/view/sources_tabs.dart';
import 'package:news/sources/view_model/sources_view_model.dart';
import 'package:news/widgets/error_indecator.dart';
import 'package:news/widgets/loading_indecator.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails(this.categoryId);

  final String categoryId;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  final viewModel = SourcesViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.getSources(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => viewModel..getSources(widget.categoryId),
      child: Builder(
        builder: (_) {
          if (viewModel.isLoading) {
            return const LoadingIndecator();
          } else if (viewModel.errorMessage != null) {
            return const ErrorIndecator();
          }
          final sources = viewModel.sources;
          return SourcesTabs(sources);
        },
      ),
    );
    // return FutureBuilder(
    //   future: APIService.getSources(categoryId),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return const LoadingIndecator();
    //     } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
    //       return const ErrorIndecator();
    //     }
    //     final sources = snapshot.data?.sources ?? [];
    //     return SourcesTabs(sources);
    //   },
    // );
  }
}
