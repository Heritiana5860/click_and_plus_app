import 'package:app_1/composants/app_texte.dart';
import 'package:app_1/models/derniere_modele.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DerniereCard extends StatelessWidget {
  final DerniereModele offres;
  const DerniereCard({super.key, required this.offres});

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
            color: Color.fromARGB(221, 226, 218, 97),
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
              Stack(
                clipBehavior: Clip.none,
                children: [
                  // Image
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                    child: SizedBox(
                      height: width ? 150 : 100,
                      width: double.infinity,
                      child: Image.asset(
                        "images/png/${offres.image}",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // Icon
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: EdgeInsets.all(width ? 8.0 : 4.0),
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
                      child: AppTexte(
                        texte: offres.quantite,
                        fontSize: width ? 14.0 : 10.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  // Icon
                  Positioned(
                    bottom: -24,
                    left: 8,
                    child: Container(
                      width: width ? 80 : 50,
                      height: width ? 50 : 30,
                      padding: EdgeInsets.all(width ? 10 : 8.0),
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
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),

              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(width ? 12.0 : 10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Titre
                      Align(
                        alignment: Alignment.topRight,
                        child: AppTexte(
                          texte: offres.type,
                          fontSize: width ? 14.0 : 11.0,
                          fontWeight: FontWeight.w600,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),

                      SizedBox(height: width ? 16.0 : 12.0),

                      // Titre
                      AppTexte(
                        texte: offres.titre,
                        fontSize: width ? 16.0 : 14.0,
                        fontWeight: FontWeight.w700,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                      SizedBox(height: width ? 7 : 5),
                      // Categorie
                      AppTexte(
                        texte: offres.description,
                        fontSize: width ? 14.0 : 12.0,
                        fontWeight: FontWeight.w600,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        color: Colors.black87,
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
