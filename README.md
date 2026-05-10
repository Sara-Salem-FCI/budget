# 🏎️ Budget - Premium Car Discovery & Marketplace

Budget is a state-of-the-art Flutter application designed for a premium car discovery and marketplace experience. Built with a focus on **Visual Excellence**, **Performance**, and **Clean Architecture**, it offers users a seamless journey from onboarding to finding their dream car.

---

## ✨ Key Features

- **🚀 Interactive Onboarding**: Beautifully animated onboarding screens with language selection (Arabic & English).
- **🔒 Secure Authentication**: Robust login and registration flows with OTP verification, social login support, and "Remember Me" functionality.
- **🏠 Dynamic Home Screen**:
  - Personalized headers with user profiles.
  - Interactive car offers with premium horizontal scrolling lists.
  - "Recently Viewed" and "Available Cars" sections for quick access.
- **🌍 Full Localization**: Native support for Arabic (RTL) and English (LTR) using Flutter's official localization system.
- **🌗 Theme Support**: Centralized theme system supporting harmonious color palettes and custom design tokens.
- **🎨 Premium UI/UX**:
  - Glassmorphism effects and multi-layered shadows.
  - Smooth micro-animations and transitions.
  - Responsive layouts optimized for all device sizes.

## 🛠️ Tech Stack

- **Framework**: [Flutter](https://flutter.dev/)
- **State Management**: [BLoC (Business Logic Component)](https://pub.dev/packages/flutter_bloc)
- **Navigation**: [GoRouter](https://pub.dev/packages/go_router)
- **Dependency Injection**: [GetIt](https://pub.dev/packages/get_it)
- **Networking**: [Dio](https://pub.dev/packages/dio) with interceptors and structured logging.
- **UI Scaling**: [Flutter ScreenUtil](https://pub.dev/packages/flutter_screenutil)
- **Storage**: [Flutter Secure Storage](https://pub.dev/packages/flutter_secure_storage)
- **Models**: [JSON Serializable](https://pub.dev/packages/json_serializable) & [Equatable](https://pub.dev/packages/equatable)

## 🏗️ Architecture

The project follows a **Feature-based Clean Architecture** approach, ensuring separation of concerns and high maintainability:

- **Core**: Shared utilities, constants, theme, and network configurations.
- **Features**: Modularized by domain (Auth, Home, Splash, Onboarding).
  - **Data**: Models, repository implementations, and data sources.
  - **Presentation**: BLoCs/Cubits, pages, and modular, reusable widgets.

## 📂 Project Structure

```bash
lib/
├── core/                # Shared utilities & configurations
│   ├── api/             # Network clients & interceptors
│   ├── constants/       # App-wide constants (colors, assets, etc.)
│   ├── di/              # Dependency injection setup
│   ├── error/           # Failure & exception handling
│   ├── router/          # Navigation logic
│   └── theme/           # Design system & tokens
├── features/            # Feature-based modules
│   ├── auth/            # Authentication & Profile
│   ├── home/            # Discovery & Car Lists
│   ├── onboarding/      # First-run experience
│   └── splash/          # Branding & initialization
├── l10n/                # Localization resource files
└── main.dart            # Entry point
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (Latest Stable)
- Android Studio / VS Code
- Git

### Installation Steps

1. **Clone the repository**:
   ```bash
   git clone <repository-url>
   ```
2. **Install dependencies**:
   ```bash
   flutter pub get
   ```
3. **Run code generation**:
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```
4. **Launch the app**:
   ```bash
   flutter run
   ```

---

<p align="center">Made with ❤️ for a Premium Automotive Experience</p>
