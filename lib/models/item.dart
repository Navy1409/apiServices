class Item {
  final String title;
  final String description;
  final String imageUrl;

  Item({required this.title, required this.description, required this.imageUrl});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      title: json['title'],
      description: json['description'],
      imageUrl: json['imageUrl'],
    );
  }
}
