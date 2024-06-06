import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:apple_shop/widgets/cached_image.dart';
import 'package:apple_shop/data/model/banner.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';

// ignore: must_be_immutable
class BannerSlider extends StatelessWidget {
  List<BannerCampain> bannerList;
  BannerSlider(this.bannerList, {super.key});

  @override
  Widget build(BuildContext context) {
    var controller = PageController(
      viewportFraction: 0.856,
    );

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.20,
          child: PageView.builder(
            controller: controller,
            itemCount: bannerList.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: CachedImage(
                  imageUrl: bannerList[index].thumbnail,
                  radius: 15,
                ),
              );
            },
          ),
        ),
        Positioned(
          bottom: 8,
          child: SmoothPageIndicator(
            controller: controller,
            count: bannerList.length,
            effect: const ExpandingDotsEffect(
              expansionFactor: 4,
              dotWidth: 6,
              dotHeight: 6,
              dotColor: Colors.white,
              activeDotColor: CustomColors.blueIndicator,
            ),
          ),
        ),
      ],
    );
  }
}
