import 'package:flutter/material.dart';
import 'package:sims_ppob/app/theme/themes.dart';

class LoadingIndicatior extends StatelessWidget {
  const LoadingIndicatior({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Themes.red,
      ),
    );
  }
}
