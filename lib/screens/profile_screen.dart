import 'package:apple_shop/widgets/category_icon_item_chip.dart';
import 'package:apple_shop/constants/colors.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundScreenColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 44,
                right: 44,
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
                    const SizedBox(
                      width: 16,
                    ),
                    Image.asset(
                      'assets/images/icon_apple_blue.png',
                    ),
                    const Expanded(
                      child: Text(
                        'حساب کاربری',
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
            const Text(
              'ملیکا مردانی',
              style: TextStyle(
                fontFamily: 'SB',
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              '09939127578',
              style: TextStyle(
                fontFamily: 'SM',
                fontSize: 10,
              ),
            ),
            const SizedBox(height: 30),
            const Directionality(
              textDirection: TextDirection.rtl,
              child: Wrap(
                spacing: 35,
                runSpacing: 18,
                children: [
                  // CategorylItemChip(),
                  // CategorylItemChip(),
                  // CategorylItemChip(),
                  // CategorylItemChip(),
                  // CategorylItemChip(),
                  // CategorylItemChip(),
                  // CategorylItemChip(),
                  // CategorylItemChip(),
                  // CategorylItemChip(),
                  // CategorylItemChip(),
                ],
              ),
            ),
            const Spacer(),
            const Text(
              'اپل شاپ',
              style: TextStyle(
                fontFamily: 'SM',
                fontSize: 10,
                color: CustomColors.grey,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'V-1.0.00',
              style: TextStyle(
                fontFamily: 'SM',
                fontSize: 10,
                color: CustomColors.grey,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Instagram.com/skyflutter.me',
              style: TextStyle(
                fontFamily: 'SM',
                fontSize: 10,
                color: CustomColors.grey,
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
