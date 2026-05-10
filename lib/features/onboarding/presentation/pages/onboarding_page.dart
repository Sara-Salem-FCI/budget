import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:budget/l10n/app_localizations.dart';
import 'package:budget/core/constants/app_assets.dart';
import 'package:budget/core/router/app_router.dart';
import 'package:get_it/get_it.dart';
import 'package:budget/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:budget/features/onboarding/data/models/onboarding_model.dart';
import 'package:budget/features/onboarding/presentation/widgets/language_selector.dart';
import 'package:budget/features/onboarding/presentation/widgets/onboarding_content.dart';
import 'package:budget/features/onboarding/presentation/widgets/onboarding_indicator.dart';
import 'package:budget/features/onboarding/presentation/widgets/onboarding_bottom_bar.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  List<OnboardingModel> _getPages(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return [
      OnboardingModel(
        title: l10n.onboarding_title_1,
        description: l10n.onboarding_desc_1,
        image: AppAssets.onboarding1,
      ),
      OnboardingModel(
        title: l10n.onboarding_title_2,
        description: l10n.onboarding_desc_2,
        image: AppAssets.onboarding2,
      ),
      OnboardingModel(
        title: l10n.onboarding_title_3,
        description: l10n.onboarding_desc_3,
        image: AppAssets.onboarding3,
      ),
    ];
  }

  void _onNext() async {
    final pages = _getPages(context);
    if (_currentIndex < pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      await GetIt.I<AuthRepository>().setOnboardingVisited();
      if (mounted) context.go(AppRouter.login);
    }
  }

  void _onSkip() async {
    await GetIt.I<AuthRepository>().setOnboardingVisited();
    if (mounted) context.go(AppRouter.login);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pages = _getPages(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Top Bar
            const Positioned(
              top: 10,
              right: 20,
              child: LanguageSelector(),
            ),

            // Main Content
            Column(
              children: [
                const SizedBox(height: 60),
                // PageView
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: pages.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return OnboardingContent(model: pages[index]);
                    },
                  ),
                ),

                // Indicator
                OnboardingIndicator(
                  count: pages.length,
                  currentIndex: _currentIndex,
                ),

                const SizedBox(height: 20),

                // Bottom Bar
                OnboardingBottomBar(
                  isLastPage: _currentIndex == pages.length - 1,
                  onSkip: _onSkip,
                  onNext: _onNext,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
