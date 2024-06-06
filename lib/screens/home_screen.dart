import 'package:apple_shop/widgets/category_icon_item_chip.dart';
import 'package:apple_shop/widgets/banner_slider.dart';
import 'package:apple_shop/bloc/home/home_event.dart';
import 'package:apple_shop/widgets/product_item.dart';
import 'package:apple_shop/bloc/home/home_state.dart';
import 'package:apple_shop/bloc/home/home_bloc.dart';
import 'package:apple_shop/data/model/category.dart';
import 'package:apple_shop/data/model/product.dart';
import 'package:apple_shop/data/model/banner.dart';
import 'package:apple_shop/constants/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(
      HomeGetInitilzeData(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundScreenColor,
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                if (state is HomeLoadingState) ...{
                  const SliverToBoxAdapter(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(),
                        ),
                      ],
                    ),
                  ),
                } else ...{
                  const _getSearchBox(),
                  if (state is HomeRequestSuccessState) ...[
                    state.bannerList.fold(
                      (exceptionMessage) {
                        return SliverToBoxAdapter(
                          child: Text(exceptionMessage),
                        );
                      },
                      (listBanners) {
                        return _getBanners(listBanners);
                      },
                    ),
                  ],
                  const _getCategoryListTitle(),
                  if (state is HomeRequestSuccessState) ...[
                    state.categoryList.fold(
                      (exceptionMessage) {
                        return SliverToBoxAdapter(
                          child: Text(exceptionMessage),
                        );
                      },
                      (categoryList) {
                        return _getCategoryList(categoryList);
                      },
                    ),
                  ],
                  const _getBestSellerTitle(),
                  if (state is HomeRequestSuccessState) ...[
                    state.bestSellerProductList.fold(
                      (exceptionMessage) {
                        return SliverToBoxAdapter(
                          child: Text(exceptionMessage),
                        );
                      },
                      (productList) {
                        return _getBestSellerProducts(productList);
                      },
                    ),
                  ],
                  const _getMostViewedTitle(),
                  if (state is HomeRequestSuccessState) ...[
                    state.hotestProductList.fold(
                      (exceptionMessage) {
                        return SliverToBoxAdapter(
                          child: Text(exceptionMessage),
                        );
                      },
                      (productList) {
                        return _getMostViewedProducts(productList);
                      },
                    ),
                  ],
                },
              ],
            );
          },
        ),
      ),
    );
  }
}

// ignore: must_be_immutable, camel_case_types
class _getMostViewedProducts extends StatelessWidget {
  List<Product> productList;

  _getMostViewedProducts(this.productList);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 20,
        ),
        child: SizedBox(
          height: 200,
          child: ListView.builder(
            padding: const EdgeInsets.only(
              right: 35,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: productList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 20),
                child: ProductItem(productList[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class _getMostViewedTitle extends StatelessWidget {
  const _getMostViewedTitle();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 35,
            right: 35,
            bottom: 20,
            top: 32,
          ),
          child: Row(
            children: [
              const Text(
                'پر بازدید ترین ها',
                style: TextStyle(
                  color: CustomColors.grey,
                  fontFamily: 'SB',
                  fontSize: 12,
                ),
              ),
              const Spacer(),
              const Text(
                'مشاهده همه',
                style: TextStyle(
                  color: CustomColors.blue,
                  fontFamily: 'SB',
                  fontSize: 12,
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: 20,
                height: 20,
                child: Image.asset(
                  'assets/images/icon_left_categroy.png',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable, camel_case_types
class _getBestSellerProducts extends StatelessWidget {
  List<Product> productList;

  _getBestSellerProducts(this.productList);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 200,
        child: ListView.builder(
          padding: const EdgeInsets.only(
            right: 35,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: productList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 20),
              child: ProductItem(productList[index]),
            );
          },
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class _getBestSellerTitle extends StatelessWidget {
  const _getBestSellerTitle();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 35,
          right: 35,
          bottom: 20,
          top: 10,
        ),
        child: Row(
          children: [
            const Text(
              'پر فروش ترین ها',
              style: TextStyle(
                color: CustomColors.grey,
                fontFamily: 'SB',
                fontSize: 12,
              ),
            ),
            const Spacer(),
            const Text(
              'مشاهده همه',
              style: TextStyle(
                color: CustomColors.blue,
                fontFamily: 'SB',
                fontSize: 12,
              ),
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: 20,
              height: 20,
              child: Image.asset(
                'assets/images/icon_left_categroy.png',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable, camel_case_types
class _getCategoryList extends StatelessWidget {
  List<Category> listCategories;

  _getCategoryList(this.listCategories);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 100,
        child: ListView.builder(
          padding: const EdgeInsets.only(
            right: 35,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: listCategories.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: CategorylItemChip(listCategories[index]),
            );
          },
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class _getCategoryListTitle extends StatelessWidget {
  const _getCategoryListTitle();

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(
          left: 35,
          right: 35,
          bottom: 20,
          top: 25,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'دسته بندی',
              style: TextStyle(
                color: CustomColors.grey,
                fontFamily: 'SB',
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable, camel_case_types
class _getBanners extends StatelessWidget {
  List<BannerCampain> bannerCampain;

  _getBanners(this.bannerCampain);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BannerSlider(bannerCampain),
    );
  }
}

// ignore: camel_case_types
class _getSearchBox extends StatelessWidget {
  const _getSearchBox();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 35,
          right: 35,
          bottom: 32,
          top: 20,
        ),
        child: Container(
          height: 46,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Row(
            children: [
              const SizedBox(width: 16),
              Image.asset(
                'assets/images/icon_search.png',
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: Text(
                  'جستجوی محصولات',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'SB',
                    fontSize: 16,
                    color: CustomColors.grey,
                  ),
                ),
              ),
              Image.asset(
                'assets/images/icon_apple_blue.png',
              ),
              const SizedBox(width: 16),
            ],
          ),
        ),
      ),
    );
  }
}
