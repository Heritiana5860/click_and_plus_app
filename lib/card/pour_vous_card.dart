import 'package:app_1/composants/app_texte.dart';
import 'package:app_1/models/pour_vous_modele.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PourVousCard extends StatelessWidget {
  final PourVousModele offres;
  const PourVousCard({super.key, required this.offres});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth > 600;
        return Container(
          width: MediaQuery.of(context).size.width * 0.45,
          margin: EdgeInsets.only(right: width ? 16 : 10),
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
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: SizedBox(
                  height: width ? 120 : 100,
                  width: double.infinity,
                  child: Image.asset(
                    "images/png/${offres.image}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(width ? 12.0 : 10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Categorie
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: width ? 10 : 8.0,
                          vertical: width ? 3 : 1,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.grey[200],
                        ),
                        child: AppTexte(
                          texte: offres.categorie,
                          fontSize: width ? 10.0 : 8.0,
                          fontWeight: FontWeight.w600,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          color: Colors.black,
                        ),
                      ),

                      SizedBox(height: width ? 6 : 4),

                      // Titre
                      AppTexte(
                        texte: offres.titre,
                        fontSize: width ? 14.0 : 12.0,
                        fontWeight: FontWeight.w600,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                      SizedBox(height: width ? 4 : 2),
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
                                fontSize: width ? 12.0 : 10.0,
                                color: const Color.fromARGB(255, 172, 142, 54),
                                fontWeight: FontWeight.w500,
                              ),
                              const SizedBox(height: 2),
                              AppTexte(
                                texte: offres.auLieu,
                                fontSize: width ? 10.0 : 8.0,
                                color: Colors.grey[600]!,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                          Spacer(),
                          Container(
                            padding: EdgeInsets.all(6.0),
                            height: width ? 32 : 30,
                            width: width ? 32 : 30,
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
              ),
            ],
          ),
        );
      },
    );
  }
}
