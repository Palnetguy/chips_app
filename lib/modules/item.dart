class Item {
  final String title;
  final String type;
  final double price;
  final String backgroundColor;
  final String image;

  Item({
    required this.title,
    required this.type,
    required this.price,
    required this.backgroundColor,
    required this.image,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      title: json['title'],
      type: json['type'],
      price: json['price'],
      backgroundColor: json['backgroundColor'],
      image: json['image'],
    );
  }
}
