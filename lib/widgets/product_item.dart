import 'package:apple_shop/screens/product_detail_screen.dart';
import 'package:apple_shop/bloc/product/product_bloc.dart';
import 'package:apple_shop/widgets/cached_image.dart';
import 'package:apple_shop/data/model/product.dart';
import 'package:apple_shop/constants/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductItem extends StatelessWidget {
  Product product;

  ProductItem(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => ProductBloc(),
              child: const ProductDetailScreen(),
            ),
          ),
        );
      },
      child: Container(
        width: 160,
        height: 216,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Expanded(
                  child: Container(),
                ),
                SizedBox(
                  width: 96,
                  height: 96,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: CachedImage(
                      imageUrl: product.thumbnail,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 10,
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: Image.asset(
                      'assets/images/active_fav_product.png',
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 10,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: CustomColors.red,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 1,
                      ),
                      child: Text(
                        '${product.percent!.round().toString()} %',
                        style: const TextStyle(
                          fontFamily: 'SB',
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 10,
                    right: 10,
                  ),
                  child: Text(
                    product.name,
                    maxLines: 1,
                    style: const TextStyle(
                      fontFamily: 'SM',
                      fontSize: 14,
                    ),
                  ),
                ),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Container(
                    height: 53,
                    decoration: const BoxDecoration(
                      color: CustomColors.blue,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: CustomColors.blue,
                          blurRadius: 50,
                          spreadRadius: -15,
                          offset: Offset(0.0, 10.0),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Text(
                            'تومان',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'SM',
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.price.toString(),
                                style: const TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: Colors.white,
                                  color: Colors.white,
                                  fontFamily: 'SM',
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                product.realPrice.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'SM',
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: Image.asset(
                              'assets/images/icon_right_arrow_cricle.png',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
