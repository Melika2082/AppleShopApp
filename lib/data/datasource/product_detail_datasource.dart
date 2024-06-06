import 'package:apple_shop/data/model/product_varient.dart';
import 'package:apple_shop/data/model/product_image.dart';
import 'package:apple_shop/data/model/variant_type.dart';
import 'package:apple_shop/data/model/variant.dart';
import 'package:apple_shop/util/api_exception.dart';
import 'package:apple_shop/di/di.dart';
import 'package:dio/dio.dart';

abstract class IDetailProductDataSource {
  Future<List<ProductImage>> getGallery();
  Future<List<VariantType>> getVariantTypes();
  Future<List<Variant>> getVariant();
  Future<List<ProductVarient>> getProductVariants();
}

class DetailProductRemoteDataSource extends IDetailProductDataSource {
  final Dio _dio = locator.get();

  @override
  Future<List<ProductImage>> getGallery() async {
    try {
      Map<String, String> qParams = {
        'filter': 'product_id="78n4wqor3hhnkju"',
      };
      var response = await _dio.get(
        'collections/gallery/records',
        queryParameters: qParams,
      );

      return response.data['items']
          .map<ProductImage>(
            (jsonObject) => ProductImage.fromJson(jsonObject),
          )
          .toList();
    } on DioException catch (ex) {
      throw ApiException(
        code: ex.response?.statusCode,
        message: ex.response?.data['message'],
      );
    } catch (ex) {
      throw ApiException(
        code: 0,
        message: 'Unknown error',
      );
    }
  }

  @override
  Future<List<VariantType>> getVariantTypes() async {
    try {
      var response = await _dio.get('collections/variants_type/records');

      return response.data['items']
          .map<VariantType>(
            (jsonObject) => VariantType.fromJson(jsonObject),
          )
          .toList();
    } on DioException catch (ex) {
      throw ApiException(
        code: ex.response?.statusCode,
        message: ex.response?.data['message'],
      );
    } catch (ex) {
      throw ApiException(
        code: 0,
        message: 'Unknown error',
      );
    }
  }

  @override
  Future<List<Variant>> getVariant() async {
    try {
      Map<String, String> qParams = {
        'filter': 'product_id="at0y1gm0t65j62j"',
      };

      var response = await _dio.get(
        'collections/variants/records',
        queryParameters: qParams,
      );

      return response.data['items']
          .map<Variant>(
            (jsonObject) => Variant.fromJson(jsonObject),
          )
          .toList();
    } on DioException catch (ex) {
      throw ApiException(
        code: ex.response?.statusCode,
        message: ex.response?.data['message'],
      );
    } catch (ex) {
      throw ApiException(
        code: 0,
        message: 'Unknown error',
      );
    }
  }

  @override
  Future<List<ProductVarient>> getProductVariants() async {
    var variantTypeList = await getVariantTypes();
    var variantList = await getVariant();

    List<ProductVarient> productVariantList = [];

    for (var variantType in variantTypeList) {
      var variant = variantList
          .where(
            (element) => element.typeId == variantType.id,
          )
          .toList();
      productVariantList.add(ProductVarient(variantType, variant));
    }
    return productVariantList;
  }
}
