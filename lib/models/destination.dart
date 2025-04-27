class Destination {
  final int id;
  final String name;
  final String description;
  final String image;
  final String category;

  Destination({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.category,
  });

  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
      id: json['destinations_id'],
      name: json['destinations_name'],
      description: json['destinations_description'],
      image: json['destinations_image1'],
      category: json['destinations_category'],
    );
  }
}
