import 'package:flutter/widgets.dart';

class Gap extends StatelessWidget {
  final double? width;
  final double? height;

  const Gap.v({super.key, required double h})
      : height = h,
        width = null;

  const Gap.h({super.key, required double w})
      : width = w,
        height = null;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
    );
  }
}
