import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../../core/helpers/fuctions/helper_functions.dart';
import '../../core/static/static.dart';

class SocialMediaOverviewCard extends StatelessWidget {
  const SocialMediaOverviewCard({
    super.key,
    required this.platformName,
    required this.platformLogoPath,
    this.followersCount = 0,
  });
  final String platformName;
  final String platformLogoPath;
  final num followersCount;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          constraints: BoxConstraints.tight(const Size.square(64)),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          child: getImageType(
            platformLogoPath,
            height: double.maxFinite,
            width: double.maxFinite,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          platformName,
          style: _theme.textTheme.bodyMedium?.copyWith(
            color: _theme.colorScheme.onTertiaryContainer,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          NumberFormat.compactCurrency(
            decimalDigits: 3,
            symbol: '',
            locale: AppLocale.defaultLocale.countryCode,
          ).format(followersCount),
          style: _theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
