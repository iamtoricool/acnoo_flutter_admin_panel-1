import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart' as rf;

import '../../../../core/static/static.dart';
import '../../../../providers/providers.dart';
import '../../../../widgets/widgets.dart';
import '../language_dropdown/_language_dropdown.dart';

part '_notification_icon_button.dart';
part '_toggle_theme.dart';

class TopBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const TopBarWidget({super.key, this.onMenuTap});

  final void Function()? onMenuTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: rf.ResponsiveValue<Widget?>(
        context,
        conditionalValues: [
          rf.Condition.largerThan(
            name: BreakpointName.MD.name,
            value: null,
          ),
        ],
        defaultValue: IconButton(
          onPressed: onMenuTap,
          icon: const Tooltip(
            message: 'Open Navigation menu',
            waitDuration: Duration(milliseconds: 350),
            child: Icon(Icons.menu),
          ),
        ),
      ).value,
      toolbarHeight: rf.ResponsiveValue<double?>(
        context,
        conditionalValues: [
          rf.Condition.largerThan(name: BreakpointName.SM.name, value: 70)
        ],
      ).value,
      surfaceTintColor: Colors.transparent,
      actions: [
        // Language Dropdown
        const LanguageDropdownWidget(),
        const SizedBox(width: 8),

        // Toggle Theme Button
        Consumer<AppThemeProvider>(
          builder: (context, appTheme, child) => ThemeToggler(
            isDarkMode: appTheme.isDarkTheme,
            onChanged: appTheme.toggleTheme,
          ),
        ),

        // Notification Icon
        const NotificationIconButton(),

        // User Avatar
        const AvatarWidget(
          imagePath:
              'https://raw.githubusercontent.com/iamtoricool/static_images/main/avatars/placeholder_avatar/placeholder_avatar_01.png',
        ),
        const SizedBox(width: 16),
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 64);
}
