import 'package:flutter/material.dart';

import 'package:feather_icons/feather_icons.dart';
import 'package:iconly/iconly.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../../widgets/widgets.dart';

class EmailDetailsView extends StatelessWidget {
  const EmailDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _appbarIconColor = _theme.colorScheme.onTertiary;

    final _padding = responsiveValue<double>(context, xs: 16, md: 24);

    final _actionButtonStyle = OutlinedButton.styleFrom(
      padding: responsiveValue<EdgeInsetsGeometry?>(
        context,
        xs: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        md: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      ),
      side: BorderSide(color: _theme.colorScheme.onTertiary),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      foregroundColor: _theme.colorScheme.onTertiary,
      textStyle: _theme.textTheme.bodyLarge?.copyWith(
        fontSize: responsiveValue<double?>(
          context,
          xs: 14,
          md: null,
        ),
      ),
    );

    return Scaffold(
      backgroundColor: _theme.colorScheme.primaryContainer,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(IconlyLight.star),
            color: _appbarIconColor,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(FeatherIcons.trash2),
            color: _appbarIconColor,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(FeatherIcons.printer),
            color: _appbarIconColor,
          ),
        ],
        flexibleSpace: Container(
          alignment: Alignment.bottomCenter,
          margin: const EdgeInsets.only(top: kToolbarHeight),
          child: Divider(color: _theme.colorScheme.outline),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(_padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Subject
            Text(
              'Whimsical Wedding Graphics to Design Your',
              style: _theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),

            // Sender Info
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                    leading: const AvatarWidget(
                      imagePath:
                          'https://raw.githubusercontent.com/iamtoricool/static_images/main/avatars/person_images/person_image_06.jpeg',
                    ),
                    title: const Text('Devon Lane'),
                    titleTextStyle: _theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    subtitle: const Text('random@gmail.com'),
                    subtitleTextStyle: _theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.normal,
                      color: _theme.colorScheme.onTertiary,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: _padding),
            Text(
              _emailBody,
              style: _theme.textTheme.bodyLarge?.copyWith(
                color: _theme.colorScheme.onTertiary,
              ),
            ),
            SizedBox(height: (_padding * 2) * 0.75),

            // Images
            Wrap(
              children: List.generate(
                _images.length,
                (index) {
                  final _image = _images[index];
                  return Container(
                    constraints: const BoxConstraints.tightFor(
                      height: 150,
                      width: 200,
                    ),
                    margin: EdgeInsets.only(
                      right: index + 1 == _image.length ? 0 : 20,
                      bottom: index + 1 == _image.length ? 0 : 16,
                    ),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DownloadableImageCard(
                      imagePath: _image,
                      action: const [DownloadableImageCardAction.download],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: (_padding * 3)),

            // Action Buttons
            Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  Flexible(
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      label: const Text('Reply'),
                      icon: Icon(
                        FeatherIcons.cornerUpLeft,
                        size: responsiveValue<double?>(
                          context,
                          xs: 18,
                          md: null,
                        ),
                      ),
                      style: _actionButtonStyle,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Flexible(
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      label: const Text('Forward'),
                      icon: Icon(
                        FeatherIcons.cornerUpRight,
                        size: responsiveValue<double?>(
                          context,
                          xs: 18,
                          md: null,
                        ),
                      ),
                      style: _actionButtonStyle,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

const _emailBody = '''
Hello Acnoo,\n
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
\nBest Regards\nAcnoo
''';

const _images = [
  'https://raw.githubusercontent.com/iamtoricool/static_images/main/background_images/background_image_09.png',
  'https://raw.githubusercontent.com/iamtoricool/static_images/main/background_images/background_image_10.png',
  'https://raw.githubusercontent.com/iamtoricool/static_images/main/background_images/background_image_11.png',
];
