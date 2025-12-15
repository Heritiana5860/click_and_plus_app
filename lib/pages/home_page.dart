import 'package:app_1/composants/marge_vertical.dart';
import 'package:app_1/widgets/home_widgets/banier.dart';
import 'package:app_1/widgets/home_widgets/cashback.dart';
import 'package:app_1/widgets/home_widgets/derniere_chance.dart';
import 'package:app_1/widgets/home_widgets/offre_a_ne_pas_manquer.dart';
import 'package:app_1/widgets/home_widgets/partagez.dart';
import 'package:app_1/widgets/home_widgets/pour_vous.dart';
import 'package:app_1/widgets/home_widgets/service_plus.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Banier
          Banier(),

          MargeVertical(height: 12.0),

          // Offre à ne pas manquer
          OffreANePasManquer(),

          MargeVertical(height: 12.0),
          Divider(thickness: 0.3),
          MargeVertical(height: 12.0),

          // Dernière chance
          DerniereChance(),

          MargeVertical(height: 12.0),

          // Pour vous
          PourVous(),

          MargeVertical(height: 12.0),
          Divider(thickness: 0.3),
          MargeVertical(height: 12.0),

          // Top cashbacks
          CashTabBar(),

          MargeVertical(height: 12.0),
          Divider(thickness: 0.3),
          MargeVertical(height: 12.0),

          // Services +
          ServicePlus(),

          MargeVertical(height: 12.0),
          Divider(thickness: 0.3),
          MargeVertical(height: 12.0),

          // Partagez et gagnez +
          Partagez(),

          MargeVertical(height: 12.0),
        ],
      ),
    );
  }
}
