// ignore_for_file: public_member_api_docs, sort_constructors_first
class Snack {
  String id;
  String title;
  String subtitle; // Added subtitle property
  String type;
  double price;
  String backgroundColor;
  String image;

  Snack({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.type,
    required this.price,
    required this.backgroundColor,
    required this.image,
  });

  // Factory method to create a Snack from JSON
  factory Snack.fromJson(Map<String, dynamic> json) {
    return Snack(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'], // Added subtitle mapping from JSON
      type: json['type'],
      price: json['price'],
      backgroundColor: json['backgroundColor'],
      image: json['image'],
    );
  }
}
