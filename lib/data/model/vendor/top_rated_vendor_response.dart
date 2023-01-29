
class TopRatedVendorResponse {
  TopRatedVendorResponse({
    this.message,
    this.topratedVendors,
  });

  String? message;
  TopratedVendors? topratedVendors;

  factory TopRatedVendorResponse.fromJson(Map<String, dynamic> json) => TopRatedVendorResponse(
    message: json["message"],
    topratedVendors: json["topratedVendors"] == null ? null : TopratedVendors.fromJson(json["topratedVendors"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "topratedVendors": topratedVendors?.toJson(),
  };
}

class TopratedVendors {
  TopratedVendors({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  int? currentPage;
  List<TopRatedVendor>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Link>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  factory TopratedVendors.fromJson(Map<String, dynamic> json) => TopratedVendors(
    currentPage: json["current_page"],
    data: json["data"] == null ? [] : List<TopRatedVendor>.from(json["data"]!.map((x) => TopRatedVendor.fromJson(x))),
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    links: json["links"] == null ? [] : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "first_page_url": firstPageUrl,
    "from": from,
    "last_page": lastPage,
    "last_page_url": lastPageUrl,
    "links": links == null ? [] : List<dynamic>.from(links!.map((x) => x.toJson())),
    "next_page_url": nextPageUrl,
    "path": path,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "to": to,
    "total": total,
  };
}

class TopRatedVendor {
  TopRatedVendor({
    this.id,
    this.vendorId,
    this.name,
    this.bio,
    this.rating,
    this.image,
    this.jobsCompleted,
    this.longitude,
    this.latitude,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? vendorId;
  String? name;
  String? bio;
  String? rating;
  String? image;
  String? jobsCompleted;
  double? longitude;
  double? latitude;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory TopRatedVendor.fromJson(Map<String, dynamic> json) => TopRatedVendor(
    id: json["id"],
    vendorId: json["vendor_id"],
    name: json["name"],
    bio: json["bio"],
    rating: json["rating"],
    image: json["image"],
    jobsCompleted: json["jobs_completed"],
    longitude: json["longitude"]?.toDouble(),
    latitude: json["latitude"]?.toDouble(),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "vendor_id": vendorId,
    "name": name,
    "bio": bio,
    "rating": rating,
    "image": image,
    "jobs_completed": jobsCompleted,
    "longitude": longitude,
    "latitude": latitude,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class Link {
  Link({
    this.url,
    this.label,
    this.active,
  });

  String? url;
  String? label;
  bool? active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
    url: json["url"],
    label: json["label"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "label": label,
    "active": active,
  };
}
