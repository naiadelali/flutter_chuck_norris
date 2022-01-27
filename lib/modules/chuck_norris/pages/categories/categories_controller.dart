
import '../../models/chuck_category_model.dart';
import '../../repositories/chuck_category_repository.dart';

class ChuckNorrisController {
  final _repository = ChuckCategoryRepository();
  final List<ChuckCategoryModel> categories = [];

  Future<List<ChuckCategoryModel>> getJokesCategories() async {
    return await _repository
        .fetchChuckCategoryData()
        .onError((error, stackTrace) => throw Error());
  }
}
