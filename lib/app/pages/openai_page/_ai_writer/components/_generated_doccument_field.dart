import 'package:flutter/material.dart';

import 'package:responsive_grid/responsive_grid.dart';

import '../../../../widgets/widgets.dart';

class GeneratedDocumentField extends StatelessWidget {
  const GeneratedDocumentField({super.key});

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _defaultTextStyle = DefaultTextStyle.of(context).style;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Document Header
        _buildDocumentHeader(context),
        SizedBox(height: responsiveValue<double>(context, xs: 16, lg: 24)),

        // Mock Document
        Text.rich(
          TextSpan(
            children: [
              const TextSpan(
                text:
                    'Make up a 5-sentence story about "Sharky", a tooth-brushing shark superhero',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  height: 1.55,
                ),
              ),
              const TextSpan(
                text:
                    "\n\nCertainly! To provide you with more relevant and effective UX copy for a subscription plan, I'd need some specific details. However, I can offer you a generic example. Please adapt the following based on your product or service specifics:",
              ),
              TextSpan(
                text: '\n\nSubscription Plan Title: Premium Membership',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: _defaultTextStyle.color,
                ),
              ),
              const TextSpan(
                text:
                    '\nUnlock a world of exclusive benefits with our Premium Membership. Enjoy limitless access, early bird privileges, and personalized insights tailored just for you.',
              ),
              TextSpan(
                text: '\n\n1. Introduction Section:',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: _defaultTextStyle.color,
                ),
              ),
              const TextSpan(
                text: '\n\nUnlock a World of Exclusive Benefits!',
              ),
              const TextSpan(
                text:
                    '\n\nUpgrade to our Premium Membership for an unparalleled experience. Enjoy a host of premium features designed to elevate your [Product/Service] journey.',
              ),
              TextSpan(
                text: '\n\n2. Features Highlights:',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: _defaultTextStyle.color,
                ),
              ),
              const TextSpan(
                text:
                    '''\nLimitless Access: Dive into unrestricted access to our full range of [Product/Service]. Early Bird Access: Be the first to experience new features, products, and updates before anyone else. Personalized Insights: Tailored recommendations and insights to enhance your [Product/Service] experience based on your preferences.''',
              ),
              TextSpan(
                text: '\n\n3. Pricing Information:',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: _defaultTextStyle.color,
                ),
              ),
              const TextSpan(
                text: '''\nChoose the plan that suits your needs best:
Monthly Plan: \$9.99/month
Annual Plan: Save 20% - \$95.88/year''',
              ),
              TextSpan(
                text: '\n\n4. Call-to-Action Section:',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: _defaultTextStyle.color,
                ),
              ),
              const TextSpan(
                text: '''\nReady to elevate your experience?
[Subscribe Now] Button''',
              ),
              TextSpan(
                text: '\n\n5. Guarantee Section:',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: _defaultTextStyle.color,
                ),
              ),
              const TextSpan(
                text: '''\nRisk-Free Satisfaction Guaranteed
Not satisfied? We offer a 30-day money-back guarantee. No questions asked.''',
              ),
              TextSpan(
                text: '\n\n7. FAQ Section:',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: _defaultTextStyle.color,
                ),
              ),
              const TextSpan(
                text: '''\nHave Questions? We've Got Answers.
How do I cancel my subscription?
Can I switch plans at any time?
Is my payment information secure?''',
              ),
              TextSpan(
                text: '\n\n8. Footer Section:',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: _defaultTextStyle.color,
                ),
              ),
              const TextSpan(
                text:
                    '''\nJoin [Your Company] Premium and experience [Product/Service] like never before. Subscribe now to unlock a new level of excellence!
Feel free to customize this copy according to your brand voice, specific features, and pricing details.''',
              ),
            ],
          ),
          style: _theme.textTheme.bodyLarge?.copyWith(
            color: _theme.colorScheme.onTertiaryContainer,
          ),
        )
      ],
    );
  }

  Widget _buildDocumentHeader(BuildContext context) {
    final _screenSize = MediaQuery.sizeOf(context);

    return ResponsiveGridRow(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Document Name Field
        ResponsiveGridCol(
          md: _screenSize.width >= 1680 ? 10 : 9,
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

        // Save As Buttons
        ResponsiveGridCol(
          md: _screenSize.width >= 1680 ? 2 : 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox.square(dimension: 24),
              Flexible(
                child: FileExportButton.excel(
                  onPressed: () {},
                ),
              ),
              const SizedBox(width: 6),
              Flexible(
                child: FileExportButton.csv(
                  onPressed: () {},
                ),
              ),
              const SizedBox(width: 6),
              Flexible(
                child: FileExportButton.print(
                  onPressed: () {},
                ),
              ),
              const SizedBox(width: 6),
              Flexible(
                child: FileExportButton.pdf(
                  onPressed: () {},
                ),
              ),
              const SizedBox(width: 6),
              Flexible(
                child: FileExportButton.copy(
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
