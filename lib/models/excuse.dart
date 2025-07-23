class Excuse {
  final String text;
  final String category;

  Excuse({
    required this.text,
    required this.category,
  });

  factory Excuse.fromJson(Map<String, dynamic> json) {
    return Excuse(
      text: json['text'] ?? '',
      category: json['category'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'category': category,
    };
  }
}

class Category {
  final String id;
  final String name;
  final String emoji;

  Category({
    required this.id,
    required this.name,
    required this.emoji,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      emoji: json['emoji'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'emoji': emoji,
    };
  }
} 