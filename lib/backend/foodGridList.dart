class Foods{
  String name;
  String detail;
  String foodPicture;
  String seller;
  String category;
  double price;
  int available;

  Foods({this.name, this.detail, this.foodPicture, this.seller, this.category,
    this.price, this.available});

  factory Foods.fromJson(Map<String, dynamic> json){
    return Foods(
      name: json['name'] as String,
      detail: json['detail'] as String,
      foodPicture: json['foodPicture'] as String,
      seller: json['seller'] as String,
      category: json['category'] as String,
      price: json['price'] as double,
      available: json['available'] as int,
    );
  }
}