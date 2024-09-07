import 'package:flutter/material.dart';

import '../widgets.dart';

class ShadowContainer extends StatelessWidget {
  const ShadowContainer({
    super.key,
    this.headerText,
    this.showHeader = true,
    this.customHeader,
    this.decoration,
    this.child,
    this.trailing,
    // this.clipBehavior,
    this.padding = const EdgeInsets.all(16),
  });

  final String? headerText;
  final bool showHeader;
  final Widget? customHeader;
  final BoxDecoration? decoration;
  final Widget? child;
  final Widget? trailing;
  // final Clip? clipBehavior;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Container(
      // clipBehavior: clipBehavior ?? Clip.antiAlias,
      decoration: decoration ??
          BoxDecoration(
            color: _theme.colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(12),
          ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showHeader)
            customHeader ??
                DialogHeader(
                  headerTitle: headerText ?? 'Header Title',
                  showCloseButton: false,
                  trailing: trailing,
                ),
          if (child != null) Flexible(child: Padding(padding: padding, child: child!))
        ],
      ),
    );
  }
}
