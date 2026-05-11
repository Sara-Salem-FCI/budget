import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:budget/core/constants/app_colors.dart';
import 'package:budget/core/constants/app_styles.dart';
import 'package:budget/l10n/app_localizations.dart';

class MainBottomNavBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainBottomNavBar({super.key, required this.navigationShell});

  void _onTap(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _BottomNavItem(
            index: 0,
            currentIndex: navigationShell.currentIndex,
            icon: Icons.home_outlined,
            activeIcon: Icons.home,
            label: l10n.nav_home,
            onTap: _onTap,
          ),
          _BottomNavItem(
            index: 1,
            currentIndex: navigationShell.currentIndex,
            icon: Icons.search,
            label: l10n.nav_search,
            onTap: _onTap,
          ),
          _BottomNavItem(
            index: 2,
            currentIndex: navigationShell.currentIndex,
            icon: Icons.favorite_border,
            label: l10n.nav_favorites,
            onTap: _onTap,
          ),
          _BottomNavItem(
            index: 3,
            currentIndex: navigationShell.currentIndex,
            icon: Icons.person_outline,
            label: l10n.nav_profile,
            onTap: _onTap,
          ),
        ],
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  final int index;
  final int currentIndex;
  final IconData icon;
  final IconData? activeIcon;
  final String label;
  final ValueChanged<int> onTap;

  const _BottomNavItem({
    required this.index,
    required this.currentIndex,
    required this.icon,
    this.activeIcon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isActive = currentIndex == index;
    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(
          horizontal: isActive ? 16 : 8,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: isActive ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(
              isActive ? (activeIcon ?? icon) : icon,
              color: isActive ? Colors.white : Colors.grey,
              size: 24,
            ),
            if (isActive) ...[
              const SizedBox(width: 8),
              Text(
                label,
                style: AppStyles.caption.copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
