class ChuckJokeModel {
  final String id;
  final String iconUrl;
  final String url;
  final String joke;

  ChuckJokeModel({
    required this.id,
    required this.iconUrl,
    required this.url,
    required this.joke,
  });

  factory ChuckJokeModel.fromJson(json) {
    return ChuckJokeModel(
        iconUrl: json['icon_url'] ?? '',
        id: json['id'] ?? '',
        url: json['url'] ?? '',
        joke: json['value'] ?? '');
  }
  Map toJson() {
    final data = {};
    data['icon_url'] = iconUrl;
    data['id'] = id;
    data['url'] = url;
    data['value'] = joke;
    return data;
  }
}
