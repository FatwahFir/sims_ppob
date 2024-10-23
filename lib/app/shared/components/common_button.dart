import 'package:flutter/material.dart';
import 'package:sims_ppob/app/theme/themes.dart';

class CommonButton extends ElevatedButton {
  CommonButton({
    super.key,
    required Widget super.child,
    VoidCallback? onPressed,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool? autofocus,
    Clip? clipBehavior,
    bool? hasBorderSide = false,
    Color? borderColor,
    double? borderWidth,
    bool? isExtended,
    EdgeInsetsGeometry? padding,
    VisualDensity? visualDensity,
    MaterialTapTargetSize? materialTapTargetSize,
    Color? backgroundColor,
    Color? foregroundColor = Colors.white,
    double? elevation,
    double? radius,
    Size? size,
    double? focusElevation,
    double? hoverElevation,
    double? highlightElevation,
    double? disabledElevation,
    MouseCursor? mouseCursor,
    bool? enableFeedback,
    Size? minimumSize,
    Size? maximumSize,
    BoxConstraints? constraints,
    ShapeBorder? shape,
    Duration? animationDuration,
    Widget? Function(BuildContext context, Widget? child)? builder,
    Widget? icon,
    Widget? label,
  }) : super(
          onPressed: onPressed ?? () {},
          style: ElevatedButton.styleFrom(
            foregroundColor: foregroundColor ?? Themes.white,
            backgroundColor: backgroundColor ?? Themes.red,
            // disabledForegroundColor: foregroundColor!.withOpacity(0.38),
            // disabledBackgroundColor: foregroundColor.withOpacity(0.12),
            elevation: elevation ?? 0,
            // shadowColor: foregroundColor ?? Colors.transparent,
            padding: padding ?? const EdgeInsets.all(5),
            visualDensity:
                visualDensity ?? VisualDensity.adaptivePlatformDensity,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 5),
            ),

            minimumSize: size ?? const Size(double.infinity, 50),
            maximumSize: size ?? const Size(double.infinity, 50),
            side: hasBorderSide!
                ? BorderSide(
                    color: borderColor ?? Colors.transparent,
                    width: borderWidth ?? 1,
                  )
                : BorderSide.none,
          ),
          focusNode: focusNode ?? FocusNode(),
          autofocus: autofocus ?? false,
          clipBehavior: clipBehavior ?? Clip.none,
        );
}
