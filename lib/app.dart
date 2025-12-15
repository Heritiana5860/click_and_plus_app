import 'package:app_1/composants/app_btn.dart';
import 'package:app_1/composants/app_texte.dart';
import 'package:app_1/composants/app_textfield.dart';
import 'package:app_1/pages/decouvrir_page.dart';
import 'package:app_1/pages/shop_page.dart';
import 'package:app_1/pages/home_page.dart';
import 'package:app_1/pages/offre_page.dart';
import 'package:app_1/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marquee/marquee.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  final screen = [
    HomePage(),
    DecouvrirPage(),
    ShopPage(),
    OffrePage(),
    ProfilePage(),
  ];

  final double paddingAppbar = 8.0;
  late MenuController _menuController;
  late AnimationController _iconController;
  bool _menuOpen = false;
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _menuController = MenuController();

    _iconController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );

    _searchController.addListener(_onSearchTextChanged);
  }

  @override
  void dispose() {
    _iconController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchTextChanged() {
    setState(() {});
  }

  // Fonction pour fermer le menu
  void _closeMenu() {
    if (_menuOpen) {
      _menuController.close();
      _iconController.reverse();
      setState(() => _menuOpen = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    double marqueeHeight = 40.0;
    final double customAppBarHeight =
        AppBar().preferredSize.height + marqueeHeight;

    // GestureDetector pour détecter les clics en dehors
    return GestureDetector(
      onTap: _closeMenu,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(customAppBarHeight),
          child: ListView(
            children: <Widget>[
              SafeArea(
                bottom: false,
                child: Container(
                  height: marqueeHeight,
                  color: Colors.black87,
                  child: Marquee(
                    text:
                        'Plus de 5 millions de deals disponibles dans plusieurs pays!',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                    velocity: 30.0,
                    blankSpace: 300.0,
                  ),
                ),
              ),
              _buildCustomAppBar(context),
            ],
          ),
        ),
        body: screen[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          backgroundColor: Colors.black,
          selectedItemColor: const Color(0xffffde77),
          unselectedItemColor: Colors.grey[900],
          elevation: 2,
          showUnselectedLabels: true,
          onTap: (value) {
            _closeMenu();
            setState(() {
              _currentIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "images/nav/home_icon.svg",
                height: 30,
                colorFilter: ColorFilter.mode(
                  _currentIndex == 0 ? const Color(0xffffde77) : Colors.black,
                  BlendMode.srcIn,
                ),
              ),
              label: "Accueil",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "images/nav/decouvrir_icon.svg",
                height: 30,
                colorFilter: ColorFilter.mode(
                  _currentIndex == 1 ? const Color(0xffffde77) : Colors.black,
                  BlendMode.srcIn,
                ),
              ),
              label: "Découvrir",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "images/nav/shop_icon.svg",
                height: 30,
                colorFilter: ColorFilter.mode(
                  _currentIndex == 2 ? const Color(0xffffde77) : Colors.black,
                  BlendMode.srcIn,
                ),
              ),
              label: "Shop",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "images/nav/offre_icon.svg",
                height: 30,
                colorFilter: ColorFilter.mode(
                  _currentIndex == 3 ? const Color(0xffffde77) : Colors.black,
                  BlendMode.srcIn,
                ),
              ),
              label: "Offres",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "images/nav/compte_icon.svg",
                height: 30,
                colorFilter: ColorFilter.mode(
                  _currentIndex == 4 ? const Color(0xffffde77) : Colors.black,
                  BlendMode.srcIn,
                ),
              ),
              label: "Mon compte",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomAppBar(BuildContext context) {
    return AppBar(
      elevation: 2,
      backgroundColor: Colors.white,
      leading: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: SvgPicture.asset(
          "images/appbar/new_logo.svg",
          height: 30,
          width: 30,
        ),
      ),
      title: _isSearching ? _buildSearchField() : const AppTexte(texte: ""),
      actions: [
        if (!_isSearching)
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              setState(() => _isSearching = true);
              _closeMenu(); 
            },
          )
        else
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              setState(() {
                _isSearching = false;
                _searchController.clear();
              });
            },
          ),
        MenuAnchor(
          controller: _menuController,
          onClose: () {
            _iconController.reverse();
            setState(() => _menuOpen = false);
          },
          builder: (context, controller, child) {
            return IconButton(
              onPressed: () {
                if (controller.isOpen) {
                  controller.close();
                } else {
                  controller.open();
                  _iconController.forward();
                  setState(() => _menuOpen = true);
                }
              },
              icon: AnimatedBuilder(
                animation: _iconController,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _iconController.value * 0.5 * 3.14,
                    child: _menuOpen
                        ? const Icon(Icons.close, size: 28)
                        : SvgPicture.asset(
                            "images/appbar/burger_appbar.svg",
                            height: 20,
                          ),
                  );
                },
              ),
            );
          },
          menuChildren: [
            _buildMenuItem("Toutes les categories", hasDropdown: true),
            _buildMenuItem("Nos offres", hasDropdown: true),
            _buildMenuItem("Shop"),
            _buildMenuItem("Services +"),
            _buildMenuItem("Club Membres"),
            _buildMenuItem("Le Mag'"),
            _buildMenuItem("Help Center"),
            _buildLanguageMenuItem(),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: AppButtons(
                label: "Nous contactez",
                borderRadius: 30,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                onPressed: () => _closeMenu(),
              ),
            ),
            const SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: AppButtons(
                label: "Mon compte",
                borderRadius: 30,
                fontWeight: FontWeight.bold,
                type: AppButtonType.outline,
                borderColor: Colors.grey,
                textColor: Colors.black,
                onPressed: () => _closeMenu(),
              ),
            ),
            const SizedBox(height: 10.0),
          ],
        ),
        const SizedBox(width: 10),
      ],
    );
  }

  Widget _buildMenuItem(String text, {bool hasDropdown = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: MenuItemButton(
        onPressed: () {
          debugPrint(text);
          _closeMenu();
        },
        child: Row(
          children: [
            AppTexte(texte: text, fontSize: 18.0, fontWeight: FontWeight.w500),
            if (hasDropdown) ...[
              const Spacer(),
              const Icon(Icons.arrow_drop_down_rounded, size: 36),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageMenuItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: MenuItemButton(
        onPressed: () {
          debugPrint("Français");
          _closeMenu();
        },
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey[300]!, width: 2.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Image.asset(
                  "images/png/flag.png",
                  height: 22,
                  width: 22,
                ),
              ),
            ),
            const SizedBox(width: 10.0),
            const AppTexte(
              texte: "Français",
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return AppTextField(
      controller: _searchController,
      borderRadius: 30,
      prefixIcon: const Icon(Icons.search),
      suffixIcon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_searchController.text.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                setState(() {
                  _searchController.clear();
                });
              },
            ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.tune,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
