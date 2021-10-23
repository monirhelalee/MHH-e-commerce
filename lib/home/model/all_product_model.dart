import 'dart:convert';

List<AllProductModel> allProductModelFromJson(String str) =>
    List<AllProductModel>.from(
        json.decode(str).map((x) => AllProductModel.fromJson(x)));

String allProductModelToJson(List<AllProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllProductModel {
  AllProductModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  int? id;
  String? title;
  double? price;
  String? description;
  Category? category;
  String? image;
  Rating? rating;

  factory AllProductModel.fromJson(Map<String, dynamic> json) =>
      AllProductModel(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        price: json["price"] == null ? null : json["price"].toDouble(),
        description: json["description"] == null ? null : json["description"],
        category: json["category"] == null
            ? null
            : categoryValues.map![json["category"]],
        image: json["image"] == null ? null : json["image"],
        rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "price": price == null ? null : price,
        "description": description == null ? null : description,
        "category": category == null ? null : categoryValues.reverse![category],
        "image": image == null ? null : image,
        "rating": rating == null ? null : rating!.toJson(),
      };
}

enum Category { MEN_S_CLOTHING, JEWELERY, ELECTRONICS, WOMEN_S_CLOTHING }

final categoryValues = EnumValues({
  "electronics": Category.ELECTRONICS,
  "jewelery": Category.JEWELERY,
  "men's clothing": Category.MEN_S_CLOTHING,
  "women's clothing": Category.WOMEN_S_CLOTHING
});

class Rating {
  Rating({
    required this.rate,
    this.count,
  });

  double rate;
  int? count;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"] == null ? 0.0 : json["rate"].toDouble(),
        count: json["count"] == null ? null : json["count"],
      );

  Map<String, dynamic> toJson() => {
        "rate": rate == null ? 0.0 : rate,
        "count": count == null ? null : count,
      };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
