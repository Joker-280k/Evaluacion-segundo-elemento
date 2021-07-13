class JokeModel {
  String? category;
  String? type;
  String? joke;
  String? setup;
  String? delivery;

  JokeModel({
    this.category,
    this.type,
    this.joke,
    this.setup,
    this.delivery,
  });

  factory JokeModel.fromMapJSON(Map<String, dynamic> data) => JokeModel(
      category: data['category'],
      type: data['type'],
      joke: (data['joke'] == null) ? '' : data['joke'],
      setup: (data['setup'] == null) ? '' : data['setup'],
      delivery: (data['delivery'] == null) ? 'No answer' : data['delivery']);
}
