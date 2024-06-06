import 'package:apple_shop/data/datasource/product_detail_datasource.dart';
import 'package:apple_shop/data/model/product_varient.dart';
import 'package:apple_shop/data/model/product_image.dart';
import 'package:apple_shop/data/model/variant_type.dart';
import 'package:apple_shop/util/api_exception.dart';
import 'package:apple_shop/di/di.dart';
import 'package:dartz/dartz.dart';

abstract class IDetailProductRepository {
  Future<Either<String, List<ProductImage>>> getProductImage();
  Future<Either<String, List<VariantType>>> getVariantTypes();
  Future<Either<String, List<ProductVarient>>> getProductVariants();
}

class DetailProductRepository extends IDetailProductRepository {
  final IDetailProductDataSource _datasource = locator.get();

  @override
  Future<Either<String, List<ProductImage>>> getProductImage() async {
    try {
      var response = await _datasource.getGallery();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'اتصال به اینترنت برقرار نیست');
    }
  }

  @override
  Future<Either<String, List<VariantType>>> getVariantTypes() async {
    try {
      var response = await _datasource.getVariantTypes();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'اتصال به اینترنت برقرار نیست');
    }
  }

  @override
  Future<Either<String, List<ProductVarient>>> getProductVariants() async {
    try {
      var response = await _datasource.getProductVariants();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'اتصال به اینترنت برقرار نیست');
    }
  }
}
