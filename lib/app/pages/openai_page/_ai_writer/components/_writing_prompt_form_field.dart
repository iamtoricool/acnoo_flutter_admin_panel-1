import 'package:flutter/material.dart';

import 'package:country_flags/country_flags.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:expansion_widget/expansion_widget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../../../core/helpers/field_styles/field_styles.dart';
import '../../../../core/theme/theme.dart';
import '../../../../widgets/widgets.dart';

class AIWriterPromptForm extends StatefulWidget {
  const AIWriterPromptForm({
    super.key,
    this.onFormSubmit,
  });
  final void Function()? onFormSubmit;

  @override
  State<AIWriterPromptForm> createState() => _AIWriterPromptFormState();
}

class _AIWriterPromptFormState extends State<AIWriterPromptForm> {
  final _templates = [
    "Blog Post Writing",
    "Product Descriptions",
    "Social Media Captions",
    "Email Newsletters",
    "SEO Meta Descriptions",
    "Ad Copy",
    "Landing Page Copy",
    "Press Releases",
    "Whitepapers",
    "Case Studies",
    "Video Scripts",
    "E-commerce Product Listings",
    "Website Content",
    "Technical Documentation",
    "Creative Writing (e.g., Short Stories)",
    "Brand Storytelling",
    "Resume and Cover Letters",
    "App Store Descriptions",
    "E-book Writing",
    "Customer Testimonials",
    "Sales Copy",
    "How-to Guides",
    "FAQs Writing",
    "Job Descriptions",
    "Business Proposals",
    "Cold Email Outreach",
    "Speech Writing",
    "Interview Question Writing",
    "Review Responses",
    "Event Invitations"
  ];
  final supportedLanguages = {
    "English": "US",
    "Bangla": "BD",
  };

  final _creativityLevels = [
    "Casual",
    "Professional",
    "Witty",
    "Friendly",
    "Conversational",
    "Inspirational",
    "Formal",
    "Persuasive",
    "Humorous",
    "Empathetic",
    "Imaginative",
    "Sophisticated",
    "Direct",
    "Playful",
    "Energetic",
    "Optimistic",
    "Reflective",
    "Authoritative",
    "Adventurous",
    "Quirky"
  ];

  final _toneOfVoiceOptions = [
    "Friendly",
    "Professional",
    "Serious",
    "Playful",
    "Confident",
    "Respectful",
    "Empathetic",
    "Bold",
    "Calm",
    "Excited",
    "Persuasive",
    "Caring",
    "Neutral",
    "Optimistic",
    "Inspirational",
    "Sophisticated",
    "Casual",
    "Formal",
    "Humorous",
    "Thoughtful"
  ];

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _dropdownStyle = AcnooDropdownStyle(context);
    final _mqSize = MediaQuery.sizeOf(context);
    final _addHorizontalPadding = _mqSize.width >= 576;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Generative Form
        ExpansionWidget.autoSaveState(
          initiallyExpanded: true,
          titleBuilder: (aV, eV, iE, tF) => _buildFilterExpansionTile(
            context,
            isExpanded: iE,
            onTap: () => tF(animated: true),
          ),
          content: Form(
            child: ResponsiveGridRow(
              children: [
                // Keywords Field
                ResponsiveGridCol(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 12),
                    child: TextFieldLabelWrapper(
                      label: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Keywords (Separate with comma)',
                              style: _theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Text(
                            '0/8',
                            style: _theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      inputField: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'e.g. maantheme, acnoo',
                        ),
                      ),
                    ),
                  ),
                ),

                // Template
                ResponsiveGridCol(
                  md: 6,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                      0,
                      12,
                      _addHorizontalPadding ? 12 : 0,
                      12,
                    ),
                    child: TextFieldLabelWrapper(
                      labelText: 'Template',
                      inputField: DropdownButtonFormField2(
                        style: _dropdownStyle.textStyle,
                        iconStyleData: _dropdownStyle.iconStyle,
                        buttonStyleData: _dropdownStyle.buttonStyle,
                        dropdownStyleData: _dropdownStyle.dropdownStyle,
                        menuItemStyleData: _dropdownStyle.menuItemStyle,
                        isExpanded: true,
                        selectedItemBuilder: (ctx) {
                          return _buildDropdownSelectedItem(
                            ctx,
                            items: _templates,
                          );
                        },
                        value: _templates.firstOrNull,
                        items: _templates.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                ),

                // Language
                ResponsiveGridCol(
                  md: 6,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                      _addHorizontalPadding ? 12 : 0,
                      12,
                      0,
                      12,
                    ),
                    child: TextFieldLabelWrapper(
                      labelText: 'Language',
                      inputField: DropdownButtonFormField2(
                        style: _dropdownStyle.textStyle,
                        iconStyleData: _dropdownStyle.iconStyle,
                        buttonStyleData: _dropdownStyle.buttonStyle,
                        dropdownStyleData: _dropdownStyle.dropdownStyle,
                        menuItemStyleData: _dropdownStyle.menuItemStyle,
                        isExpanded: true,
                        value: supportedLanguages.entries.firstOrNull?.key,
                        items: supportedLanguages.entries
                            .map((item) => DropdownMenuItem(
                                  value: item.key,
                                  child: Row(
                                    children: [
                                      CountryFlag.fromCountryCode(
                                        item.value,
                                        height: 24,
                                        width: 30,
                                        shape: const RoundedRectangle(2),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(item.key),
                                    ],
                                  ),
                                ))
                            .toList(),
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                ),

                // Maximum Length
                ResponsiveGridCol(
                  md: 6,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                      0,
                      12,
                      _addHorizontalPadding ? 12 : 0,
                      12,
                    ),
                    child: TextFieldLabelWrapper(
                      labelText: 'Maximum Length',
                      inputField: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(hintText: '500'),
                      ),
                    ),
                  ),
                ),

                // Number of Results
                ResponsiveGridCol(
                  md: 6,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                      _addHorizontalPadding ? 12 : 0,
                      12,
                      0,
                      12,
                    ),
                    child: TextFieldLabelWrapper(
                      labelText: 'Number of Results',
                      inputField: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(hintText: '2'),
                      ),
                    ),
                  ),
                ),

                // Creativity
                ResponsiveGridCol(
                  md: 6,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                      0,
                      12,
                      _addHorizontalPadding ? 12 : 0,
                      12,
                    ),
                    child: TextFieldLabelWrapper(
                      labelText: 'Creativity',
                      inputField: DropdownButtonFormField2(
                        style: _dropdownStyle.textStyle,
                        iconStyleData: _dropdownStyle.iconStyle,
                        buttonStyleData: _dropdownStyle.buttonStyle,
                        dropdownStyleData: _dropdownStyle.dropdownStyle,
                        menuItemStyleData: _dropdownStyle.menuItemStyle,
                        isExpanded: true,
                        selectedItemBuilder: (ctx) {
                          return _buildDropdownSelectedItem(
                            ctx,
                            items: _creativityLevels,
                          );
                        },
                        value: _creativityLevels.first,
                        items: _creativityLevels.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                ),

                // Tone of Voice
                ResponsiveGridCol(
                  md: 6,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                      _addHorizontalPadding ? 12 : 0,
                      12,
                      0,
                      12,
                    ),
                    child: TextFieldLabelWrapper(
                      labelText: 'Tone of Voice',
                      inputField: DropdownButtonFormField2(
                        style: _dropdownStyle.textStyle,
                        iconStyleData: _dropdownStyle.iconStyle,
                        buttonStyleData: _dropdownStyle.buttonStyle,
                        dropdownStyleData: _dropdownStyle.dropdownStyle,
                        menuItemStyleData: _dropdownStyle.menuItemStyle,
                        isExpanded: true,
                        selectedItemBuilder: (ctx) {
                          return _buildDropdownSelectedItem(
                            ctx,
                            items: _toneOfVoiceOptions,
                          );
                        },
                        value: _toneOfVoiceOptions.first,
                        items: _toneOfVoiceOptions.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                ),

                // Submit Button
                ResponsiveGridCol(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 12),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        textStyle: _theme.elevatedButtonTheme.style?.textStyle
                            ?.resolve({})?.copyWith(),
                      ),
                      child: const Text('Apply'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox.square(dimension: 12),

        // Blog Writing  Suggestion
        Text(
          'Blog Writing  Suggestion',
          style: _theme.textTheme.bodyLarge?.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox.square(dimension: 16),

        ...[
          "Write a Text",
          "Compare business strategies",
          "Create a personal content for me",
        ].map((item) {
          return Container(
            width: double.maxFinite,
            padding: const EdgeInsets.only(bottom: 16),
            child: _buildSuggestionTile(context, title: item),
          );
        })
      ],
    );
  }

  Widget _buildFilterExpansionTile(
    BuildContext context, {
    bool isExpanded = false,
    void Function()? onTap,
  }) {
    final _theme = Theme.of(context);

    final _isDark = _theme.brightness == Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 10, 10, 10),
        decoration: BoxDecoration(
          color: _isDark
              ? AcnooAppColors.kDark3
              : AcnooAppColors.kPrimary200.withOpacity(0.50),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                'Filter',
                style: _theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Icon(
              isExpanded ? MdiIcons.chevronUp : MdiIcons.chevronDown,
              color: _theme.checkboxTheme.side?.color,
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildDropdownSelectedItem(
    BuildContext context, {
    List<String> items = const [],
    TextStyle? style,
  }) {
    final ThemeData(:textTheme) = Theme.of(context);

    return items.map((item) {
      return Text(
        item,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: style ?? textTheme.bodyLarge,
      );
    }).toList();
  }

  Widget _buildSuggestionTile(
    BuildContext context, {
    required String title,
  }) {
    final _theme = Theme.of(context);
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: _theme.colorScheme.outline),
        padding: const EdgeInsets.fromLTRB(16, 12, 10, 12),
        foregroundColor: _theme.colorScheme.onTertiaryContainer,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(child: Text(title)),
          Icon(MdiIcons.chevronRight),
        ],
      ),
    );
  }
}
