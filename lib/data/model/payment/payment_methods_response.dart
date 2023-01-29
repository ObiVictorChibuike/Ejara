
class PaymentMethodResponse {
  PaymentMethodResponse({
    this.responseCode,
    this.message,
    this.data,
  });

  String? responseCode;
  String? message;
  List<PaymentMethod>? data;

  factory PaymentMethodResponse.fromJson(Map<String, dynamic> json) => PaymentMethodResponse(
    responseCode: json["responseCode"],
    message: json["message"],
    data: json["data"] == null ? [] : List<PaymentMethod>.from(json["data"]!.map((x) => PaymentMethod.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "responseCode": responseCode,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class PaymentMethod {
  PaymentMethod({
    this.id,
    this.code,
    this.titleEn,
    this.titleFr,
    this.descriptionEn,
    this.minAmount,
    this.descriptionFr,
    this.iconImage,
  });

  int? id;
  String? code;
  String? titleEn;
  String? titleFr;
  String? descriptionEn;
  int? minAmount;
  String? descriptionFr;
  String? iconImage;

  factory PaymentMethod.fromJson(Map<String, dynamic> json) => PaymentMethod(
    id: json["id"],
    code: json["code"],
    titleEn: json["title_en"],
    titleFr: json["title_fr"],
    descriptionEn: json["description_en"],
    minAmount: json["min_amount"],
    descriptionFr: json["description_fr"],
    iconImage: json["icon_image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "title_en": titleEn,
    "title_fr": titleFr,
    "description_en": descriptionEn,
    "min_amount": minAmount,
    "description_fr": descriptionFr,
    "icon_image": iconImage,
  };
}
