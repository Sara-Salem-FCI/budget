import 'package:budget/core/constants/app_colors.dart';
import 'package:budget/core/constants/app_styles.dart';
import 'package:budget/core/di/service_locator.dart';
import 'package:budget/core/router/app_router.dart';
import 'package:budget/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:budget/features/profile/presentation/cubit/profile_state.dart';
import 'package:budget/features/profile/presentation/widgets/profile_menu_tile.dart';
import 'package:budget/l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:budget/core/widgets/confirmation_dialog.dart';
import 'package:budget/core/widgets/language_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (context) => getIt<ProfileCubit>()..loadProfile(),
      child: Builder(
        builder: (context) {
          return VisibilityDetector(
            key: const Key('profile_page'),
            onVisibilityChanged: (info) {
              if (info.visibleFraction == 1.0) {
                context.read<ProfileCubit>().loadProfile();
              }
            },
            child: BlocConsumer<ProfileCubit, ProfileState>(
              listener: (context, state) {
                if (state is LogoutSuccess) {
                  context.go(AppRouter.login);
                }
              },
              builder: (context, state) {
                final user = state is ProfileLoaded ? state.user : null;

                return Scaffold(
                  backgroundColor: const Color(0xFFF8F8F8),
                  appBar: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    centerTitle: true,
                    title: Text(
                      l10n.my_page,
                      style: AppStyles.heading2,
                    ),
                  ),
                  body: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        // Profile Image
                        Center(
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.1),
                                  blurRadius: 20,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                            ),
                            child: CircleAvatar(
                              radius: 60,
                              backgroundColor: Colors.grey.shade200,
                              backgroundImage: user?.profileImage != null
                                  ? NetworkImage(user!.profileImage!)
                                  : null,
                              child: user?.profileImage == null
                                  ? const Icon(Icons.person, size: 60, color: Colors.grey)
                                  : null,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Name and Phone
                        Text(
                          user?.name ?? '',
                          style: AppStyles.heading3,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          user?.phone ?? '',
                          style: AppStyles.bodySmall,
                        ),
                        const SizedBox(height: 32),

                        // Menu Items
                        ProfileMenuTile(
                          title: l10n.edit_profile,
                          onTap: () {},
                        ),
                        ProfileMenuTile(
                          title: l10n.notifications,
                          showArrow: false,
                          trailing: CupertinoSwitch(
                            value: user?.isNotify ?? true,
                            activeTrackColor: AppColors.primary,
                            onChanged: (val) {},
                          ),
                        ),
                        ProfileMenuTile(
                          title: l10n.language,
                          onTap: () => _showLanguageDialog(context),
                        ),
                        ProfileMenuTile(
                          title: l10n.terms_conditions,
                          onTap: () {},
                        ),
                        ProfileMenuTile(
                          title: l10n.privacy_policy,
                          onTap: () {},
                        ),
                        ProfileMenuTile(
                          title: l10n.rate_us,
                          onTap: () {},
                        ),
                        ProfileMenuTile(
                          title: l10n.help,
                          onTap: () {},
                        ),
                        const SizedBox(height: 8),
                        ProfileMenuTile(
                          title: l10n.logout,
                          showArrow: false,
                          onTap: () => _showLogoutDialog(context),
                        ),
                        ProfileMenuTile(
                          title: l10n.delete_account,
                          showArrow: false,
                          textColor: Colors.red,
                          onTap: () => _showDeleteAccountDialog(context),
                        ),
                        const SizedBox(height: 90),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    showDialog(
      context: context,
      builder: (dialogContext) => ConfirmationDialog(
        title: l10n.logout,
        message: l10n.logout_confirmation,
        yesText: l10n.yes,
        noText: l10n.no,
        onYes: () {
          Navigator.pop(dialogContext);
          context.read<ProfileCubit>().logout();
        },
      ),
    );
  }

  void _showDeleteAccountDialog(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    showDialog(
      context: context,
      builder: (dialogContext) => ConfirmationDialog(
        title: l10n.delete_account,
        message: l10n.logout_confirmation, 
        yesText: l10n.yes,
        noText: l10n.no,
        onYes: () {
          Navigator.pop(dialogContext);
        },
      ),
    );
  }

  void _showLanguageDialog(BuildContext context) {
    final currentLocale = Localizations.localeOf(context).languageCode;
    
    showDialog(
      context: context,
      builder: (dialogContext) => LanguageDialog(
        currentLocale: currentLocale,
        onLanguageSelected: (localeCode) {
        },
      ),
    );
  }
}
