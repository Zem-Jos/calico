import 'package:calico/widgets/shimmer.dart';
import 'package:flutter/material.dart';

class ArticleImage extends StatelessWidget {
  final String? imageUrl;
  final double? width;
  final double? height;

  const ArticleImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl!,
      fit: BoxFit.cover,
      loadingBuilder: (
        BuildContext context,
        Widget child,
        ImageChunkEvent? loadingProgress,
      ) {
        if (loadingProgress == null) return child;
        return const ShimmerArticleCard();
      },
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(
          'assets/images/article/article-default.png',
          width: width,
          height: height,
          fit: BoxFit.cover,
        );
      },
    );
  }
}
