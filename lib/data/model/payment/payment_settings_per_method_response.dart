
class PaymentSettingsPerMethodResponse {
  PaymentSettingsPerMethodResponse({
    this.responseCode,
    this.message,
    this.data,
  });

  String? responseCode;
  String? message;
  List<dynamic>? data;

  factory PaymentSettingsPerMethodResponse.fromJson(Map<String, dynamic> json) => PaymentSettingsPerMethodResponse(
    responseCode: json["responseCode"],
    message: json["message"],
    data: json["data"] == null ? [] : List<dynamic>.from(json["data"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "responseCode": responseCode,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
  };
}
