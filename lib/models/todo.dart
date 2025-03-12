class ToDoModel {
  String title;
  String docId;
  String uid;
  String description;
  bool isDone;

  ToDoModel({
    required this.title,
    required this.description,
    this.docId = '',
    this.uid = '',
    this.isDone = false,
  });

  ToDoModel.fromJSON(Map<String, dynamic> json)
    : title = json['title'],
    isDone = json['isDone'],
    uid = json['uid'],
    docId = json['docId'],
    description= json['description'];

  Map<String, dynamic> toJSON() => {
    'title': title,
    'isDone': isDone,
    'uid': uid,
    'docId': docId,
    'description': description,
  };
}