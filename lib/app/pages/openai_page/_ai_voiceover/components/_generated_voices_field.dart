import 'package:flutter/material.dart';

import 'package:responsive_grid/responsive_grid.dart';

import '../../../../widgets/widgets.dart';

class GeneratedVoicesFields extends StatelessWidget {
  const GeneratedVoicesFields({super.key});

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    final _padding = responsiveValue<double>(context, xs: 16, lg: 24);
    final _headerPadding = responsiveValue<EdgeInsetsGeometry?>(
      context,
      xs: const EdgeInsets.fromLTRB(16, 16, 16, 12),
      lg: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Document Header
        Container(
          padding: _headerPadding,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: _theme.colorScheme.outline,
              ),
            ),
          ),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: 'Document Name',
              suffixIcon: Container(
                margin: const EdgeInsets.all(5),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    visualDensity: const VisualDensity(vertical: -4),
                  ),
                  child: const Text('Save'),
                ),
              ),
            ),
          ),
        ),

        // Generated Audios
        SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: _padding / 1.75,
            vertical: _padding / 1.35,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ('Today', 4, 1),
              ('25 Jun 2024', 10, 1),
            ].map(
              (item) {
                return _buildGeneratedGroup(
                  context,
                  generatedDate: item.$1,
                  generateLimit: item.$2,
                  generatedCount: item.$3,
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildGeneratedGroup(
    BuildContext context, {
    required String generatedDate,
    int generatedCount = 0,
    int generateLimit = 0,
  }) {
    final _theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            text: generatedDate,
            children: [
              TextSpan(
                text: ' $generatedCount of $generateLimit',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: _theme.colorScheme.onTertiary,
                ),
              ),
            ],
          ),
          style: _theme.textTheme.titleLarge?.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        Flexible(
          child: ListView.separated(
            shrinkWrap: true,
            primary: false,
            itemCount: generateLimit,
            padding: const EdgeInsets.symmetric(vertical: 16),
            itemBuilder: (context, index) {
              return AudioPlayerTile(
                key: ValueKey(index),
                playDuration: (23 * (index + 1)),
              );
            },
            separatorBuilder: (context, index) => const SizedBox.square(
              dimension: 16,
            ),
          ),
        ),
      ],
    );
  }
}
