import 'dart:convert';

class News {
  final String id;
  final String name;
  final String image;
  final String date;
  News({
    required this.id,
    required this.name,
    required this.image,
    required this.date,
  });

//
  factory News.fromMap(Map<String, dynamic> map) {
    return News(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      date: map['date'] ?? '',
    );
  }

  factory News.fromJson(String source) => News.fromMap(json.decode(source));
}
