import '../../models/chuck_joke_model.dart';
import '../../repositories/chuck_joke_repository.dart';

class JokeController {
  final _repository = ChuckNorrisJokeRepository();

  Future<ChuckJokeModel> getRandomJokeFromCategory(
      {required String category}) async {
    return await _repository.fetchJokeFromCategoryData(category: category);
  }
}
