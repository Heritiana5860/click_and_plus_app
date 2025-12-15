import 'dart:async';
import 'package:app_1/card/derniere_card.dart';
import 'package:app_1/composants/app_texte.dart';
import 'package:app_1/composants/marge_vertical.dart';
import 'package:app_1/data/derniere_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DerniereChance extends StatefulWidget {
  const DerniereChance({super.key});

  @override
  State<DerniereChance> createState() => _DerniereChanceState();
}

class _DerniereChanceState extends State<DerniereChance> {
  late PageController _pageController;
  Timer? _timer;
  int _currentPage = 0;

  // Nombre de cards par page
  static const int _cardsPerPage = 2;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 1.0);
    _startAutoScroll();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  // Démarrer le défilement automatique
  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        // Calculer le nombre total de pages
        int totalPages = (derniereData.length / _cardsPerPage).ceil();

        // Passer à la page suivante
        if (_currentPage < totalPages - 1) {
          _currentPage++;
        } else {
          _currentPage = 0; // Revenir au début
        }

        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Calculer le nombre total de pages
    int totalPages = (derniereData.length / _cardsPerPage).ceil();

    return Container(
      width: double.infinity,
      height: 280, // Augmenté pour l'indicateur
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Titre
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Dernière chance
              Text(
                "Dernière chance",
                style: GoogleFonts.firaSans(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const Spacer(),

              // Voir toutes les offres
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Voir toutes les offres
                  AppTexte(
                    texte: "Voir toutes les offres",
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),

                  // Icon arrow_right
                  const Padding(
                    padding: EdgeInsets.only(top: 4.0, left: 4.0),
                    child: Icon(Icons.arrow_forward_ios_rounded, size: 16.0),
                  ),
                ],
              ),
            ],
          ),

          const MargeVertical(height: 10.0),

          // Carousel
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: totalPages,
              itemBuilder: (context, pageIndex) {
                // Calculer les indices de début et fin pour cette page
                int startIndex = pageIndex * _cardsPerPage;
                int endIndex = (startIndex + _cardsPerPage).clamp(
                  0,
                  derniereData.length,
                );

                return Row(
                  children: [
                    for (int i = startIndex; i < endIndex; i++)
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: i < endIndex - 1 ? 10.0 : 0,
                          ),
                          child: DerniereCard(offres: derniereData[i]),
                        ),
                      ),
                    // Ajouter un espace vide si moins de 2 cards sur la dernière page
                    if (endIndex - startIndex < _cardsPerPage)
                      Expanded(child: Container()),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
