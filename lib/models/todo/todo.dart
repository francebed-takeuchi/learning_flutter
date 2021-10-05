class Todo {
  Todo({
    required this.title,
    required this.description,
    this.deadLine,
    required this.isCompleted,
  }) {
    deadLine ?? DateTime.now().add(const Duration(days: 1));
  }

  String title;
  String description;
  DateTime? deadLine;
  bool isCompleted = false;
}

enum TodoState {
  All,
  Active,
  Completed,
}
