import 'package:flutter/material.dart';

import 'package:responsive_framework/responsive_framework.dart' as rf;

import '../../core/static/static.dart';
import '../../core/theme/theme.dart';

import 'components/_components.dart';
import 'models/models.dart';

class ShellRouteWrapper extends StatefulWidget {
  const ShellRouteWrapper({
    super.key,
    required this.child,
    required this.breadcrumbModel,
  });

  final Widget child;
  final RouteBreadcrumbModel breadcrumbModel;

  @override
  State<ShellRouteWrapper> createState() => _ShellRouteWrapperState();
}

class _ShellRouteWrapperState extends State<ShellRouteWrapper> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  bool isLargeSidebarExpaned = true;

  @override
  Widget build(BuildContext context) {
    final _isLaptop = rf.ResponsiveBreakpoints.of(context).largerThan(
      BreakpointName.MD.name,
    );
    final _theme = Theme.of(context);
    final _isDark = _theme.brightness == Brightness.dark;

    return Scaffold(
      key: scaffoldKey,
      backgroundColor:
          _isDark ? AcnooAppColors.kDark1 : AcnooAppColors.kPrimary50,
      drawer: rf.ResponsiveValue<Widget?>(
        context,
        conditionalValues: [
          rf.Condition.largerThan(
            name: BreakpointName.MD.name,
            value: null,
          ),
        ],
        defaultValue: buildSidebar(_isLaptop && isLargeSidebarExpaned),
      ).value,
      bottomNavigationBar: _isLaptop ? null : const FooterWidget(),
      body: rf.ResponsiveRowColumn(
        layout: rf.ResponsiveRowColumnType.ROW,
        rowCrossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Laptop & Desktop Sidebar

          if (_isLaptop)
            rf.ResponsiveRowColumnItem(
              columnFit: FlexFit.loose,
              child: buildSidebar(isLargeSidebarExpaned),
            ),

          // Main Content
          rf.ResponsiveRowColumnItem(
            rowFit: FlexFit.tight,
            child: rf.ResponsiveRowColumn(
              layout: rf.ResponsiveRowColumnType.COLUMN,
              children: [
                // Static Topbar
                rf.ResponsiveRowColumnItem(
                  child: buildTopbar(_isLaptop),
                ),

                // Route Breadcrumb Widget
                rf.ResponsiveRowColumnItem(
                  child: Padding(
                    padding: rf.ResponsiveValue<EdgeInsetsGeometry>(
                      context,
                      conditionalValues: [
                        rf.Condition.smallerThan(
                          name: BreakpointName.LG.name,
                          value: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                        )
                      ],
                      defaultValue: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                    ).value,
                    child: RouteBreadcrumbWidget(
                      breadcrumbModel: widget.breadcrumbModel,
                    ),
                  ),
                ),

                // Route Pages
                rf.ResponsiveRowColumnItem(
                  columnFit: FlexFit.tight,
                  child: widget.child,
                ),

                // Footer
                if (_isLaptop)
                  const rf.ResponsiveRowColumnItem(
                    child: FooterWidget(),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget buildTopbar(bool isLaptop) {
    if (isLaptop) scaffoldKey.currentState?.closeDrawer();
    return TopBarWidget(
      onMenuTap: () {
        if (isLaptop) {
          setState(() => isLargeSidebarExpaned = !isLargeSidebarExpaned);
        } else {
          return scaffoldKey.currentState?.openDrawer();
        }
      },
    );
  }

  Widget buildSidebar(bool iconOnly) {
    return SideBarWidget(
      rootScaffoldKey: scaffoldKey,
      iconOnly: iconOnly,
    );
  }
}
