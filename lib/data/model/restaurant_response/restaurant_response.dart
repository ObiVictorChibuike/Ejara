
class GetAllRestaurantResponse {
  GetAllRestaurantResponse({
    this.message,
    this.restaurants,
  });

  String? message;
  List<Restaurant>? restaurants;

  factory GetAllRestaurantResponse.fromJson(Map<String, dynamic> json) => GetAllRestaurantResponse(
    message: json["message"],
    restaurants: json["restaurants"] == null ? [] : List<Restaurant>.from(json["restaurants"]!.map((x) => Restaurant.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "restaurants": restaurants == null ? [] : List<dynamic>.from(restaurants!.map((x) => x.toJson())),
  };
}

class Restaurant {
  Restaurant({
    this.id,
    this.serviceId,
    this.name,
    this.discount,
    this.vat,
    this.additionalCharge,
    this.openedFrom,
    this.openedTo,
    this.minOrder,
    this.coverImage,
    this.image,
    this.address,
    this.deliveryFee,
    this.latitude,
    this.longitude,
    this.email,
    this.phone,
    this.rating,
    this.status,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? serviceId;
  String? name;
  int? discount;
  int? vat;
  int? additionalCharge;
  String? openedFrom;
  String? openedTo;
  int? minOrder;
  String? coverImage;
  String? image;
  String? address;
  String? deliveryFee;
  double? latitude;
  double? longitude;
  String? email;
  String? phone;
  int? rating;
  int? status;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
    id: json["id"],
    serviceId: json["service_id"],
    name: json["name"],
    discount: json["discount"],
    vat: json["vat"],
    additionalCharge: json["additional_charge"],
    openedFrom: json["opened_from"],
    openedTo: json["opened_to"],
    minOrder: json["min_order"],
    coverImage: json["cover_image"],
    image: json["image"],
    address: json["address"],
    deliveryFee: json["delivery_fee"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    email: json["email"],
    phone: json["phone"],
    rating: json["rating"],
    status: json["status"],
    description: json["description"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "service_id": serviceId,
    "name": name,
    "discount": discount,
    "vat": vat,
    "additional_charge": additionalCharge,
    "opened_from": openedFrom,
    "opened_to": openedTo,
    "min_order": minOrder,
    "cover_image": coverImage,
    "image": image,
    "address": address,
    "delivery_fee": deliveryFee,
    "latitude": latitude,
    "longitude": longitude,
    "email": email,
    "phone": phone,
    "rating": rating,
    "status": status,
    "description": description,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
