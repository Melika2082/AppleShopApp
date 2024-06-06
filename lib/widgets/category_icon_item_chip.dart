import 'package:apple_shop/widgets/cached_image.dart';
import 'package:apple_shop/data/model/category.dart';
import 'package:flutter/material.dart';

class CategorylItemChip extends StatelessWidget {
  final Category category;

  const CategorylItemChip(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    String categoryColor = 'FF${category.color}';
    int hexColor = int.parse(categoryColor, radix: 16);

    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              height: 56,
              width: 56,
              decoration: ShapeDecoration(
                color: Color(hexColor),
                shadows: [
                  BoxShadow(
                    color: Color(hexColor),
                    blurRadius: 25,
                    spreadRadius: -15,
                    offset: const Offset(0.0, 15.0),
                  ),
                ],
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
            SizedBox(
              width: 24,
              height: 24,
              child: Center(
                child: CachedImage(
                  imageUrl: category.icon,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          category.title ?? '',
          style: const TextStyle(
            fontFamily: 'SB',
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
