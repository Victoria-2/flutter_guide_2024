class People {
  DateTime createdAt;
  String firstname;
  String lastname;
  String email;
  String id;

  People({
    required this.createdAt,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.id,
  });

  factory People.fromJson(Map<String, dynamic> json) => People(
        createdAt: DateTime.parse(json["createdAt"]),
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "id": id,
      };
}
