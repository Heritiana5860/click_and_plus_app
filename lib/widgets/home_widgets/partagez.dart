import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;

import 'package:google_fonts/google_fonts.dart';

class Partagez extends StatefulWidget {
  const Partagez({super.key});

  @override
  State<Partagez> createState() => _PartagezState();
}

class _PartagezState extends State<Partagez> with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;

  final List<Map<String, dynamic>> reseauSociaux = [
    {"icon": "images/svg/f4.svg", "size": 45.0, "top": 10.0, "right": 20.0},
    {"icon": "images/svg/f2.svg", "size": 40.0, "top": 45.0, "right": 70.0},
    {"icon": "images/svg/f5.svg", "size": 90.0, "top": 60.0, "right": 10.0},
    {"icon": "images/svg/f3.svg", "size": 42.0, "top": 135.0, "right": 15.0},
    {"icon": "images/svg/f1.svg", "size": 38.0, "top": 135.0, "right": 65.0},
  ];

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      reseauSociaux.length,
      (index) => AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 3500 + (index * 500)),
      )..repeat(reverse: true),
    );

    _animations = _controllers.map((controller) {
      return Tween<double>(
        begin: -4.0,
        end: 4.0, // Réduit de 8 à 4 pour rester dans le cadre
      ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
    }).toList();
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      padding: const EdgeInsets.all(20.0),
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.black,
      ),
      child: Stack(
        clipBehavior: Clip.none, // Permet un léger débordement contrôlé
        children: [
          // Contenu texte
          Positioned(
            left: 0,
            top: 0,
            right: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Titre
                RichText(
                  text: TextSpan(
                    style: GoogleFonts.firaSans(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w700,
                        height: 1.2,
                        letterSpacing: -0.8,
                      ),
                    ),
                    children: [
                      TextSpan(text: "Partagez et "),
                      TextSpan(
                        text: "gagnez +",
                        style: TextStyle(color: Color(0xffffde77)),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                // Description
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 11.5,
                      height: 1.4,
                    ),
                    children: [
                      TextSpan(text: "Invitez d'autres personnes à rejoindre "),
                      TextSpan(
                        text: "Clickandplus ",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text:
                            "et gagnez sur leurs achats des points convertibles en cash ou en ",
                      ),
                      TextSpan(
                        text: "réductions.",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Boutons
                Row(
                  children: [
                    // Bouton Partager
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 6.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: const Color(0xffffde77),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.link, size: 11, color: Colors.black),
                            const SizedBox(width: 6),
                            Text(
                              "Partager mon lien",
                              style: GoogleFonts.firaSans(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(width: 4),

                    // Bouton En savoir plus
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 4.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: const Color(0xffffde77),
                            width: 2,
                          ),
                        ),
                        child: Text(
                          "En savoir plus",
                          style: GoogleFonts.firaSans(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Icônes flottantes avec animation
          ...List.generate(reseauSociaux.length, (index) {
            final social = reseauSociaux[index];
            final isTikTok = index == 2;

            return AnimatedBuilder(
              animation: _animations[index],
              builder: (context, child) {
                return Positioned(
                  right: social['right'] + _animations[index].value,
                  top:
                      social['top'] +
                      (math.sin(_controllers[index].value * 2 * math.pi) *
                          2), // Réduit de 5 à 3
                  child: Transform.rotate(
                    angle:
                        math.sin(_controllers[index].value * 2 * math.pi) *
                        0.05, // Réduit de 0.08 à 0.05
                    child: Container(
                      width: social['size'],
                      height: social['size'],
                      padding: EdgeInsets.all(isTikTok ? 14.0 : 9.0),
                      child: SvgPicture.asset(
                        social['icon'],
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                );
              },
            );
          }),
        ],
      ),
    );
  }
}
