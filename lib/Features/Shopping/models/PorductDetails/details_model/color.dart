class Color {
  int? id;
  String? name;
  String? hex;

  Color({this.id, this.name, this.hex});

  factory Color.fromJson(Map<String, dynamic> json) => Color(
        id: json['id'] as int?,
        name: json['name'] as String?,
        hex: json['hex'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'hex': hex,
      };
}
