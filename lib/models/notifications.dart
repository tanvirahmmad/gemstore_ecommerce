class Notifications {
  String title;
  String msg;

  Notifications({
    required this.title,
    required this.msg,
  });

  factory Notifications.fromJson(Map<String, dynamic> json) => Notifications(
        title: json["title"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "msg": msg,
      };
}
