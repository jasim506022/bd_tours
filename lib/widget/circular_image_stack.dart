import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class CircularImageStack extends StatelessWidget {
  const CircularImageStack({
    super.key,
    required this.urlImage,
  });

  final String urlImage;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        padding: const EdgeInsets.all(1),
        color: Colors.white,
        child: ClipOval(
          child: FancyShimmerImage(
            imageUrl: urlImage,
            boxFit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
