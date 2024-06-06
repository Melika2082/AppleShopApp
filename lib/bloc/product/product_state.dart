import 'package:apple_shop/data/model/product_varient.dart';
import 'package:apple_shop/data/model/product_image.dart';
import 'package:dartz/dartz.dart';

abstract class ProductState {}

class ProductInitState extends ProductState {}

class ProductDetailLoadingState extends ProductState {}

class ProductDetailResponseState extends ProductState {
  Either<String, List<ProductImage>> productImages;
  Either<String, List<ProductVarient>> productVariant;

  ProductDetailResponseState(
    this.productImages,
    this.productVariant,
  );
}
