class Company {
  DateTime createdAt;
  String name;
  String image;
  String url;
  String description;
  String id;

  Company({
    required this.createdAt,
    required this.name,
    required this.image,
    required this.url,
    required this.description,
    required this.id,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        createdAt: DateTime.parse(json["createdAt"]),
        name: json["name"],
        image: json["image"],
        url: json["url"],
        description: json["description"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "name": name,
        "image": image,
        "url": url,
        "description": description,
        "id": id,
      };
}
