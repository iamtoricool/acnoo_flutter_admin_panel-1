import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:responsive_grid/responsive_grid.dart';

import 'components/_components.dart';
import 'services/_services.dart';

export 'pages/pages.dart';
export 'services/_services.dart';

class EmailView extends StatelessWidget {
  const EmailView({
    super.key,
    required this.page,
  });

  final StatefulNavigationShell page;
  @override
  Widget build(BuildContext context) {
    final _mqSize = MediaQuery.sizeOf(context);
    final _isDesktop = _mqSize.width >= 1240;
    // final _isTablet = _mqSize.width >= 1080 && !_isDesktop;

    final _padding = responsiveValue<double>(context, xs: 16, lg: 24);
    EmailPageListener.page = page;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(_padding / 2.5),
        child: Row(
          children: [
            if (_isDesktop)
              Padding(
                padding: EdgeInsets.all(_padding / 2.5),
                child: EmailSidebarWidget(page: page),
              ),
            Expanded(
              flex: 30,
              child: Container(
                width: double.maxFinite,
                margin: EdgeInsets.all(_padding / 2.5),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: page,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
