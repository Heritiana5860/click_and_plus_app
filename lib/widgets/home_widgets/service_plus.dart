import 'package:app_1/card/service_card.dart';
import 'package:app_1/composants/app_texte.dart';
import 'package:app_1/data/service_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ServicePlus extends StatelessWidget {
  const ServicePlus({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // En-tête
          Row(
            children: [
              Text(
                "Services+",
                style: GoogleFonts.firaSans(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  // Navigation vers tous les services
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppTexte(
                      texte: "Voir tous les services",
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(width: 4),
                    const Padding(
                      padding: EdgeInsets.only(top: 2.0),
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 14,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // GridView des services
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.9,
            ),
            itemCount: serviceData.length,
            itemBuilder: (context, index) {
              return ServicesCard(
                key: ValueKey('service_$index'),
                produit: serviceData[index],
              );
            },
          ),
        ],
      ),
    );
  }
}
