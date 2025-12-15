import 'package:app_1/composants/app_texte.dart';
import 'package:app_1/models/offre_modele.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OffreCard extends StatelessWidget {
  final OffreModele offres;
  const OffreCard({super.key, required this.offres});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth > 600;

        return Container(
          width: MediaQuery.of(context).size.width * 0.45,
          margin: EdgeInsets.only(right: width ? 12 : 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey[100],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  // Image
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                    child: SizedBox(
                      height: width ? 100 : 80,
                      width: double.infinity,
                      child: Image.asset(
                        "images/png/${offres.image}",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // Icon
                  Positioned(
                    left: 8,
                    bottom: 8,
                    child: Container(
                      padding: EdgeInsets.all(width ? 10.0 : 8.0),
                      width: width ? 40 : 20,
                      height: width ? 40 : 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: SvgPicture.asset(
                        "images/svg/${offres.icon}",
                        width: width ? 16 : 14,
                        height: width ? 16 : 14,
                      ),
                    ),
                  ),
                ],
              ),

              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(width ? 14.0 : 10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Titre
                      AppTexte(
                        texte: offres.titre,
                        fontSize: width ? 16.0 : 14.0,
                        fontWeight: FontWeight.w700,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                      const SizedBox(height: 4),
                      // Categorie
                      AppTexte(
                        texte: offres.categorie,
                        fontSize: width ? 14.0 : 12.0,
                        fontWeight: FontWeight.w600,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        color: const Color.fromARGB(255, 172, 142, 54),
                      ),

                      const SizedBox(height: 6),
                      // Sponsor
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.info_outline,
                            size: width ? 14.0 : 12.0,
                            color: Colors.grey[600],
                          ),
                          const SizedBox(width: 4),
                          AppTexte(
                            texte: "Sponsorisé",
                            fontSize: width ? 13.0 : 10.0,
                            color: Colors.grey[600]!,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
