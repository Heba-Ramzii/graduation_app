import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key,
      this.size = 15.0,
      this.url = 'https://img.freepik.com/free-photo/view-3d-person-sleeping-clouds_23-2151113525.jpg?t=st=1706637011~exp=1706640611~hmac=5e7979feb03f106a75f4dab992fb94150bd270fb939f27a311ff240940ebb1cc&w=360',

    });
  final double size ;
  final String? url;


  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(size)),
      child:CachedNetworkImage(
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(
            Icons.error_outline_rounded
        )
        ,
        imageUrl: url!,
        fit: BoxFit.cover,
        height: size,
        width: size,
      )
    );
  }
}
