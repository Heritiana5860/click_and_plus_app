import 'package:app_1/composants/app_texte.dart';
import 'package:app_1/models/cashback_modele.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CashCard extends StatelessWidget {
  final CashModel cash;
  const CashCard({super.key, required this.cash});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: Colors.grey[100],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
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
                      padding: const EdgeInsets.all(8.0),
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
                      fontSize: 8,
                      color: Colors.grey[600]!,
                      decoration: TextDecoration.lineThrough,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

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

            const SizedBox(height: 8),

            // Titre
            AppTexte(
              texte: cash.titre,
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.black87,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),

            const SizedBox(height: 6),

            // Label Pourcentage
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 6.0,
                horizontal: 10.0,
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
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),

                  const SizedBox(width: 4),

                  // Icon
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: const Icon(
                      Icons.arrow_upward,
                      size: 6,
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
  }
}
