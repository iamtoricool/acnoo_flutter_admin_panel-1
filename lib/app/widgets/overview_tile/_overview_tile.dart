import 'package:flutter/material.dart';

import 'package:responsive_grid/responsive_grid.dart';

import '../../core/helpers/fuctions/helper_functions.dart';

class OverviewTileWidget extends StatefulWidget {
  const OverviewTileWidget({
    super.key,
    this.imagePath,
    this.icon,
    required this.title,
    required this.subTitle,
    this.iconBackgroundColor,
  }) : assert(
          imagePath == null || icon == null,
          'imagePath & icon cannot be used together',
        );

  /// Use imagePath if the leading widget is any kind of image [such as: Network, Asset or SVG]
  final String? imagePath;
  final Widget? icon;

  final String title;
  final String subTitle;
  final Color? iconBackgroundColor;

  @override
  State<OverviewTileWidget> createState() => _OverviewTileWidgetState();
}

class _OverviewTileWidgetState extends State<OverviewTileWidget> {
  bool isHovering = false;
  void changeHoverState(bool value) {
    return setState(() => isHovering = value);
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    final _cardPadding = responsiveValue<double>(
      context,
      xs: 12,
      sm: 12,
      md: 14,
      lg: 16,
    );

    return MouseRegion(
      onEnter: (event) => changeHoverState(true),
      onExit: (event) => changeHoverState(false),
      cursor: SystemMouseCursors.click,
      child: Material(
        color: _theme.colorScheme.primaryContainer,
        elevation: isHovering ? 4.75 : 0,
        borderRadius: BorderRadius.circular(8),
        clipBehavior: Clip.antiAlias,
        child: Container(
          padding: EdgeInsets.all(_cardPadding),
          child: Row(
            children: [
              // Icon
              Container(
                constraints: BoxConstraints.tight(const Size.square(48)),
                padding: const EdgeInsets.all(10),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: widget.iconBackgroundColor ??
                      _theme.primaryColor.withOpacity(0.25),
                ),
                child: widget.icon ??
                    getImageType(
                      widget.imagePath,
                      fit: BoxFit.cover,
                      height: double.maxFinite,
                      width: double.maxFinite,
                    ),
              ),
              const SizedBox(width: 14),

              // Info
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      widget.title,
                      style: _theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: responsiveValue<double>(
                          context,
                          xs: 18,
                          md: 20,
                          lg: 20,
                        ),
                      ),
                    ),

                    // Subtitle
                    Text(
                      widget.subTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: _theme.textTheme.bodyLarge?.copyWith(
                        color: _theme.colorScheme.onTertiaryContainer,
                        fontSize: responsiveValue<double>(
                          context,
                          xs: 14,
                          md: 16,
                          lg: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
