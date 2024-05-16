import 'package:flutter/material.dart';

class NewsContainerImage extends StatelessWidget {
  const NewsContainerImage({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(
            image,
          ),
        ),
      ),
    );
  }
}
