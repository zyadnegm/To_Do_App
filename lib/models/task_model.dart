class Task_model {
  String tittle;
  String details;
  int date;
  String id;
  bool isdond;
  String userId;

  Task_model(
      {required this.tittle,
      required this.details,
      required this.date,
      this.id = "",
      this.isdond = false,
      required this.userId});

  Task_model.fromJson(Map<String, dynamic> json)
      : this(
            id: json["id"],
            tittle: json["tittle"],
            details: json["details"],
            date: json["date"],
            isdond: json["isdond"],
            userId: json["userId"]);

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "tittle": tittle,
      "details": details,
      "date": date,
      "isdond": isdond,
      "userId": userId
    };
  }
}
