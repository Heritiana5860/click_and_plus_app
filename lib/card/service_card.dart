import 'package:app_1/composants/app_texte.dart';
import 'package:app_1/models/service_modele.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ServicesCard extends StatelessWidget {
  final ServicesModel produit;
  const ServicesCard({super.key, required this.produit});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint('Service sélectionné: ${produit.titre}');
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.white,
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black.withValues(alpha: 0.08),
          //     spreadRadius: 1,
          //     blurRadius: 6,
          //     offset: const Offset(0, 2),
          //   ),
          // ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section - Optimisée pour meilleure visibilité
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Container(
                height: 110,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.grey[50]!, Colors.grey[100]!],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    produit.image,
                    fit: BoxFit.contain,
                    placeholderBuilder: (context) => Center(
                      child: Icon(
                        Icons.image_outlined,
                        color: Colors.grey[400],
                        size: 48,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Content Section
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Titre avec bouton détails
                    Row(
                      children: [
                        Expanded(
                          child: AppTexte(
                            texte: produit.titre,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: () {
                            debugPrint('Détails de: ${produit.titre}');
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 3,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                AppTexte(
                                  texte: produit.details,
                                  fontSize: 12,
                                  color: Colors.grey[700]!,
                                  fontWeight: FontWeight.w600,
                                ),
                                const SizedBox(width: 2),
                                Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: Colors.grey[700],
                                  size: 14,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 6),

                    // Description
                    Expanded(
                      child: AppTexte(
                        texte: produit.description,
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
