import 'package:flutter/material.dart';

import '../../../core/helpers/fuctions/_get_image.dart';

class UserProfileDetailsWidget extends StatelessWidget {
  const UserProfileDetailsWidget({
    super.key,
    required double padding,
    required this.theme,
    required this.textTheme,
  }) : _padding = padding;

  final double _padding;
  final ThemeData theme;
  final TextTheme textTheme;

  Widget _buildProfileDetailRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.all(_padding),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: textTheme.bodyLarge,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Text(
                  ':',
                  style: textTheme.bodyMedium,
                ),
                const SizedBox(width: 8.0),
                Flexible(
                  child: Text(
                    value,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 178,
          width: MediaQuery.of(context).size.width,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.0),
              topLeft: Radius.circular(20.0),
            ),
          ),
          child: getImageType(_userProfile.$1, fit: BoxFit.cover, alignment: Alignment.bottomCenter),
        ),
        const SizedBox(height: 70),
        Padding(
          padding: EdgeInsets.all(_padding),
          child: Container(
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: theme.colorScheme.outline,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildProfileDetailRow('Full Name', 'Sahidul Islam'),
                Divider(
                  color: theme.colorScheme.outline,
                  height: 0.0,
                ),
                _buildProfileDetailRow('Email', 'shaidulislma@gmail.com'),
                Divider(
                  color: theme.colorScheme.outline,
                  height: 0.0,
                ),
                _buildProfileDetailRow('Phone Number', '12345878732'),
                Divider(
                  color: theme.colorScheme.outline,
                  height: 0.0,
                ),
                _buildProfileDetailRow('Registration Date', '23 Oct, 2024'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

const (String,) _userProfile = ('https://raw.githubusercontent.com/iamtoricool/static_images/main/background_images/background_image_08.png',);
