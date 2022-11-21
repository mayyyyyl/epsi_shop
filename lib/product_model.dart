import 'dart:convert';

class Product{
  String nom;
  String description;
  num prix;
  String image;
  String categorie;
  Map note;

  Product(this.nom, this.description, this.prix, this.image, this.categorie, this.note);

  Product.fromJson(Map<String,dynamic> json)
      : nom = json["title"],
        description = json["description"] ,
        prix = json["price"],
        image = json["image"],
        categorie = json["category"],
        note = json["rating"];


  String displayPriceInEuro() => "$prix €";
  String displayNumberVote() => "$note";
}