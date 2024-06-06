import 'package:apple_shop/data/repository/product_detail_repository.dart';
import 'package:apple_shop/bloc/product/product_event.dart';
import 'package:apple_shop/bloc/product/product_state.dart';
import 'package:apple_shop/di/di.dart';
import 'package:bloc/bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final IDetailProductRepository _productRepository = locator.get();

  ProductBloc() : super(ProductInitState()) {
    on<ProductIntializeEvent>(
      (event, emit) async {
        emit(
          ProductDetailLoadingState(),
        );

        var productImage = await _productRepository.getProductImage();
        var productVariant = await _productRepository.getProductVariants();

        emit(
          ProductDetailResponseState(
            productImage,
            productVariant,
          ),
        );
      },
    );
  }
}
