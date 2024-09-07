import 'package:flutter/material.dart';

import 'package:responsive_grid/responsive_grid.dart';

import '../../../widgets/widgets.dart';

class TopGridLayout extends StatelessWidget {
  const TopGridLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveGridRow(
      children: List.generate(
        8,
        (index) {
          final _item = _overviewItems[index];

          return ResponsiveGridCol(
            lg: 3,
            md: 6,
            xs: 12,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: OverviewTileWidget(
                imagePath: _item.iconPath,
                title: _item.title,
                subTitle: _item.subtitle,
                iconBackgroundColor: _item.iconColor,
              ),
            ),
          );
        },
      ),
    );
  }
}

final _overviewItems = <OverviewItem>[
  ...[
    (
      "assets/images/widget_images/dashboard_overview_icon/edit_icon.png",
      "500",
      "Generated Article",
      const Color(0xffAD00FF)
    ),
    (
      "assets/images/widget_images/dashboard_overview_icon/speech_to_text.png",
      "500",
      "Speech To Text ",
      const Color(0xff00AD66)
    ),
    (
      "assets/images/widget_images/dashboard_overview_icon/image_icon.png",
      "500",
      "Images Generated ",
      const Color(0xff4429FF)
    ),
    (
      "assets/images/widget_images/dashboard_overview_icon/pdf_icon.png",
      "500",
      "PDF Generate ",
      const Color(0xffEE11E5)
    ),
    (
      "assets/images/widget_images/dashboard_overview_icon/code_icon.png",
      "500",
      "Code Generated ",
      const Color(0xffFE6921)
    ),
    (
      "assets/images/widget_images/dashboard_overview_icon/voiceover_icon.png",
      "500",
      "Voiceover Generated ",
      const Color(0xff1570EF)
    ),
    (
      "assets/images/widget_images/dashboard_overview_icon/document_icon.png",
      "500",
      "Document Generated",
      const Color(0xff00AD66)
    ),
    (
      "assets/images/widget_images/dashboard_overview_icon/credit_card_icon.png",
      "500",
      "Total Credit Balance",
      const Color(0xff8106FB)
    ),
  ].map(
    (item) => OverviewItem(
      iconPath: item.$1,
      title: item.$2,
      subtitle: item.$3,
      iconColor: item.$4.withOpacity(0.15),
    ),
  )
];

class OverviewItem {
  final String iconPath;
  final String title;
  final String subtitle;
  final Color? iconColor;
  const OverviewItem({
    required this.iconPath,
    required this.title,
    required this.subtitle,
    this.iconColor,
  });
}
