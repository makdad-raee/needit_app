class Size {
  int? id;
  String? name;
  String? shortcut;

  Size({this.id, this.name, this.shortcut});

  factory Size.fromJson(Map<String, dynamic> json) => Size(
        id: json['id'] as int?,
        name: json['name'] as String?,
        shortcut: json['shortcut'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'shortcut': shortcut,
      };
}
