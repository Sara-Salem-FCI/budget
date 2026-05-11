import 'package:budget/core/constants/app_colors.dart';
import 'package:budget/core/constants/app_styles.dart';
import 'package:budget/features/notifications/presentation/cubit/notifications_cubit.dart';
import 'package:budget/features/notifications/presentation/cubit/notifications_state.dart';
import 'package:budget/features/notifications/presentation/widgets/notification_item_widget.dart';
import 'package:budget/features/notifications/presentation/widgets/notifications_empty_state.dart';
import 'package:budget/features/auth/presentation/widgets/need_login_widget.dart';
import 'package:budget/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return BlocProvider(
      create: (context) => GetIt.instance<NotificationsCubit>()..getNotifications(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.background,
          elevation: 0,
          title: Text(
            l10n.notifications,
            style: AppStyles.heading2.copyWith(fontWeight: FontWeight.w900),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: BlocBuilder<NotificationsCubit, NotificationsState>(
          builder: (context, state) {
            if (state is NotificationsLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is NotificationsError) {
              if (state.message.contains('Unauthenticated')) {
                return const NeedLoginWidget();
              }
              return Center(
                child: Text(
                  state.message,
                  style: AppStyles.body1,
                ),
              );
            }

            if (state is NotificationsLoaded) {
              if (state.groupedNotifications.isEmpty) {
                return const NotificationsEmptyState();
              }

              return RefreshIndicator(
                onRefresh: () => context.read<NotificationsCubit>().getNotifications(),
                child: ListView.builder(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  itemCount: state.groupedNotifications.length,
                  itemBuilder: (context, index) {
                    final day = state.groupedNotifications.keys.elementAt(index);
                    final notifications = state.groupedNotifications[day]!;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 24, 0, 16),
                          child: Text(
                            day,
                            style: AppStyles.heading3.copyWith(
                              fontWeight: FontWeight.w900,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        ...notifications.map((notif) => NotificationItemWidget(
                          notification: notif,
                          onTap: () {
                            if (!notif.isRead) {
                              context.read<NotificationsCubit>().markAsRead(notif.id);
                            }
                          },
                        )),
                      ],
                    );
                  },
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
