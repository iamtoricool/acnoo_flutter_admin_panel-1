import 'package:expansion_widget/expansion_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../core/theme/_app_colors.dart';
import '../../widgets/shadow_container/_shadow_container.dart';

class FaqView extends StatefulWidget {
  const FaqView({super.key});

  @override
  State<FaqView> createState() => _FaqViewState();
}

class _FaqViewState extends State<FaqView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final _padding = responsiveValue<double>(
      context,
      xs: 16,
      sm: 16,
      md: 16,
      lg: 24,
    );

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(_padding),
        child: ShadowContainer(
          showHeader: true,
          headerText: 'General Questions',
          child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: termsList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Container(
                    padding: EdgeInsets.all(_padding),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: theme.colorScheme.primaryContainer,
                      border: Border.all(color: theme.colorScheme.surface, width: 1),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xff2E2D74).withOpacity(0.05),
                          blurRadius: 30,
                          spreadRadius: 0,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ExpansionWidget(
                      expandedAlignment: Alignment.topLeft,
                      initiallyExpanded: index == 0,
                      titleBuilder: (animationValue, easeInValue, isExpanded, toggleFunction) => InkWell(
                        onTap: () => toggleFunction(animated: true),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                termsList[index]['title'] ?? '',
                                style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                              ),
                            ),
                            const SizedBox(width: 4.0),
                            Icon(
                              isExpanded ? Icons.remove_circle_outline : Icons.add_circle_outline_outlined,
                              color: AcnooAppColors.kPrimary700,
                            )
                          ],
                        ),
                      ),
                      content: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          termsList[index]['description'] ?? '',
                          textAlign: TextAlign.start,
                          style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400),
                        ),
                      ),
                    )),
              );
            },
          ),
        ),
      ),
    );
  }

  final List<Map<String, String>> termsList = [
    {
      'title': 'How can you be sure the numbers are really random?',
      'description':
          "We combine hardware and software methods, including cryptographic algorithms, to ensure randomness. Regular statistical testing verifies the integrity and unpredictability of our numbers."
    },
    {
      'title': 'Is the source code for the generator available?',
      'description': 'Our generator’s source code is proprietary and not publicly available, but we provide detailed documentation and support for understanding our algorithms.'
    },
    {
      'title': 'Can I download the generator software and run it on my own computer?',
      'description': "The generator operates only on our secure online platform to ensure consistent performance and security. Use our platform for your needs."
    },
    {
      'title': 'Can other info be added to an invoice?',
      'description': "Our invoicing system allows for customization like logos and messages. Refer to the user guide or contact support for assistance."
    },
    {
      'title': 'How can you be sure the numbers are really random?',
      'description': 'We use cryptographic algorithms and rigorous testing to ensure the numbers are unpredictable and unbiased, with transparency and independent verification available.'
    },
    {
      'title': 'How do I pick winners for a lottery or drawing?',
      'description': 'Use a certified random number generator for a fair and transparent drawing. Document rules and criteria clearly. Contact us for best practices.'
    },
    {
      'title': 'What security measures are in place for my data?',
      'description':
          "We implement robust security measures including encryption, secure servers, and regular audits to protect your data. Our platform adheres to industry standards for data protection and privacy. We also provide transparency about our security practices and are open to addressing any concerns."
    },
    {
      'title': 'What should I do if I encounter technical issues?',
      'description':
          "If you experience technical issues, please contact our support team for assistance. We offer various support channels including email and phone to resolve problems promptly. Our team is dedicated to providing timely solutions and ensuring a smooth user experience."
    },
  ];
}