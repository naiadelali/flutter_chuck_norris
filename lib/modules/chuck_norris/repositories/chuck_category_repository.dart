import 'dart:async';
import 'dart:convert';

import 'package:flutter_chuck_norris/modules/chuck_norris/models/chuck_categories_model.dart';

import '../../../common/enums/http_error_enum.dart';
import '../../../common/errors.dart';

import '../models/chuck_category_model.dart';
import 'package:dio/dio.dart';
import '../../../common/consts/base_constants.dart' as consts;

class ChuckCategoryRepository {
  final Dio _dio = Dio();

  Future<List<ChuckCategoryModel>> fetchChuckCategoryData() async {
    try {
      final response = await _dio.get("${consts.urlBase}jokes/categories");
      if (response.data == null) throw HttpError.invalidData;
      return ChuckCategoryModel.fromJsonList(response.data);
    } on DioError catch (e) {
      throw HttpClientError(
          message: e.message, statusCode: e.response?.statusCode ?? 500);
    } catch (e) {
      throw RepositoryFailure(message: e.toString());
    }
  }
}
