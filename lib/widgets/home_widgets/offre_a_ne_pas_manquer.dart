import 'package:app_1/card/offre_card.dart';
import 'package:app_1/composants/marge_vertical.dart';
import 'package:app_1/data/offre_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OffreANePasManquer extends StatefulWidget {
  const OffreANePasManquer({super.key});

  @override
  State<OffreANePasManquer> createState() => _OffreANePasManquerState();
}

class _OffreANePasManquerState extends State<OffreANePasManquer> {
  // 1. Contrôleur de défilement
  final ScrollController _scrollController = ScrollController();

  // 2. Index de la carte actuellement visible (la première carte visible)
  int _currentIndex = 0;

  // Largeur d'une seule carte (approximation)
  static const double _cardWidth = 160.0;

  @override
  void initState() {
    super.initState();
    // 3. Écouter les événements de défilement
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  // 4. Fonction pour suivre la position
  void _scrollListener() {
    // Calculer la position actuelle du défilement
    double scrollPosition = _scrollController.offset;
    // Calculer l'index basé sur la position / la largeur d'une carte
    int newIndex = (scrollPosition / _cardWidth).round();

    if (newIndex != _currentIndex) {
      setState(() {
        _currentIndex = newIndex;
      });
    }
  }

  // 5. Widget de l'indicateur de point amélioré
  Widget _buildPageIndicator() {
    if (offres.isEmpty) {
      return const SizedBox.shrink();
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(offres.length, (index) {
        bool isActive = _currentIndex == index;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          width: isActive ? 24.0 : 8.0,
          height: 8.0,
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: isActive
                ? Theme.of(context).primaryColor
                : Colors.grey.withValues(alpha: 0.3),
            boxShadow: isActive
                ? [
                    BoxShadow(
                      color: Theme.of(
                        context,
                      ).primaryColor.withValues(alpha: 0.3),
                      blurRadius: 4.0,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250 + 30.0,
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Titre
          Text(
            "Offres à ne pas manquer",
            style: GoogleFonts.firaSans(
              fontSize: 18.0,
              fontWeight: FontWeight.w800,
            ),
          ),

          MargeVertical(height: 10.0),

          // Liste des produits
          Expanded(
            child: SizedBox(
              height: 180.0,
              width: double.infinity,
              child: ListView.builder(
                controller: _scrollController,
                itemCount: offres.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final data = offres[index];
                  return OffreCard(offres: data);
                },
              ),
            ),
          ),

          const MargeVertical(height: 10.0),

          // L'indicateur de page
          _buildPageIndicator(),
        ],
      ),
    );
  }
}
