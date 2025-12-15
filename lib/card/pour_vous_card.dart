import 'package:app_1/composants/app_texte.dart';
import 'package:app_1/models/pour_vous_modele.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PourVousCard extends StatelessWidget {
  final PourVousModele offres;
  const PourVousCard({super.key, required this.offres});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: SizedBox(
              height: 100,
              width: double.infinity,
              child: Image.asset(
                "images/png/${offres.image}",
                fit: BoxFit.cover,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Categorie
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.grey[200],
                  ),
                  child: AppTexte(
                    texte: offres.categorie,
                    fontSize: 9.0,
                    fontWeight: FontWeight.w600,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 6),

                // Titre
                AppTexte(
                  texte: offres.titre,
                  fontSize: 13.0,
                  fontWeight: FontWeight.w600,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 6),
                // Type
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppTexte(
                          texte: offres.type,
                          fontSize: 10.0,
                          color: const Color.fromARGB(255, 172, 142, 54),
                          fontWeight: FontWeight.w500,
                        ),
                        const SizedBox(height: 4),
                        AppTexte(
                          texte: offres.auLieu,
                          fontSize: 8.0,
                          color: Colors.grey[600]!,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.all(6.0),
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        color: Colors.grey[200],
                      ),
                      child: SvgPicture.asset(
                        "images/svg/${offres.icon}",
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
