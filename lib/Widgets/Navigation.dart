import 'package:infinityCRM/index.dart';
import 'package:flutter/cupertino.dart';

// fancy_bottom_navbar.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FancyBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(String) onRouteTap;
  final Color selectedColor;
  final Color unselectedColor;
  final Map<String, int>? badges;

  const FancyBottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onRouteTap,
    this.selectedColor = const Color(0xFFFF5A5F),
    this.unselectedColor = const Color(0xFFAAAAAA),
    this.badges,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          height: 65,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavBarItem(
                icon: Icons.search,
                label: 'Explore',
                isSelected: selectedIndex == 0,
                onTap: () => onRouteTap('/explore'),
                selectedColor: selectedColor,
                unselectedColor: unselectedColor,
              ),
              _NavBarItem(
                icon: Icons.shopping_cart_outlined,
                label: 'Cart',
                isSelected: selectedIndex == 1,
                onTap: () => onRouteTap('/cart'),
                selectedColor: selectedColor,
                unselectedColor: unselectedColor,
                badge: badges?['cart'],
              ),
              _NavBarItem(
                icon: Icons.chat_bubble_outline,
                label: 'Messages',
                isSelected: selectedIndex == 2,
                onTap: () => onRouteTap('/messages'),
                selectedColor: selectedColor,
                unselectedColor: unselectedColor,
                badge: badges?['messages'],
              ),
              _NavBarItem(
                icon: Icons.person_outline,
                label: 'Profile',
                isSelected: selectedIndex == 3,
                onTap: () => onRouteTap('/profile'),
                selectedColor: selectedColor,
                unselectedColor: unselectedColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final Color selectedColor;
  final Color unselectedColor;
  final int? badge;

  const _NavBarItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
    required this.selectedColor,
    required this.unselectedColor,
    this.badge,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? selectedColor.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  color: isSelected ? selectedColor : unselectedColor,
                  size: 24,
                ),
                SizedBox(height: 4),
                Text(
                  label,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                    color: isSelected ? selectedColor : unselectedColor,
                  ),
                ),
              ],
            ),
            if (badge != null && badge! > 0)
              Positioned(
                top: -5,
                right: -5,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: selectedColor,
                    shape: BoxShape.circle,
                  ),
                  constraints: BoxConstraints(
                    minWidth: 18,
                    minHeight: 18,
                  ),
                  child: Center(
                    child: Text(
                      badge! > 99 ? '99+' : badge.toString(),
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  final int currentIndex;

  const BottomNavBar({Key? key, required this.currentIndex}) : super(key: key);

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, DashboardScreen.routeName);
        break;
      case 1:
        Navigator.pushReplacementNamed(context, Chat.routeName);
        break;
      case 2:
        Navigator.pushReplacementNamed(context, WorkScreen.routeName);
        break;
      case 3:
        Navigator.pushReplacementNamed(context, LeadsScreen.routeName);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            spreadRadius: 1,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          currentIndex: currentIndex,
          onTap: (index) => _onItemTapped(context, index),
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black54,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: TextStyle(
            fontFamily: 'SFProDisplay',
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
          unselectedLabelStyle: TextStyle(
            fontFamily: 'SFProDisplay',
            fontSize: 12,
          ),
          selectedFontSize: 14,
          unselectedFontSize: 12,
          elevation: 4,
          items: [
            _buildNavItem(SimpleLineIcons.compass, "Explore", 0),
            _buildNavItem(SimpleLineIcons.bubbles, "Chat", 1),
            _buildNavItem(Icons.task_alt_outlined, "My Work", 2),
            _buildNavItem(Icons.trending_up_rounded, "Pipeline", 3),

          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(IconData icon, String label, int index) {
    return BottomNavigationBarItem(
      icon:  Padding(
    padding: const EdgeInsets.only(bottom: 4.0),
    child: Icon(
        icon,
        color: currentIndex == index ? Colors.blue : Colors.black54,
        size: 24,
      ),
        ),

      label: label,
    );
  }
}
