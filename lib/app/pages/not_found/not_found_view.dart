import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class NotFoundView extends StatelessWidget {
  const NotFoundView({super.key});

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _textTheme = _theme.textTheme;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              fit: BoxFit.contain,
              height: MediaQuery.of(context).size.height * .24,
              'images/widget_images/blank_screen/not_found.svg',
            ),
            const SizedBox(height: 20.0),
            Text(
              'Ooops! Page Not Found',
              textAlign: TextAlign.center,
              style: _textTheme.headlineLarge
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8.0),
            Text(
              'This page doesn\'t exist or was removed! \nWe suggest you back to home',
              textAlign: TextAlign.center,
              style: _textTheme.bodyMedium
                  ?.copyWith(color: _theme.colorScheme.onTertiary),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 12),
              ),
              onPressed: () => context.go('/dashboard'),
              label: const Text('Go Back'),
            )
          ],
        ),
      ),
    );
  }
}
