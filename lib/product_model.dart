class Product{
  String nom;
  String description;
  num prix;
  String image;
  String categorie;
  num note;
  num num_note;

  Product(this.nom, this.description, this.prix, this.image, this.categorie, this.note, this.num_note);

  Product.fromJson(Map<String,dynamic> json)
      : nom = json["title"],
        description = json["description"] ,
        prix = json["price"],
        image = json["image"],
        categorie = json["category"],
        note = json["rating"]["rate"],
        num_note = json["rating"]["count"];


  String displayPriceInEuro() => "$prix €";
  String displayNumberVote() => "$num_note";
  String displayVote() => "$note";
}