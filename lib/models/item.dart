class Item {
  final String id;
  final String name;
  final String categoryId;
  final String categoryName;

  Item(
      {required this.id,
      required this.name,
      required this.categoryId,
      required this.categoryName});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['_id'],
      name: json['name'],
      categoryId: json['categoryId']['_id'],
      categoryName: json['categoryId']['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'categoryId': categoryId,
    };
  }
}
