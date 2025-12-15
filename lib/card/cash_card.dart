import 'package:app_1/composants/app_texte.dart';
import 'package:app_1/models/cashback_modele.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CashCard extends StatelessWidget {
  final CashModel cash;
  const CashCard({super.key, required this.cash});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth > 600;
        return Container(
          width: MediaQuery.of(context).size.width * 0.30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: Colors.grey[100],
          ),
          child: Padding(
            padding: EdgeInsets.all(width ? 14.0 : 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Icon Container avec badge de réduction
                Expanded(
                  flex: 3,
                  child: Stack(
                    children: [
                      // Image SVG centrée
                      Center(
                        child: Padding(
                          padding: EdgeInsets.all(width ? 10.0 : 8.0),
                          child: SvgPicture.asset(
                            cash.icon1,
                            fit: BoxFit.contain,
                            placeholderBuilder: (context) =>
                                Container(color: Colors.grey[200]),
                            excludeFromSemantics: true,
                          ),
                        ),
                      ),

                      // Badge de réduction en haut à droite
                      Positioned(
                        top: 0,
                        right: 0,
                        child: AppTexte(
                          texte: cash.reduction,
                          fontSize: width ? 10 : 8,
                          color: Colors.grey[600]!,
                          decoration: TextDecoration.lineThrough,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: width ? 10 : 8),

                // Divider en tirets
                Row(
                  children: List.generate(
                    20,
                    (index) => Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 1),
                        height: 1,
                        color: index % 2 == 0
                            ? Colors.grey[400]
                            : Colors.transparent,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: width ? 10 : 8),

                // Titre
                AppTexte(
                  texte: cash.titre,
                  fontWeight: FontWeight.bold,
                  fontSize: width ? 16 : 14,
                  color: Colors.black87,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 6),

                // Label Pourcentage
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: width ? 8.0 : 6.0,
                    horizontal: width ? 12.0 : 10.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Texte
                      AppTexte(
                        texte: cash.label,
                        fontSize: width ? 14 : 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),

                      SizedBox(width: width ? 6 : 4),

                      // Icon
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.arrow_upward,
                          size: width ? 6 : 4,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
