class ProductImage {
  String imageUrl;
  String productId;

  ProductImage(
    this.imageUrl,
    this.productId,
  );

  factory ProductImage.fromJson(Map<String, dynamic> jsonObject) {
    return ProductImage(
      // نمایش گالری تصاویر لیست محصولات
      'https://startflutter.ir/api/files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['image']}',

      jsonObject['product_id'],
    );
  }
}
