import 'package:app_1/composants/app_texte.dart';
import 'package:app_1/models/service_modele.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ServicesCard extends StatelessWidget {
  final ServicesModel produit;
  const ServicesCard({super.key, required this.produit});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth > 600;
        return GestureDetector(
          onTap: () {
            debugPrint('Service sélectionné: ${produit.titre}');
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Container(
                    height: width ? 120 : 110,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.grey[50]!, Colors.grey[100]!],
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(width ? 14.0 : 12.0),
                      child: SvgPicture.asset(
                        produit.image,
                        fit: BoxFit.contain,
                        placeholderBuilder: (context) => Center(
                          child: Icon(
                            Icons.image_outlined,
                            color: Colors.grey[400],
                            size: width ? 50 : 48,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(width ? 12.0 : 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: AppTexte(
                                texte: produit.titre,
                                fontSize: width ? 14 : 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(width: width ? 6 : 4),
                            GestureDetector(
                              onTap: () {
                                debugPrint('Détails de: ${produit.titre}');
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: width ? 8 : 6,
                                  vertical: width ? 6 : 3,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    AppTexte(
                                      texte: produit.details,
                                      fontSize: width ? 14 : 12,
                                      color: Colors.grey[700]!,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    const SizedBox(width: 2),
                                    Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: Colors.grey[700],
                                      size: width ? 16 : 14,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: width ? 8 : 6),

                        // Description
                        Expanded(
                          child: AppTexte(
                            texte: produit.description,
                            fontSize: width ? 14 : 12,
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
      },
    );
  }
}
