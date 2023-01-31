
class PaymentSettingsPerMethodResponse {
  PaymentSettingsPerMethodResponse({
    this.responseCode,
    this.message,
    this.data,
  });

  String? responseCode;
  String? message;
  List<Datum>? data;

  factory PaymentSettingsPerMethodResponse.fromJson(Map<String, dynamic> json) => PaymentSettingsPerMethodResponse(
    responseCode: json["responseCode"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "responseCode": responseCode,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.dateCreation,
    this.dateUpdate,
    this.id,
    this.identification,
    this.status,
    this.data,
    this.fullName,
    this.address,
    this.accountName,
    this.imageLink,
    this.lastUsed,
    this.customer,
    this.country,
    this.paymentType,
    this.paymentMode,
    this.transactionType,
  });

  int? dateCreation;
  int? dateUpdate;
  int? id;
  String? identification;
  String? status;
  String? data;
  String? fullName;
  String? address;
  dynamic accountName;
  dynamic imageLink;
  int? lastUsed;
  int? customer;
  int? country;
  int? paymentType;
  int? paymentMode;
  int? transactionType;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    dateCreation: json["date_creation"],
    dateUpdate: json["date_update"],
    id: json["id"],
    identification: json["identification"],
    status: json["status"],
    data: json["data"],
    fullName: json["fullName"],
    address: json["address"],
    accountName: json["accountName"],
    imageLink: json["imageLink"],
    lastUsed: json["lastUsed"],
    customer: json["customer"],
    country: json["country"],
    paymentType: json["paymentType"],
    paymentMode: json["paymentMode"],
    transactionType: json["transactionType"],
  );

  Map<String, dynamic> toJson() => {
    "date_creation": dateCreation,
    "date_update": dateUpdate,
    "id": id,
    "identification": identification,
    "status": status,
    "data": data,
    "fullName": fullName,
    "address": address,
    "accountName": accountName,
    "imageLink": imageLink,
    "lastUsed": lastUsed,
    "customer": customer,
    "country": country,
    "paymentType": paymentType,
    "paymentMode": paymentMode,
    "transactionType": transactionType,
  };
}
