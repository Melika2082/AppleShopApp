import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CachedImage extends StatelessWidget {
  String? imageUrl;
  double radius;

  CachedImage({
    super.key,
    this.imageUrl,
    this.radius = 0,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(radius),
      ),
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: imageUrl ?? 'لطفا اتصال اینترنت خود را چک کنید',
        errorWidget: (context, url, error) => Container(
          color: Colors.red,
        ),
        placeholder: (context, url) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
            color: Colors.grey[300],
          ),
        ),
      ),
    );
  }
}
