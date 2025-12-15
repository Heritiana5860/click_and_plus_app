// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'dart:math' as math;

// import 'package:google_fonts/google_fonts.dart';

// class Partagez extends StatefulWidget {
//   const Partagez({super.key});

//   @override
//   State<Partagez> createState() => _PartagezState();
// }

// class _PartagezState extends State<Partagez> with TickerProviderStateMixin {
//   late List<AnimationController> _controllers;
//   late List<Animation<double>> _animations;

//   final List<Map<String, dynamic>> reseauSociaux = [
//     {"icon": "images/svg/f4.svg", "size": 45.0, "top": 10.0, "right": 20.0},
//     {"icon": "images/svg/f2.svg", "size": 40.0, "top": 45.0, "right": 70.0},
//     {"icon": "images/svg/f5.svg", "size": 90.0, "top": 60.0, "right": 10.0},
//     {"icon": "images/svg/f3.svg", "size": 42.0, "top": 135.0, "right": 15.0},
//     {"icon": "images/svg/f1.svg", "size": 38.0, "top": 135.0, "right": 65.0},
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _controllers = List.generate(
//       reseauSociaux.length,
//       (index) => AnimationController(
//         vsync: this,
//         duration: Duration(milliseconds: 3500 + (index * 500)),
//       )..repeat(reverse: true),
//     );

//     _animations = _controllers.map((controller) {
//       return Tween<double>(
//         begin: -4.0,
//         end: 4.0,
//       ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
//     }).toList();
//   }

//   @override
//   void dispose() {
//     for (var controller in _controllers) {
//       controller.dispose();
//     }
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         final width = constraints.maxWidth > 600;
//         return Container(
//           margin: EdgeInsets.symmetric(horizontal: width ? 12.0 : 10.0),
//           padding: EdgeInsets.all(width ? 22.0 : 20.0),
//           width: double.infinity,
//           height: 200,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(12.0),
//             color: Colors.black,
//           ),
//           child: Stack(
//             clipBehavior: Clip.none,
//             children: [
//               // Contenu texte
//               Positioned(
//                 left: 0,
//                 top: 0,
//                 right: width ? 140 : 120,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Titre
//                     RichText(
//                       text: TextSpan(
//                         style: GoogleFonts.firaSans(
//                           textStyle: TextStyle(
//                             color: Colors.white,
//                             fontSize: width ? 24.0 : 22.0,
//                             fontWeight: FontWeight.w700,
//                             height: 1.2,
//                             letterSpacing: -0.8,
//                           ),
//                         ),
//                         children: [
//                           TextSpan(text: "Partagez et "),
//                           TextSpan(
//                             text: "gagnez +",
//                             style: TextStyle(color: Color(0xffffde77)),
//                           ),
//                         ],
//                       ),
//                     ),

//                     SizedBox(height: width ? 14 : 12),

//                     // Description
//                     RichText(
//                       text: TextSpan(
//                         style: TextStyle(
//                           color: Colors.grey,
//                           fontSize: width ? 14.5 : 12.5,
//                           height: width ? 1.6 : 1.4,
//                         ),
//                         children: [
//                           TextSpan(
//                             text: "Invitez d'autres personnes à rejoindre ",
//                           ),
//                           TextSpan(
//                             text: "Clickandplus ",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.w700,
//                             ),
//                           ),
//                           TextSpan(
//                             text:
//                                 "et gagnez sur leurs achats des points convertibles en cash ou en ",
//                           ),
//                           TextSpan(
//                             text: "réductions.",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.w700,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),

//                     SizedBox(height: width ? 18 : 16),

//                     // Boutons
//                     Row(
//                       children: [
//                         // Bouton Partager
//                         GestureDetector(
//                           onTap: () {},
//                           child: Container(
//                             padding: EdgeInsets.symmetric(
//                               horizontal: width ? 12.0 : 10.0,
//                               vertical: width ? 8.0 : 6.0,
//                             ),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(25),
//                               color: const Color(0xffffde77),
//                             ),
//                             child: Row(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 Icon(
//                                   Icons.link,
//                                   size: width ? 16 : 14,
//                                   color: Colors.black,
//                                 ),
//                                 SizedBox(width: width ? 8 : 6),
//                                 Text(
//                                   "Partager mon lien",
//                                   style: GoogleFonts.firaSans(
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.w700,
//                                     fontSize: width ? 14 : 12,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),

//                         SizedBox(width: width ? 6 : 4),

//                         // Bouton En savoir plus
//                         GestureDetector(
//                           onTap: () {},
//                           child: Container(
//                             padding: EdgeInsets.symmetric(
//                               horizontal: width ? 12.0 : 10.0,
//                               vertical: width ? 6.0 : 4.0,
//                             ),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(25),
//                               border: Border.all(
//                                 color: const Color(0xffffde77),
//                                 width: 2,
//                               ),
//                             ),
//                             child: Text(
//                               "En savoir plus",
//                               style: GoogleFonts.firaSans(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: width ? 14 : 12,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),

//               // Icônes flottantes avec animation
//               ...List.generate(reseauSociaux.length, (index) {
//                 final social = reseauSociaux[index];
//                 final isTikTok = index == 2;

//                 return AnimatedBuilder(
//                   animation: _animations[index],
//                   builder: (context, child) {
//                     return Positioned(
//                       right: social['right'] + _animations[index].value,
//                       top:
//                           social['top'] +
//                           (math.sin(_controllers[index].value * 2 * math.pi) *
//                               2), // Réduit de 5 à 3
//                       child: Transform.rotate(
//                         angle:
//                             math.sin(_controllers[index].value * 2 * math.pi) *
//                             0.05, // Réduit de 0.08 à 0.05
//                         child: Container(
//                           width: social['size'],
//                           height: social['size'],
//                           padding: EdgeInsets.all(isTikTok ? 14.0 : 9.0),
//                           child: SvgPicture.asset(
//                             social['icon'],
//                             fit: BoxFit.contain,
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               }),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

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

  List<Map<String, dynamic>> _getReseauSociaux(bool isWide) {
    if (isWide) {
      return [
        {"icon": "images/svg/f4.svg", "size": 36.0, "top": 8.0, "right": 8.0},
        {"icon": "images/svg/f2.svg", "size": 33.0, "top": 38.0, "right": 48.0},
        {"icon": "images/svg/f5.svg", "size": 70.0, "top": 52.0, "right": 0.0},
        {"icon": "images/svg/f3.svg", "size": 34.0, "top": 118.0, "right": 2.0},
        {
          "icon": "images/svg/f1.svg",
          "size": 32.0,
          "top": 118.0,
          "right": 43.0,
        },
      ];
    } else {
      // Version mobile optimisée
      return [
        {"icon": "images/svg/f4.svg", "size": 30.0, "top": 6.0, "right": 4.0},
        {"icon": "images/svg/f2.svg", "size": 28.0, "top": 32.0, "right": 38.0},
        {"icon": "images/svg/f5.svg", "size": 58.0, "top": 45.0, "right": 0.0},
        {"icon": "images/svg/f3.svg", "size": 28.0, "top": 105.0, "right": 0.0},
        {
          "icon": "images/svg/f1.svg",
          "size": 27.0,
          "top": 105.0,
          "right": 34.0,
        },
      ];
    }
  }

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      5,
      (index) => AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 3500 + (index * 500)),
      )..repeat(reverse: true),
    );

    _animations = _controllers.map((controller) {
      return Tween<double>(
        begin: -3.0,
        end: 3.0,
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
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth > 600;
        final isMobile = constraints.maxWidth < 400;
        final reseauSociaux = _getReseauSociaux(isWide);

        return Container(
          margin: EdgeInsets.symmetric(horizontal: isWide ? 12.0 : 10.0),
          padding: EdgeInsets.all(isWide ? 18.0 : 16.0),
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.black,
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // Contenu texte
              Positioned(
                left: 0,
                top: 0,
                right: isWide ? 110 : (isMobile ? 75 : 85),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Titre
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.firaSans(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: isWide ? 22.0 : (isMobile ? 18.0 : 20.0),
                            fontWeight: FontWeight.w700,
                            height: 1.1,
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

                    SizedBox(height: isWide ? 10 : 8),

                    // Description
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: isWide ? 13.0 : (isMobile ? 10.5 : 11.5),
                          height: 1.4,
                        ),
                        children: [
                          TextSpan(
                            text: "Invitez d'autres personnes à rejoindre ",
                          ),
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

                    SizedBox(height: isWide ? 14 : 12),

                    // Boutons
                    Wrap(
                      spacing: isWide ? 6 : 4,
                      runSpacing: 6,
                      children: [
                        // Bouton Partager
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: isWide
                                  ? 11.0
                                  : (isMobile ? 8.0 : 9.0),
                              vertical: isWide ? 7.0 : 6.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: const Color(0xffffde77),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.link,
                                  size: isWide ? 15 : (isMobile ? 12 : 13),
                                  color: Colors.black,
                                ),
                                SizedBox(width: isWide ? 7 : 5),
                                Text(
                                  "Partager mon lien",
                                  style: GoogleFonts.firaSans(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: isWide
                                        ? 13
                                        : (isMobile ? 10.5 : 11.5),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Bouton En savoir plus
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: isWide
                                  ? 11.0
                                  : (isMobile ? 8.0 : 9.0),
                              vertical: isWide ? 5.0 : 4.0,
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
                                fontSize: isWide
                                    ? 13
                                    : (isMobile ? 10.5 : 11.5),
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
                              1.5),
                      child: Transform.rotate(
                        angle:
                            math.sin(_controllers[index].value * 2 * math.pi) *
                            0.04,
                        child: Container(
                          width: social['size'],
                          height: social['size'],
                          padding: EdgeInsets.all(
                            isTikTok
                                ? (isWide ? 12.0 : 10.0)
                                : (isWide ? 8.0 : 7.0),
                          ),
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
      },
    );
  }
}
