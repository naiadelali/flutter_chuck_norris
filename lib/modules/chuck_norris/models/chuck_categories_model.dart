import 'chuck_category_model.dart';
import 'dart:convert';

class ChuckCategoriesModel {
  final List<ChuckCategoryModel> categories;

  ChuckCategoriesModel({
    required this.categories,
  });

  static List<ChuckCategoryModel> fromJsonList(List<dynamic>? json) =>
      json?.map((i) => ChuckCategoryModel.fromJson(i)).toList() ?? [];

  dynamic toMap() {
    return {
      categories.map((x) => x.toMap()).toList(),
    };
  }
  String toJson() => json.encode(toMap());
}
