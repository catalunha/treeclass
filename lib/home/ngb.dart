import 'dart:convert';

class Ngb {
  final String id;
  final String title;
  final String? parent;
  Ngb({
    required this.id,
    required this.title,
    this.parent,
  });

  Ngb copyWith({
    String? id,
    String? title,
    String? parent,
  }) {
    return Ngb(
      id: id ?? this.id,
      title: title ?? this.title,
      parent: parent ?? this.parent,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'parent': parent,
    };
  }

  factory Ngb.fromMap(Map<String, dynamic> map) {
    return Ngb(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      parent: map['parent'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Ngb.fromJson(String source) => Ngb.fromMap(json.decode(source));

  @override
  String toString() => 'Ngb(id: $id, title: $title, parent: $parent)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Ngb &&
        other.id == id &&
        other.title == title &&
        other.parent == parent;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ parent.hashCode;
}
