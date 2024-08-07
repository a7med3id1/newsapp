import 'package:flutter/material.dart';

class CategoryModel {
  final String id;
  final String title;
  final String imageName;
  final Color color;

  CategoryModel({
    required this.id,
    required this.title,
    required this.imageName,
    required this.color,
  });

  static List<CategoryModel> categories = [
    //1
    CategoryModel(
      id: 'business',
      title: 'Business',
      imageName: 'bussines',
      color: const Color(0xFFCF7E48),
    ),
    //2
    CategoryModel(
      id: 'entertainment',
      title: 'entertainment',
      imageName: 'environment',
      color: const Color(0xFF4882CF),
    ),
    //3
    CategoryModel(
      id: 'sports',
      title: 'Sports',
      imageName: 'ball',
      color: const Color(0xFFc91c22),
    ),
    //4
    CategoryModel(
      id: 'science',
      title: 'Science',
      imageName: 'science',
      color: const Color(0xFFF2D352),
    ),
    //5
    // CategoryModel(
    //   id: 'sports',
    //   title: 'Sports',
    //   imageName: 'ball',
    //   color: const Color(0xFFc91c22),
    // ),
    // //6
    // CategoryModel(
    //   id: 'science',
    //   title: 'Science',
    //   imageName: 'science',
    //   color: const Color(0xFFF2D352),
    // ),
  ];
}
