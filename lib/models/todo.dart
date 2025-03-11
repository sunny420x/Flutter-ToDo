class ToDoModel {
  String title;
  String description;
  bool isDone;

  ToDoModel({
    required this.title,
    required this.description,
    this.isDone = false,
  });
}