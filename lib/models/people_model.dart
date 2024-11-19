class People {
  DateTime createdAt;
  String firstname;
  String lastname;
  String email;
  String url;
  String city;
  String? country;
  String company;
  String image;
  String id;

  People({
    required this.createdAt,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.url,
    required this.city,
    this.country,
    required this.company,
    required this.image,
    required this.id,
  });

  factory People.fromJson(Map<String, dynamic> json) => People(
        createdAt: DateTime.parse(json["createdAt"]),
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        url: json["url"],
        city: json["city"],
        country: json["country"] ?? '',
        company: json["company"],
        image: json["image"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "url": url,
        "city": city,
        "country": country,
        "company": company,
        "image": image,
        "id": id,
      };
}
