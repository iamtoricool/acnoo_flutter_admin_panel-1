import 'dart:async';

import 'package:flutter/material.dart';

import 'package:responsive_framework/responsive_framework.dart' as rf;
import 'package:responsive_grid/responsive_grid.dart';

import '../../widgets/widgets.dart';

class CardsView extends StatefulWidget {
  const CardsView({super.key});

  @override
  State<CardsView> createState() => _CardsViewState();
}

class _CardsViewState extends State<CardsView> {
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
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

    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        addAutomaticKeepAlives: false,
        padding: _sizeInfo.padding / 2.5,
        children: [
          // Feature Cards
          ResponsiveGridRow(
            children: [
              ...[
                {
                  "title": "Blog Post Writing",
                  "description":
                      "Write engaging introduction & section paragraphs for your blog.",
                  "imagePath":
                      "assets/images/widget_images/card_images/feature_card/feature_card_icon_01.svg",
                },
                {
                  "title": "Business Ideas",
                  "description":
                      "Write engaging introduction & section paragraphs for your blog.",
                  "imagePath":
                      "assets/images/widget_images/card_images/feature_card/feature_card_icon_02.svg",
                },
                {
                  "title": "Technology",
                  "description":
                      "Write engaging introduction & section paragraphs for your blog.",
                  "imagePath":
                      "assets/images/widget_images/card_images/feature_card/feature_card_icon_03.svg",
                },
                {
                  "title": "Paragraph Generator",
                  "description":
                      "Write engaging introduction & section paragraphs for your blog.",
                  "imagePath":
                      "assets/images/widget_images/card_images/feature_card/feature_card_icon_04.svg",
                },
              ].map(
                (e) => ResponsiveGridCol(
                  lg: 3,
                  md: 6,
                  sm: 12,
                  xs: 12,
                  child: Padding(
                    padding: _sizeInfo.padding / 2.5,
                    child: FeatureCardWidget(
                      title: e['title'] as String,
                      description: e['description'],
                      imagePath: e['imagePath'],
                      actions: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.bookmark_outline),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),

          // Large Blog Cards
          ResponsiveGridRow(
            children: [
              ...{
                BlogCardWidgetType.contentBL: _group1Images.$1,
                BlogCardWidgetType.contentTC: _group1Images.$2,
                BlogCardWidgetType.contentBC: _group1Images.$3,
              }.entries.map(
                    (e) => ResponsiveGridCol(
                      lg: 4,
                      md: 6,
                      sm: 12,
                      xs: 12,
                      child: Padding(
                        padding: _sizeInfo.padding / 2.5,
                        child: FutureBuilder<String?>(
                          future: Future.delayed(
                            const Duration(milliseconds: 1800),
                            () => 'completed',
                          ),
                          builder: (context, snapshot) => BlogCardWidget(
                            title: _cardTitleDescription.$1,
                            description: _cardTitleDescription.$2,
                            cardWidgetType: e.key,
                            image: NetworkImage(
                              e.value,
                            ),
                            isLoading: !snapshot.hasData,
                          ),
                        ),
                      ),
                    ),
                  ),
            ],
          ),

          // Horizontal Cards
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                  (_sizeInfo.padding.horizontal / 2) / 2.5,
                  16,
                  (_sizeInfo.padding.horizontal / 2) / 2.5,
                  0,
                ),
                child: Text(
                  'Horizontal Cards',
                  style: _theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ResponsiveGridRow(
                children: [
                  // Horizontal Cards
                  ...{
                    '1': _horizontalCards.$1,
                    '2': _horizontalCards.$2,
                    '3': _horizontalCards.$3,
                    '4': _horizontalCards.$4,
                  }.entries.toList().asMap().entries.map(
                        (e) => ResponsiveGridCol(
                          lg: 6,
                          md: 6,
                          sm: 12,
                          xs: 12,
                          child: Padding(
                            padding: _sizeInfo.padding / 2.5,
                            child: FutureBuilder<String?>(
                              future: Future.delayed(
                                const Duration(milliseconds: 2500),
                                () => 'completed',
                              ),
                              builder: (context, snapshot) =>
                                  HorizontalCardWidget(
                                title: _cardTitleDescription.$1,
                                description: _cardTitleDescription.$2,
                                image: NetworkImage(e.value.value),
                                imageAlignment: e.key % 2 != 0
                                    ? ImageAlignment.end
                                    : ImageAlignment.start,
                                isLoading: !snapshot.hasData,
                              ),
                            ),
                          ),
                        ),
                      ),
                ],
              ),
            ],
          ),

          // Card Image
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                  (_sizeInfo.padding.horizontal / 2) / 2.5,
                  16,
                  (_sizeInfo.padding.horizontal / 2) / 2.5,
                  0,
                ),
                child: Text(
                  'Card Image',
                  style: _theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ResponsiveGridRow(
                children: [
                  ...{
                    BlogCardWidgetType.contentBL: _cardImages.$1,
                    BlogCardWidgetType.contentTL: _cardImages.$2,
                    BlogCardWidgetType.contentBC: _cardImages.$3,
                    BlogCardWidgetType.contentTC: _cardImages.$4,
                  }.entries.map(
                        (e) => ResponsiveGridCol(
                          lg: 3,
                          md: 6,
                          sm: 12,
                          xs: 12,
                          child: Padding(
                            padding: _sizeInfo.padding / 2.5,
                            child: FutureBuilder<String?>(
                              future: Future.delayed(
                                const Duration(milliseconds: 1800),
                                () => 'completed',
                              ),
                              builder: (context, snapshot) => BlogCardWidget(
                                title: _cardTitleDescription.$1,
                                description: _cardTitleDescription.$2,
                                cardWidgetType: e.key,
                                image: NetworkImage(
                                  e.value,
                                ),
                                isLoading: !snapshot.hasData,
                              ),
                            ),
                          ),
                        ),
                      ),
                ],
              ),
            ],
          ),

          // Card Border Color
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                  (_sizeInfo.padding.horizontal / 2) / 2.5,
                  16,
                  (_sizeInfo.padding.horizontal / 2) / 2.5,
                  0,
                ),
                child: Text(
                  'Card Border Color',
                  style: _theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ResponsiveGridRow(
                children: [
                  ...{
                    BlogCardWidgetType.contentBL: _cardImages.$1,
                    BlogCardWidgetType.contentTL: _cardImages.$2,
                    BlogCardWidgetType.contentBC: _cardImages.$3,
                    BlogCardWidgetType.contentTC: _cardImages.$4,
                  }.entries.map(
                        (e) => ResponsiveGridCol(
                          lg: 3,
                          md: 6,
                          sm: 12,
                          xs: 12,
                          child: Padding(
                            padding: _sizeInfo.padding / 2.5,
                            child: FutureBuilder<String?>(
                              future: Future.delayed(
                                const Duration(milliseconds: 1800),
                                () => 'completed',
                              ),
                              builder: (context, snapshot) => TestimonialCard(
                                title: _cardTitleDescription.$1,
                                description: _cardTitleDescription.$2,
                                imagePath:
                                    'assets/images/widget_images/card_images/feature_card/star_badge.svg',
                              ),
                            ),
                          ),
                        ),
                      ),
                ],
              ),
            ],
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

const (String, String) _cardTitleDescription = (
  'Title',
  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the ",
);

const (String, String, String) _group1Images = (
  'https://raw.githubusercontent.com/iamtoricool/static_images/main/background_images/background_image_01.png',
  'https://raw.githubusercontent.com/iamtoricool/static_images/main/background_images/background_image_02.png',
  'https://raw.githubusercontent.com/iamtoricool/static_images/main/background_images/background_image_03.png',
);

const (String, String, String, String) _horizontalCards = (
  'https://raw.githubusercontent.com/iamtoricool/static_images/main/product_images/product_image_01.png',
  'https://raw.githubusercontent.com/iamtoricool/static_images/main/product_images/product_image_02.png',
  'https://raw.githubusercontent.com/iamtoricool/static_images/main/product_images/product_image_03.jpeg',
  'https://raw.githubusercontent.com/iamtoricool/static_images/main/product_images/product_image_04.png',
);

const (String, String, String, String) _cardImages = (
  'https://raw.githubusercontent.com/iamtoricool/static_images/main/background_images/background_image_04.png',
  'https://raw.githubusercontent.com/iamtoricool/static_images/main/background_images/background_image_05.png',
  'https://raw.githubusercontent.com/iamtoricool/static_images/main/background_images/background_image_06.png',
  'https://raw.githubusercontent.com/iamtoricool/static_images/main/background_images/background_image_07.png',
);