import 'package:app_1/composants/app_texte.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppButton extends StatelessWidget {
  final Color? color;
  final BoxBorder? border;
  final String texte;
  final Color texteColor;
  final FontWeight fontWeight;
  final String icon;
  final Function()? onTap;
  final bool etatIcon;
  const AppButton({
    super.key,
    this.color,
    this.border,
    required this.texte,
    required this.texteColor,
    this.onTap,
    this.fontWeight = FontWeight.normal,
    this.icon = "",
    this.etatIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
          border: border,
        ),
        child: Row(
          children: [
            etatIcon
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: SvgPicture.asset(
                      icon,
                      height: 10,
                      color: Colors.black,
                    ),
                  )
                : Container(),
            AppTexte(texte: texte, color: texteColor, fontWeight: fontWeight),
          ],
        ),
      ),
    );
  }
}
