class StoryCharacter {
  String Category;
  List<String> Items;

  StoryCharacter({required this.Category, required this.Items});

  factory StoryCharacter.fromJSON(Map<String, dynamic> json) {
    return StoryCharacter(
        Category: json["category"], Items: List.from(json["items"]));
  }
}
