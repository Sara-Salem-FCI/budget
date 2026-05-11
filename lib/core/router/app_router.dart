import 'package:go_router/go_router.dart';
import 'package:budget/features/splash/presentation/pages/splash_page.dart';
import 'package:budget/features/home/presentation/pages/home_page.dart';
import 'package:budget/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:budget/features/auth/presentation/pages/login_page.dart';
import 'package:budget/features/auth/presentation/pages/register_page.dart';
import 'package:budget/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:budget/features/auth/presentation/pages/verification_page.dart';
import 'package:budget/features/auth/presentation/pages/register_verification_page.dart';
import 'package:budget/features/auth/presentation/pages/new_password_page.dart';

import 'package:budget/features/home/presentation/pages/main_layout_page.dart';
import 'package:budget/features/search/presentation/pages/search_page.dart';
import 'package:budget/features/favorites/presentation/pages/favorites_page.dart';
import 'package:budget/features/profile/presentation/pages/profile_page.dart';
import 'package:budget/features/home/presentation/pages/available_cars_page.dart';
import 'package:budget/features/notifications/presentation/pages/notifications_page.dart';

import 'package:budget/features/profile/presentation/pages/terms_and_conditions_page.dart';

import 'package:budget/features/profile/presentation/pages/privacy_policy_page.dart';
import 'package:budget/features/home/presentation/pages/car_details_page.dart';
import 'package:budget/features/home/data/models/car_model.dart';

/// Centralized router configuration for the application.
abstract class AppRouter {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';
  static const String verification = '/verification';
  static const String registerVerification = '/register-verification';
  static const String newPassword = '/new-password';
  static const String home = '/home';
  static const String search = '/search';
  static const String favorites = '/favorites';
  static const String profile = '/profile';
  static const String availableCars = '/available-cars';
  static const String notifications = '/notifications';
  static const String termsAndConditions = '/terms-conditions';
  static const String privacyPolicy = '/privacy-policy';
  static const String carDetails = '/car-details';

  static final router = GoRouter(
    initialLocation: splash,
    routes: [
      GoRoute(
        path: privacyPolicy,
        builder: (context, state) => const PrivacyPolicyPage(),
      ),
      GoRoute(
        path: carDetails,
        builder: (context, state) => CarDetailsPage(car: state.extra as CarModel),
      ),
      GoRoute(
        path: termsAndConditions,
        builder: (context, state) => const TermsAndConditionsPage(),
      ),
      GoRoute(
        path: notifications,
        builder: (context, state) => const NotificationsPage(),
      ),
      GoRoute(
        path: availableCars,
        builder: (context, state) => const AvailableCarsPage(),
      ),
      GoRoute(
        path: splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: onboarding,
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        path: login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: register,
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: forgotPassword,
        builder: (context, state) => const ForgotPasswordPage(),
      ),
      GoRoute(
        path: verification,
        builder: (context, state) => const VerificationPage(),
      ),
      GoRoute(
        path: registerVerification,
        builder: (context, state) => const RegisterVerificationPage(),
      ),
      GoRoute(
        path: newPassword,
        builder: (context, state) => const NewPasswordPage(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainLayoutPage(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: home,
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: search,
                builder: (context, state) => const SearchPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: favorites,
                builder: (context, state) => const FavoritesPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: profile,
                builder: (context, state) => const ProfilePage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
