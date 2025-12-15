import 'package:app_1/card/pour_vous_card.dart';
import 'package:app_1/data/pour_vous_data.dart';
import 'package:app_1/models/pour_vous_modele.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PourVous extends StatefulWidget {
  const PourVous({super.key});

  @override
  State<PourVous> createState() => _PourVousState();
}

class _PourVousState extends State<PourVous>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabBars.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Fonction pour filtrer les données selon le tab sélectionné
  List<PourVousModele> _getFilteredData(String tabName) {
    // Pour le tab "Pour vous", afficher tous les produits
    if (tabName == "Pour vous") {
      return pourVousData;
    }

    // Pour les autres tabs, filtrer selon la logique métier
    // Ici, exemple de filtrage - à adapter selon vos besoins
    switch (tabName) {
      case "Nouveau":
        // Filtrer les nouveaux produits (exemple: les 5 premiers)
        return pourVousData.take(5).toList();
      case "Top deals":
        // Filtrer les top deals (exemple: ceux avec "905%" dans le titre)
        return pourVousData
            .where((item) => item.titre.contains("905%"))
            .toList();
      case "En vedette":
        // Filtrer les produits en vedette (exemple: Mode & Accessoire)
        return pourVousData
            .where((item) => item.categorie == "Mode & Accessoire")
            .toList();
      case "Services":
        // Filtrer les services (exemple: High-Tech)
        return pourVousData
            .where((item) => item.categorie == "High-Tech")
            .toList();
      default:
        return pourVousData;
    }
  }

  // Widget pour construire le contenu d'un tab avec 2 lignes
  Widget _buildTabContent(List<PourVousModele> data) {
    if (data.isEmpty) {
      return const Center(
        child: Text(
          "Aucun produit disponible",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    // Diviser les données en 2 groupes pour 2 lignes
    final int halfLength = (data.length / 2).ceil();
    final List<PourVousModele> firstRow = data.take(halfLength).toList();
    final List<PourVousModele> secondRow = data.skip(halfLength).toList();

    return Column(
      children: [
        // Première ligne
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: firstRow.length,
            itemBuilder: (context, index) {
              return PourVousCard(offres: firstRow[index]);
            },
          ),
        ),

        const SizedBox(height: 10),

        // Deuxième ligne
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: secondRow.length,
            itemBuilder: (context, index) {
              return PourVousCard(offres: secondRow[index]);
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 550,
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tab bar
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12)
              ),
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              indicator: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              indicatorPadding: const EdgeInsets.symmetric(
                horizontal: -12,
                vertical: 6,
              ),
              tabAlignment: TabAlignment.start,
              dividerColor: Colors.transparent,
              labelPadding: const EdgeInsets.symmetric(horizontal: 16),
              tabs: List.generate(tabBars.length, (index) {
                return Tab(
                  height: 44,
                  child: AnimatedBuilder(
                    animation: _tabController,
                    builder: (context, child) {
                      final isSelected = _tabController.index == index;
                      final tab = tabBars[index];

                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Icône (si disponible)
                          if (tab.icon != null) ...[
                            SvgPicture.asset(
                              "images/svg/${tab.icon}",
                              height: 16,
                              width: 16,
                              colorFilter: ColorFilter.mode(
                                isSelected ? Colors.white : Colors.grey[900]!,
                                BlendMode.srcIn,
                              ),
                            ),
                            const SizedBox(width: 8),
                          ],
                          // Texte
                          Text(
                            tab.texte,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: isSelected
                                  ? Colors.white
                                  : Colors.grey[900],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                );
              }),
            ),
          ),

          const SizedBox(height: 16),

          // Contenu des tabs
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: tabBars.map((tab) {
                final filteredData = _getFilteredData(tab.texte);
                return _buildTabContent(filteredData);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
