import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:get_it/get_it.dart';
import 'package:budget/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:budget/core/constants/app_assets.dart';
import 'package:budget/core/constants/app_colors.dart';
import 'package:budget/core/router/app_router.dart';
import '../widgets/diagonal_painter.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController _bgController;
  late AnimationController _logoController;
  late Animation<double> _bgAnimation;
  late Animation<double> _logoAnimation;

  @override
  void initState() {
    super.initState();

    _bgController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );

    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _bgAnimation = CurvedAnimation(
      parent: _bgController,
      curve: Curves.easeInOutCubic,
    );

    _logoAnimation = CurvedAnimation(
      parent: _logoController,
      curve: Curves.easeInCirc,
    );

    // Start background animation
    _bgController.forward();

    // Start logo animation after background is significantly revealed
    Future.delayed(const Duration(milliseconds: 1400), () {
      if (mounted) _logoController.forward();
    });

    // Navigate based on auth status after animation finishes
    _bgController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        final authRepo = GetIt.I<AuthRepository>();
        final token = await authRepo.getToken();
        final isVisited = await authRepo.isOnboardingVisited();

        if (mounted) {
          if (token != null && token.isNotEmpty) {
            context.go(AppRouter.home);
          } else if (isVisited) {
            context.go(AppRouter.login);
          } else {
            context.go(AppRouter.onboarding);
          }
        }
      }
    });
  }

  @override
  void dispose() {
    _bgController.dispose();
    _logoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white, // Base background
      body: Stack(
        children: [
          // Logo Layer (Middle)
          Center(
            child: FadeTransition(
              opacity: _logoAnimation,
              child: ScaleTransition(
                scale: Tween<double>(begin: 0.8, end: 1.0).animate(_logoAnimation),
                child: SvgPicture.asset(
                  Localizations.localeOf(context).languageCode == 'ar'
                      ? AppAssets.logoAr
                      : AppAssets.logo,
                  width: MediaQuery.of(context).size.width * 0.6,
                ),
              ),
            ),
          ),

          // Animation Layer (Top)
          // This will reveal the logo and then cover it (closing ON the logo)
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _bgAnimation,
              builder: (context, child) {
                return CustomPaint(
                  painter: DiagonalPainter(
                    animationValue: _bgAnimation.value,
                    orangeColor: AppColors.orange,
                    whiteColor: Colors.transparent, // Transparent so we see the logo below
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
