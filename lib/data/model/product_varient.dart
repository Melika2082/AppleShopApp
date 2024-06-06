import 'package:apple_shop/data/model/variant_type.dart';
import 'package:apple_shop/data/model/variant.dart';

class ProductVarient {
  VariantType variantType;
  List<Variant> variantList;

  ProductVarient(
    this.variantType,
    this.variantList,
  );
}
