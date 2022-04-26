// To parse this JSON data, do
//
//     final categoriesModel = categoriesModelFromJson(jsonString);

import 'dart:convert';

CategoriesModel categoriesModelFromJson(String str) => CategoriesModel.fromJson(json.decode(str));

String categoriesModelToJson(CategoriesModel data) => json.encode(data.toJson());

class CategoriesModel {
  CategoriesModel({
    this.categories,
  });

  List<Category>? categories;

  factory CategoriesModel.fromJson(Map<String, dynamic> json) => CategoriesModel(
        categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories!.map((x) => x.toJson())),
      };
}

class Category {
  Category({
    this.subcategorie,
    this.minicategories,
  });

  List<String>? subcategorie;
  List<Minicategory>? minicategories;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        subcategorie: List<String>.from(json["subcategorie"].map((x) => x)),
        minicategories: List<Minicategory>.from(json["minicategories"].map((x) => Minicategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "subcategorie": List<dynamic>.from(subcategorie!.map((x) => x)),
        "minicategories": List<dynamic>.from(minicategories!.map((x) => x.toJson())),
      };
}

class Minicategory {
  Minicategory({
    this.name,
    this.mincats,
  });

  String? name;
  List<String>? mincats;

  factory Minicategory.fromJson(Map<String, dynamic> json) => Minicategory(
        name: json["name"],
        mincats: List<String>.from(json["mincats"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "mincats": List<dynamic>.from(mincats!.map((x) => x)),
      };
}
