import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../core/theme/_app_colors.dart';

class DashboardCalculationItem extends StatelessWidget {
  const DashboardCalculationItem(
      {super.key,
      required this.totalAmount,
      required this.title,
      required this.timeDuration,
      required this.userOrAmount,
      this.icon,
      required this.colors});
  final String totalAmount;
  final String title;
  final String timeDuration;
  final String userOrAmount;
  final Icon? icon;
  final Color colors;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: colors,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              totalAmount,
              style: textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AcnooAppColors.kNeutral900),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              title,
              style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AcnooAppColors.kNeutral700),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(children: [
                    WidgetSpan(
                      child: icon ??
                          Icon(
                            MdiIcons.arrowUp,
                            color: AcnooAppColors.kSuccess,
                            size: 14,
                          ),
                    ),
                    const WidgetSpan(
                        child: SizedBox(
                      width: 3,
                    )),
                    TextSpan(
                      text: userOrAmount,
                      style: textTheme.titleMedium?.copyWith(
                          color: AcnooAppColors.kSuccess,
                          fontWeight: FontWeight.w600),
                    ),
                    const WidgetSpan(
                        child: SizedBox(
                      width: 4,
                    )),
                    TextSpan(
                        text: timeDuration,
                        style: textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AcnooAppColors.kNeutral700))
                  ]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
