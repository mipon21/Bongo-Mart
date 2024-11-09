import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class MySettingsMenuTile extends StatelessWidget {
  const MySettingsMenuTile(
      {super.key,
      required this.icon,
      required this.title,
      required this.subtitle,
      this.trailing,
      this.onTap});

  final IconData icon;
  final String title;
  final String subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return ListTile(
      leading: Icon(
        icon,
        size: 28,
        color: isDark ? TColors.secondary : TColors.primary,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.labelMedium,
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
