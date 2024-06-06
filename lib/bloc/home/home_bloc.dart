import 'package:apple_shop/data/repository/category_repository.dart';
import 'package:apple_shop/data/repository/product_repository.dart';
import 'package:apple_shop/data/repository/banner_repository.dart';
import 'package:apple_shop/bloc/home/home_event.dart';
import 'package:apple_shop/bloc/home/home_state.dart';
import 'package:apple_shop/di/di.dart';
import 'package:bloc/bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IBannerRepository _bannerRepository = locator.get();
  final ICategoryRepository _categoryRepository = locator.get();
  final IProductRepository _productRepository = locator.get();

  HomeBloc() : super(HomeInitState()) {
    on<HomeGetInitilzeData>(
      (event, emit) async {
        emit(
          HomeLoadingState(),
        );

        var bannerList = await _bannerRepository.getBanners();
        var categoryList = await _categoryRepository.getCategories();
        var productList = await _productRepository.getProducts();
        var hotestProductList = await _productRepository.getHotest();
        var bestSellerProductList = await _productRepository.getBestSeller();

        emit(
          HomeRequestSuccessState(
            bannerList,
            categoryList,
            productList,
            hotestProductList,
            bestSellerProductList,
          ),
        );
      },
    );
  }
}
