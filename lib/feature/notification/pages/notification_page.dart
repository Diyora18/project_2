import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_2/core/utils/app_colors.dart';
import 'package:project_2/feature/common/reusable_app_bar.dart';
import 'package:project_2/feature/common/reusable_bottom_navigation.dart';
import 'package:project_2/feature/notification/widgets/notification_empty.dart';

import '../managers/notification_cubit.dart';
import '../managers/notification_state.dart';
import '../widgets/notification_item.dart';


class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationCubit(repository: context.read()),
      child: Scaffold(
        backgroundColor: AppColors.white,
        extendBody: true,
        appBar: ReusableAppBar(title: "Notifications"),
        body: BlocBuilder<NotificationCubit, NotificationState>(
          builder: (context, state) {
            if (state.loading!) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.errorMessage != null) {
              return Center(child: Text("Xato: ${state.errorMessage}"));
            }

            if (state.notifications == null || state.notifications!.isEmpty) {
              return EmptyNotification();
            }

            return ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: state.notifications!.length,
              itemBuilder: (context, index) {
                final item = state.notifications![index];

                return NotificationItem(
                  day: item.date != null ? item.timeAgo : null,
                  svgIcon: item.icon,
                  text: item.title,
                  description: item.content,
                );
              },
            );
          },
        ),
        bottomNavigationBar: ReusableBottomNavigation(isActive: 0),
      ),
    );
  }
}
