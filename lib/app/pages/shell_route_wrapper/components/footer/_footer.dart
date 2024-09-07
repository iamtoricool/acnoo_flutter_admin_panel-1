import 'package:flutter/material.dart';

import 'package:responsive_framework/responsive_framework.dart' as rf;

import '../../../../core/app_config/app_config.dart';
import '../../../../core/static/static.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _textStyle = _theme.textTheme.bodyMedium?.copyWith(
      fontSize: rf.ResponsiveValue<double?>(
        context,
        conditionalValues: const [
          rf.Condition.between(start: 0, end: 290, value: 11),
          rf.Condition.between(start: 291, end: 340, value: 12),
        ],
      ).value,
    );

    return LayoutBuilder(
      builder: (context, constraints) => Container(
        padding: rf.ResponsiveValue<EdgeInsetsGeometry?>(
          context,
          conditionalValues: [
            rf.Condition.smallerThan(
              name: BreakpointName.LG.name,
              value: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            ),
          ],
          defaultValue: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 18,
          ),
        ).value,
        color: _theme.colorScheme.primaryContainer,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                'COPYRIGHT © 2024 ${AppConfig.organizationName}${constraints.maxWidth <= BreakpointName.SM.start ? '' : ', All rights Reserved'}',
                style: _textStyle,
              ),
            ),
            Text.rich(
              TextSpan(
                text: 'Made by ',
                children: [
                  TextSpan(
                    text: AppConfig.organizationName,
                    style: _textStyle?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: _theme.primaryColor,
                    ),
                  ),
                ],
              ),
              style: _textStyle,
            )
          ],
        ),
      ),
    );
  }
}
