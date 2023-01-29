
class AuthUserResponse {
  AuthUserResponse({
    this.data,
  });

  Data? data;

  factory AuthUserResponse.fromJson(Map<String, dynamic> json) => AuthUserResponse(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data,
  };
}

class Data {
  Data({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
  });

  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "phone": phone,
  };
}
