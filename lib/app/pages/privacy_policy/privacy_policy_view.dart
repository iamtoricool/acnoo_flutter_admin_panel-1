import 'package:acnoo_flutter_admin_panel/app/widgets/shadow_container/_shadow_container.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class PrivacyPolicyView extends StatefulWidget {
  const PrivacyPolicyView({super.key});

  @override
  State<PrivacyPolicyView> createState() => _PrivacyPolicyViewState();
}

class _PrivacyPolicyViewState extends State<PrivacyPolicyView> {
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
          showHeader: false,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: privacyPolicies.length,
            itemBuilder: (context, index) {
              final policy = privacyPolicies[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 24.0, right: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      policy['title']!,
                      style: textTheme.titleMedium?.copyWith(color: theme.colorScheme.onPrimaryContainer, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      policy['description']!,
                      style: textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onTertiary),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  final List<Map<String, String>> privacyPolicies = [
    {
      'title': 'Introduction',
      'description':
          "Our Privacy Policy provides a comprehensive overview of how we manage your information when you visit our website or use our services. It explains the types of data we collect, including personal details and usage information, and how we use this data to improve our offerings. The policy also covers the circumstances under which we may disclose your information to third parties and the measures we take to protect your privacy. We are deeply committed to ensuring that your personal data is handled with the highest level of care and security, safeguarding it against unauthorized access or misuse."
    },
    {
      'title': 'Information Collection',
      'description':
          'We gather a range of information to enhance your experience on our website and services. This includes personal details that you voluntarily provide, such as your name, email address, and other contact information. Additionally, we collect usage data like your IP address, browser type, and operating system through cookies, log files, and other tracking technologies. These technologies help us understand how you interact with our site, allowing us to improve our services and deliver a more personalized experience. We ensure that all collected data is handled with strict confidentiality and security measures.'
    },
    {
      'title': 'Use of Information',
      'description':
          "The information we collect helps us enhance our services and tailor your experience to your preferences. We use your data to communicate with you effectively and to personalize your interactions with our platform. Additionally, your data may be utilized for research and analytics purposes, allowing us to better understand user behavior and improve our offerings."
    },
    {
      'title': 'Data Sharing',
      'description':
          "We do not sell or rent your personal information to third parties. However, we may share your data with trusted partners who help us operate and improve our services. These partners are carefully selected and are required to adhere to our strict privacy standards, ensuring your information remains secure and confidential."
    },
    {
      'title': 'Data Security',
      'description':
          'We implement appropriate security measures to protect your personal information from unauthorized access, alteration, or disclosure. Despite our efforts, no data transmission over the internet can be guaranteed to be completely secure.',
    },
    {
      'title': 'Your Rights',
      'description':
          'You have the right to access, correct, or delete your personal information. You can also opt out of certain data collection practices. For more details on how to exercise these rights, please contact us.',
    },
    {
      'title': 'Changes to This Policy',
      'description': 'We may update this Privacy Policy from time to time. Any changes will be posted on this page, and we encourage you to review it periodically.',
    },
    {
      'title': 'Contact Us',
      'description': 'If you have any questions or concerns about our Privacy Policy, please contact us at [contact information].',
    },
  ];
}
