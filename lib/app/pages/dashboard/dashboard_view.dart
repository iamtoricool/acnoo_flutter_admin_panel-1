import 'package:flutter/material.dart';

import 'package:responsive_grid/responsive_grid.dart';

import '../../widgets/widgets.dart';

import 'components/_top_grid_layout.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final _mqSize = MediaQuery.sizeOf(context);
    final _showTablet = _mqSize.width >= 992 && _mqSize.width <= 1240;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            // Overview Tiles
            const TopGridLayout(),

            //
            ResponsiveGridRow(
              children: [
                ResponsiveGridCol(
                  lg: 8,
                  md: _showTablet ? 8 : null,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    constraints: BoxConstraints.tight(
                      Size.fromHeight(
                        responsiveValue<double>(
                          context,
                          xs: 255,
                          md: 350,
                          lg: 430,
                        ),
                      ),
                    ),
                    child: const ShadowContainer(
                      headerText: 'Word Generation',
                      padding: EdgeInsets.fromLTRB(6, 12, 6, 6),
                      trailing: FilterDropdownButton(),
                      child: NumericAxisChart(),
                    ),
                  ),
                ),
                ResponsiveGridCol(
                  lg: 4,
                  md: _showTablet ? 4 : null,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    constraints: BoxConstraints.tight(
                      Size.fromHeight(
                        responsiveValue<double>(
                          context,
                          xs: 255,
                          md: 350,
                          lg: 430,
                        ),
                      ),
                    ),
                    child: const ShadowContainer(
                      headerText: 'Contents Overviews',
                      trailing: FilterDropdownButton(),
                      child: Align(child: ContentOverViewChart()),
                    ),
                  ),
                )
              ],
            ),

            // Fluctuation overview tile
            ResponsiveGridRow(
              rowSegments: 100,
              children: List.generate(
                _dashboardCalculationItem.length,
                (index) {
                  final _item = _dashboardCalculationItem[index];
                  return ResponsiveGridCol(
                    lg: 20,
                    md: 50,
                    xs: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: DashboardCalculationItem(
                        totalAmount: _item.amount,
                        title: _item.title,
                        timeDuration: _item.filterType,
                        userOrAmount: _item.fluctuation,
                        colors: _item.tileColor,
                      ),
                    ),
                  );
                },
              ),
            ),

            //
            ResponsiveGridRow(
              children: [
                ResponsiveGridCol(
                  lg: 8,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    constraints: BoxConstraints.tight(
                      Size.fromHeight(
                        responsiveValue<double>(
                          context,
                          xs: 255,
                          md: 350,
                          lg: 430,
                        ),
                      ),
                    ),
                    child: const ShadowContainer(
                      headerText: 'Word Generation',
                      padding: EdgeInsets.fromLTRB(6, 12, 6, 6),
                      trailing: FilterDropdownButton(),
                      child: NumericAxisChart(),
                    ),
                  ),
                ),
                ResponsiveGridCol(
                  lg: 4,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    constraints: BoxConstraints.tight(
                      Size.fromHeight(
                        responsiveValue<double>(
                          context,
                          xs: 255,
                          md: 350,
                          lg: 430,
                        ),
                      ),
                    ),
                    child: const ShadowContainer(
                      padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                      headerText: 'Subscribe Statistic',
                      trailing: FilterDropdownButton(),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: SubscriptionStaticsChart(),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

final _dashboardCalculationItem = <_DashboardCalculationItemModel>[
  ...[
    ("Total Users", '5000', "200", const Color(0xffB9FDEC)),
    ("Total Income", '\$50.5k', "\$15,000", const Color(0xffC5FDBF)),
    ("Total Subscription", '3000', "500", const Color(0xffC8E6FE)),
    ("Total Expense", '\$20.5k', "\$5000", const Color(0xffFFD6E2)),
    ("Total Profit", '\$30.5k', "\$20k", const Color(0xffDFDAFF)),
  ].map(
    (item) => _DashboardCalculationItemModel(
      title: item.$1,
      amount: item.$2,
      fluctuation: item.$3,
      tileColor: item.$4,
    ),
  )
];

class _DashboardCalculationItemModel {
  final String title;
  final String amount;
  final String fluctuation;
  final String filterType;
  final Color tileColor;

  const _DashboardCalculationItemModel({
    required this.title,
    required this.amount,
    required this.fluctuation,
    this.filterType = 'This Month',
    this.tileColor = Colors.greenAccent,
  });
}
