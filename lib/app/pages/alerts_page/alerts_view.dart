import 'package:flutter/material.dart';

import 'package:responsive_framework/responsive_framework.dart' as rf;
import 'package:responsive_grid/responsive_grid.dart';

import '../../core/theme/theme.dart';
import '../../widgets/widgets.dart';

class AlertsView extends StatelessWidget {
  const AlertsView({super.key});

  @override
  Widget build(BuildContext context) {
    // final _theme = Theme.of(context);
    final _sizeInfo = rf.ResponsiveValue<_SizeInfo>(
      context,
      conditionalValues: [
        const rf.Condition.between(
          start: 0,
          end: 480,
          value: _SizeInfo(
            alertFontSize: 12,
            padding: EdgeInsets.all(16),
            innerSpacing: 16,
          ),
        ),
        const rf.Condition.between(
          start: 481,
          end: 576,
          value: _SizeInfo(
            alertFontSize: 14,
            padding: EdgeInsets.all(16),
            innerSpacing: 16,
          ),
        ),
        const rf.Condition.between(
          start: 577,
          end: 992,
          value: _SizeInfo(
            alertFontSize: 14,
            padding: EdgeInsets.all(16),
            innerSpacing: 16,
          ),
        ),
      ],
      defaultValue: const _SizeInfo(),
    ).value;
    return SingleChildScrollView(
      padding: _sizeInfo.padding / 2.5,
      child: ResponsiveGridRow(
        children: [
          // Solid Alerts
          ResponsiveGridCol(
            child: Padding(
              padding: _sizeInfo.padding / 2.5,
              child: ShadowContainer(
                headerText: 'Solid Alerts',
                child: ResponsiveGridRow(
                  children: {
                    "This is a Primary alert": AcnooAppColors.kPrimary600,
                    "This is a Secondary alert":
                        AcnooAppColors.kSecondaryBtnColor,
                    "This is a Success alert": AcnooAppColors.kSuccess,
                    "This is a Warning alert": AcnooAppColors.kWarning,
                    "This is a Info alert": AcnooAppColors.kInfo,
                    "This is a Danger alert": AcnooAppColors.kError,
                  }
                      .entries
                      .map(
                        (tile) => ResponsiveGridCol(
                          lg: 6,
                          md: 6,
                          child: Padding(
                            padding: EdgeInsets.all(_sizeInfo.innerSpacing / 3),
                            child: AcnooAlertTile.solid(
                              key: ValueKey(tile.hashCode),
                              tile.key,
                              backgroundColor: tile.value,
                              onClose: () {},
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ),

          // Left Border Alerts
          ResponsiveGridCol(
            lg: 6,
            md: 6,
            child: Padding(
              padding: _sizeInfo.padding / 2,
              child: ShadowContainer(
                headerText: 'Left Border Alerts',
                child: ResponsiveGridRow(
                  children: {
                    "☺ This is a Primary alert": AcnooAppColors.kPrimary600,
                    "𐄹 This is a Secondary alert":
                        AcnooAppColors.kSecondaryBtnColor,
                    "🗹 This is a Success alert": AcnooAppColors.kSuccess,
                    "⚠ This is a Warning alert": AcnooAppColors.kWarning,
                    "🛈 This is a Info alert": AcnooAppColors.kInfo,
                    "⦰ This is a Danger alert": AcnooAppColors.kError,
                  }
                      .entries
                      .map(
                        (tile) => ResponsiveGridCol(
                          lg: 12,
                          md: 12,
                          child: Padding(
                            padding: EdgeInsets.all(_sizeInfo.innerSpacing / 3),
                            child: AcnooAlertTile.border(
                              key: ValueKey(tile.hashCode),
                              tile.key,
                              backgroundColor: tile.value,
                              onClose: () {},
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ),

          // Outline Alerts
          ResponsiveGridCol(
            lg: 6,
            md: 6,
            child: Padding(
              padding: _sizeInfo.padding / 2,
              child: ShadowContainer(
                headerText: 'Outline Alerts',
                child: ResponsiveGridRow(
                  children: {
                    "This is a Primary alert": AcnooAppColors.kPrimary600,
                    "This is a Secondary alert":
                        AcnooAppColors.kSecondaryBtnColor,
                    "This is a Success alert": AcnooAppColors.kSuccess,
                    "This is a Warning alert": AcnooAppColors.kWarning,
                    "This is a Info alert": AcnooAppColors.kInfo,
                    "This is a Danger alert": AcnooAppColors.kError,
                  }
                      .entries
                      .map(
                        (tile) => ResponsiveGridCol(
                          lg: 12,
                          md: 12,
                          child: Padding(
                            padding: EdgeInsets.all(_sizeInfo.innerSpacing / 3),
                            child: AcnooAlertTile.outline(
                              key: ValueKey(tile.hashCode),
                              tile.key,
                              backgroundColor: tile.value,
                              onClose: () {},
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SizeInfo {
  final double? alertFontSize;
  final EdgeInsetsGeometry padding;
  final double innerSpacing;
  const _SizeInfo({
    this.alertFontSize = 18,
    this.padding = const EdgeInsets.all(24),
    this.innerSpacing = 24,
  });
}
