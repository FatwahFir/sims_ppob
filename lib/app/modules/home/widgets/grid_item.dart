import 'package:flutter/material.dart';
import 'package:sims_ppob/app/shared/ui/gap.dart';

class GridItem extends StatelessWidget {
  final String title;
  final String image;

  const GridItem({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
          width: 45,
        ),
        const Gap.v(h: 5),
        Text(
          title,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
