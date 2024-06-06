import 'package:apple_shop/constants/colors.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundScreenColor,
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 44,
                      right: 44,
                      bottom: 10,
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
                            'assets/images/icon_apple_blue.png',
                          ),
                          const Expanded(
                            child: Text(
                              'سبد خرید',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'SB',
                                fontSize: 16,
                                color: CustomColors.blue,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return const CardItem();
                    },
                    childCount: 10,
                  ),
                ),
                const SliverPadding(
                  padding: EdgeInsets.only(bottom: 100),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 20,
                right: 44,
                left: 44,
              ),
              child: SizedBox(
                height: 53,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'ادامه فرآیند خرید',
                    style: TextStyle(
                      fontFamily: 'SB',
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 44,
        right: 44,
        top: 20,
      ),
      width: MediaQuery.of(context).size.width,
      height: 239,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: CustomColors.grey,
            blurRadius: 20,
            spreadRadius: -15,
            offset: Offset(0.0, 5.0),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 17,
                      horizontal: 17,
                    ),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'آیفون ۱۳ پرومکس دوسیم کارت',
                            style: TextStyle(
                              fontFamily: 'SB',
                              fontSize: 16,
                              color: Colors.black,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'گارانتی 18 ماه مدیا پردازش',
                            style: TextStyle(
                              fontFamily: 'SM',
                              fontSize: 10,
                              color: CustomColors.grey,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                '46،000،000',
                                style: TextStyle(
                                  fontFamily: 'SM',
                                  fontSize: 10,
                                  color: CustomColors.grey,
                                ),
                              ),
                              const SizedBox(width: 5),
                              const Text(
                                'تومان',
                                style: TextStyle(
                                  fontFamily: 'SM',
                                  fontSize: 10,
                                  color: CustomColors.grey,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Container(
                                decoration: const BoxDecoration(
                                  color: CustomColors.red,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(7.5),
                                  ),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 5,
                                    vertical: 1,
                                  ),
                                  child: Text(
                                    '%۳',
                                    style: TextStyle(
                                      fontFamily: 'SB',
                                      fontSize: 10,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          const Wrap(
                            spacing: 10,
                            runSpacing: 6,
                            children: [
                              OptionCheap(),
                              OptionColor(),
                              OptionBasket(),
                              OptionFavorite(),
                              OptionDelete(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Image.asset(
                    'assets/images/iphone.png',
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: DottedLine(
              lineThickness: 1,
              dashLength: 2,
              dashColor: CustomColors.grey,
              dashGapLength: 2,
              dashGapColor: Colors.transparent,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'تومان',
                  style: TextStyle(
                    fontFamily: 'SM',
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  '48،800،000',
                  style: TextStyle(
                    fontFamily: 'SM',
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OptionCheap extends StatelessWidget {
  const OptionCheap({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: CustomColors.borderGrey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 4,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('256 گیگابایت'),
            const SizedBox(width: 10),
            Image.asset(
              'assets/images/icon_options.png',
            ),
          ],
        ),
      ),
    );
  }
}

class OptionColor extends StatelessWidget {
  const OptionColor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: CustomColors.borderGrey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 4,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: CustomColors.darkGreen,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            const SizedBox(width: 5),
            const Text(
              'سبز کله غازی',
              style: TextStyle(
                fontFamily: 'SM',
                fontSize: 10,
                color: CustomColors.grey,
              ),
            ),
            const SizedBox(width: 10),
            Image.asset(
              'assets/images/icon_options.png',
            ),
          ],
        ),
      ),
    );
  }
}

class OptionBasket extends StatelessWidget {
  const OptionBasket({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: CustomColors.borderGrey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 4,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              '1',
              style: TextStyle(
                fontFamily: 'SM',
                fontSize: 10,
                color: CustomColors.grey,
              ),
            ),
            const SizedBox(width: 10),
            Image.asset(
              'assets/images/icon_options.png',
            ),
          ],
        ),
      ),
    );
  }
}

class OptionFavorite extends StatelessWidget {
  const OptionFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: CustomColors.borderGrey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 4,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 15,
              height: 15,
              child: Image.asset(
                'assets/images/active_fav_product.png',
              ),
            ),
            const SizedBox(width: 5),
            const Text(
              'ذخیره',
              style: TextStyle(
                fontFamily: 'SM',
                fontSize: 10,
                color: CustomColors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OptionDelete extends StatelessWidget {
  const OptionDelete({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: CustomColors.borderGrey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 4,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 15,
              height: 13,
              child: Image.asset(
                'assets/images/icon_delete.png',
              ),
            ),
            const SizedBox(width: 5),
            const Text(
              'حذف',
              style: TextStyle(
                fontFamily: 'SM',
                fontSize: 10,
                color: CustomColors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
