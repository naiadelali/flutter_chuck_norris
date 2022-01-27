import '../../../common/enums/http_error_enum.dart';
import '../../../common/errors.dart';

import '../models/chuck_joke_model.dart';
import 'package:dio/dio.dart';
import '../../../common/consts/base_constants.dart' as consts;

class ChuckNorrisJokeRepository {
  final Dio _dio = Dio();

  Future<ChuckJokeModel> fetchJokeFromCategoryData(
      {required String category}) async {
    try {
      var response =
          await _dio.get('${consts.url_base}jokes/random?category=$category');
      if (response.data == null) throw HttpError.invalidData;
      return ChuckJokeModel.fromJson(response.data);
    } on DioError catch (e) {
      throw HttpClientError(
          message: e.message, statusCode: e.response?.statusCode ?? 500);
    } catch (e) {
      throw RepositoryFailure(message: e.toString());
    }
  }
}
