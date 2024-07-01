import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final double size;
  final double height;
  final double width;
  final String? url;

  const ProfileImage({
    super.key,
    this.size = 10.0,
    this.url,
    required this.height,
    required this.width,
  });


  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(size)),
        child: CachedNetworkImage(
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) =>
              const Icon(Icons.person),
          imageUrl: url ?? '',
          fit: BoxFit.cover,
          height: height,
          width: width,
        ));
  }
}
