import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sims_ppob/app/shared/ui/gap.dart';

class GridItem extends StatelessWidget {
  final String title;
  final String image;

  const GridItem({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: title,
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: image,
            width: 45,
          ),
          const Gap.v(h: 5),
          Text(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            title,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
