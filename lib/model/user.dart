class User {
  int id;
  String name;
  String email;
  int type;
  String? phone;
  String? cellphone;
  DateTime? birth;

  User({
    required this.id,
    required this.type,
    required this.email,
    required this.name,
    this.birth,
    this.phone,
    this.cellphone,
  });

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        type: json["id_type"],
        phone: json["phone"] ?? '',
        cellphone: json["cellphone"] ?? '',
        birth: json["birth"] != null
            ? DateTime.parse(
                json["birth"],
              )
            : DateTime.now(),
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        type: json["id_type"],
        phone: json["phone"] ?? '',
        cellphone: json["cellphone"] ?? '',
        birth: json["birth"] != null
            ? DateTime.parse(
                json["birth"],
              )
            : DateTime.now(),
      );
}
