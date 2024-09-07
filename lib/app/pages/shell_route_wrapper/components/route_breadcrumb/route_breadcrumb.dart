import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:responsive_framework/responsive_framework.dart' as rf;

import '../../../../core/static/static.dart';
import '../../models/models.dart';

class RouteBreadcrumbWidget extends StatelessWidget {
  const RouteBreadcrumbWidget({
    super.key,
    required this.breadcrumbModel,
  });
  final RouteBreadcrumbModel breadcrumbModel;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    final _breadcrumbTextStyle = _theme.textTheme.bodyLarge?.copyWith(
      fontSize: rf.ResponsiveValue<double?>(
        context,
        conditionalValues: const [
          rf.Condition.between(
            start: 0,
            end: 340,
            value: 12,
          ),
          rf.Condition.between(
            start: 341,
            end: 480,
            value: 14,
          )
        ],
      ).value,
      letterSpacing: 0,
      fontWeight: FontWeight.w500,
    );

    return rf.ResponsiveRowColumn(
      layout: rf.ResponsiveRowColumnType.ROW,
      rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Title
        rf.ResponsiveRowColumnItem(
          child: Text(
            breadcrumbModel.title,
            style: _theme.textTheme.headlineSmall?.copyWith(
              fontSize: rf.ResponsiveValue<double?>(
                context,
                conditionalValues: const [
                  rf.Condition.between(
                    start: 0,
                    end: 340,
                    value: 14,
                  ),
                  rf.Condition.between(
                    start: 341,
                    end: 480,
                    value: 18,
                  )
                ],
              ).value,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        if (rf.ResponsiveBreakpoints.of(context).screenWidth >= 576)
          // Current Route
          rf.ResponsiveRowColumnItem(
            child: Row(
              children: [
                // Home Navigation
                Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: GestureDetector(
                    onTap: () => context.go('/dashboard'),
                    child: Icon(IconlyLight.home,
                        size: rf.ResponsiveValue<double?>(
                          context,
                          conditionalValues: [
                            rf.Condition.smallerThan(
                              name: BreakpointName.LG.name,
                              value: 16,
                            ),
                          ],
                          defaultValue: 20,
                        ).value),
                  ),
                ),
                Text.rich(
                  TextSpan(
                    text: '/ ${breadcrumbModel.parentRoute} / ',
                    children: [
                      TextSpan(
                        text: breadcrumbModel.childRoute,
                        style: _breadcrumbTextStyle?.copyWith(
                          color: _theme.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  style: _breadcrumbTextStyle,
                )
              ],
            ),
          ),
      ],
    );
  }
}
