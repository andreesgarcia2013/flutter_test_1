class TaskModel {
    int? id;
    String title;
    bool isCompleted;
    String? dueDate;
    String? comments;
    String? description;
    String? tags;
    String? token;
    DateTime? createdAt;
    DateTime? updatedAt;

    TaskModel({
        this.id,
        required this.title,
        required this.isCompleted,
        this.dueDate,
        this.comments,
        this.description,
        this.tags,
        this.token,
        this.createdAt,
        this.updatedAt,
    });

    factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        id: json["id"],
        title: json["title"],
        isCompleted: json["is_completed"] == 1 ? true : false,
        dueDate: json["due_date"],
        comments: json["comments"],
        description: json["description"],
        tags: json["tags"],
        token: json["token"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "is_completed": isCompleted,
        "due_date": dueDate,
        "comments": comments,
        "description": description,
        "tags": tags,
        "token": token,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
