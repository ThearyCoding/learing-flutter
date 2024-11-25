class TodoModel {
  final String? id;
  final String title;
  final bool isCompleted;
  final DateTime? createdAt;

  TodoModel({
    this.id,
    required this.title,
    required this.isCompleted,
    this.createdAt,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['_id'] as String?,
      title: json['title'] as String? ?? '',
      isCompleted: json['isCompleted'] as bool? ?? false,
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'isCompleted': isCompleted,
      'createdAt': createdAt?.toIso8601String(),
    };
  }
}
