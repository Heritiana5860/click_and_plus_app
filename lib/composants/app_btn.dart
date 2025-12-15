import 'package:flutter/material.dart';

enum AppButtonType { filled, outline, text }

class AppButtons extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final AppButtonType type;
  final Color? color;
  final Color? textColor;
  final double borderRadius;
  final FontWeight fontWeight;
  final double fontSize;
  final bool isLoading;
  final double borderWidth;
  final Color? borderColor;

  const AppButtons({
    super.key,
    required this.label,
    required this.onPressed,
    this.width,
    this.height = 48,
    this.type = AppButtonType.filled,
    this.color,
    this.textColor,
    this.borderRadius = 12,
    this.fontWeight = FontWeight.w600,
    this.fontSize = 16,
    this.isLoading = false,
    this.borderWidth = 1.5,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    Color resolvedBackgroundColor;
    Color resolvedTextColor;
    BorderSide resolvedBorder;

    switch (type) {
      case AppButtonType.filled:
        resolvedBackgroundColor =
            color ?? Theme.of(context).colorScheme.primary;
        resolvedTextColor = textColor ?? Colors.white;
        resolvedBorder = BorderSide.none;
        break;

      case AppButtonType.outline:
        resolvedBackgroundColor = Colors.transparent;
        resolvedTextColor = textColor ?? Theme.of(context).colorScheme.primary;
        resolvedBorder = BorderSide(
          width: borderWidth,
          color: borderColor ?? Theme.of(context).colorScheme.primary,
        );
        break;

      case AppButtonType.text:
        resolvedBackgroundColor = Colors.transparent;
        resolvedTextColor = textColor ?? Theme.of(context).colorScheme.primary;
        resolvedBorder = BorderSide.none;
        break;
    }
    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: resolvedBackgroundColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: resolvedBorder,
          ),
        ),
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? const SizedBox(
                height: 22,
                width: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            : Text(
                label,
                style: TextStyle(
                  color: resolvedTextColor,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                ),
              ),
      ),
    );
  }
}
