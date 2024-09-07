import 'package:flutter/material.dart';

import 'package:responsive_grid/responsive_grid.dart';

import '../../../widgets/widgets.dart';

import 'components/_components.dart';

class AiCodeView extends StatelessWidget {
  const AiCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    final _padding = responsiveValue<double>(context, xs: 16, lg: 24);

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(_padding / 2.5),
        child: ResponsiveGridRow(
          rowSegments: 100,
          children: [
            ResponsiveGridCol(
              lg: 40,
              xs: 100,
              child: Padding(
                padding: EdgeInsets.all(_padding / 2.5),
                child: ShadowContainer(
                  showHeader: false,
                  padding: EdgeInsets.all(_padding),
                  child: const AICodePromptForm(),
                ),
              ),
            ),
            ResponsiveGridCol(
              lg: 60,
              xs: 100,
              child: Padding(
                padding: EdgeInsets.all(_padding / 2.5),
                child: const ShadowContainer(
                  showHeader: false,
                  padding: EdgeInsets.zero,
                  child: GeneratedCodeField(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
