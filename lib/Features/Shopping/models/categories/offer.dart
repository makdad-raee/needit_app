class Offer {
  int? id;
  dynamic key;
  String? name;
  String? description;
  String? imageUrl;
  int? discount;

  Offer({
    this.id,
    this.key,
    this.name,
    this.description,
    this.imageUrl,
    this.discount,
  });

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        id: json['id'] as int?,
        key: json['key'] as dynamic,
        name: json['name'] as String?,
        description: json['description'] as String?,
        imageUrl: json['image_url'] as String?,
        discount: json['discount'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'key': key,
        'name': name,
        'description': description,
        'image_url': imageUrl,
        'discount': discount,
      };
}
