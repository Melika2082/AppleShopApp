class Product {
  String id;
  String collectionId;
  String thumbnail;
  String description;
  int discountPrice;
  int price;
  String popularity;
  String name;
  int quantity;
  String category;
  int? realPrice;
  num? percent;

  Product(
    this.id,
    this.collectionId,
    this.thumbnail,
    this.description,
    this.discountPrice,
    this.price,
    this.popularity,
    this.name,
    this.quantity,
    this.category,
  ) {
    realPrice = price + discountPrice;
    percent = ((price - realPrice!) / price) * 100;
  }

  factory Product.fromJson(Map<String, dynamic> jsonObject) {
    return Product(
      jsonObject['id'],
      jsonObject['collectionId'],

      // نمایش تصاویر صفحه ی لیست محصولات
      'https://startflutter.ir/api/files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['thumbnail']}',

      jsonObject['description'],
      jsonObject['discount_price'],
      jsonObject['price'],
      jsonObject['popularity'],
      jsonObject['name'],
      jsonObject['quantity'],
      jsonObject['category'],
    );
  }
}
