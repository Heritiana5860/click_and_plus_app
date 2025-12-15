import 'package:app_1/card/cash_card.dart';
import 'package:app_1/composants/app_texte.dart';
import 'package:app_1/data/cashback_data.dart';
import 'package:app_1/models/cashback_modele.dart';
import 'package:flutter/material.dart';

class CashTabBar extends StatefulWidget {
  const CashTabBar({super.key});

  @override
  State<CashTabBar> createState() => _CashTabBarState();
}

class _CashTabBarState extends State<CashTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabList.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Fonction pour filtrer les données selon le tab
  List<CashModel> _getFilteredData(String tabName) {
    switch (tabName) {
      case "TOPCASHBACKS":
        return cashData;
      case "TOPCODESPROMO":
        // Filtrer les codes promo (exemple: label > 10%)
        return cashData.where((item) {
          final percentage = int.tryParse(item.label.replaceAll('%', '')) ?? 0;
          return percentage > 10;
        }).toList();
      case "TOPPARTENAIRES":
        // Filtrer les top partenaires (exemple: les 6 premiers)
        return cashData.take(6).toList();
      default:
        return cashData;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 740,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TabBar avec indicateur en bas
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey[300]!, width: 1),
                ),
              ),
              child: TabBar(
                controller: _tabController,
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                indicatorColor: Colors.black,
                indicatorWeight: 3,
                dividerColor: Colors.transparent,
                labelPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 0,
                ),
                labelStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.5,
                ),
                unselectedLabelStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                automaticIndicatorColorAdjustment: false,
                tabs: List.generate(tabList.length, (index) {
                  return AnimatedBuilder(
                    animation: _tabController,
                    builder: (context, child) {
                      final isSelected = _tabController.index == index;
                      return Tab(
                        child: Text(
                          tabList[index],
                          style: TextStyle(
                            color: isSelected ? Colors.black : Colors.grey[600],
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
            ),
          ),

          // TabBarView avec GridView
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: tabList.map<Widget>((tab) {
                final filteredData = _getFilteredData(tab);

                if (tab == "TOPCASHBACKS" || filteredData.isNotEmpty) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      key: ValueKey(tab),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 0.75,
                          ),
                      itemCount: filteredData.length,
                      itemBuilder: (context, index) {
                        return CashCard(
                          key: ValueKey('${tab}_$index'),
                          cash: filteredData[index],
                        );
                      },
                    ),
                  );
                } else {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.inbox_outlined,
                          size: 64,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Aucune donnée disponible',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  );
                }
              }).toList(),
            ),
          ),

          // Bouton "Voir toutes les offres"
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
            child: InkWell(
              onTap: () {
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppTexte(
                    texte: "Voir toutes les offres",
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(width: 6),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
