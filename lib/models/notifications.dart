class Notifications {
  int id;
  String title;
  String msg;
  DateTime createdAt;

  Notifications({
    int? id,
    required this.title,
    required this.msg,
    DateTime? createdAt,
  })  : id = id ?? DateTime.now().millisecond,
        createdAt = createdAt ?? DateTime.now();

  factory Notifications.fromJson(Map<String, dynamic> json) => Notifications(
        id: json["id"],
        title: json["title"],
        msg: json["msg"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "msg": msg,
        "createdAt": createdAt,
      };
}
