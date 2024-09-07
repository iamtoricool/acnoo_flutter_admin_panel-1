import 'package:flutter/material.dart';

import '../../../widgets/file_input_field/_file_input_field.dart';

class UserProfileUpdateWidget extends StatelessWidget {
  const UserProfileUpdateWidget({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  Widget _buildTextFormField({
    required String initialValue,
    required bool obscureText,
  }) {
    return TextFormField(
      initialValue: initialValue,
      obscureText: obscureText,
      decoration: const InputDecoration(),
    );
  }

  Widget _buildRow({
    required String label,
    required String initialValue,
    required bool obscureText,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 1,
          child: Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.bodyLarge,
          ),
        ),
        const SizedBox(width: 4),
        Flexible(
          flex: 2,
          child: _buildTextFormField(
            initialValue: initialValue,
            obscureText: obscureText,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildRow(
          label: 'Name',
          initialValue: 'Admin',
          obscureText: false,
        ),
        const SizedBox(height: 16),
        _buildRow(
          label: 'Email',
          initialValue: 'admin@admin.com',
          obscureText: false,
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 1,
              child: Text(
                'Profile Picture',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textTheme.bodyLarge,
              ),
            ),
            const SizedBox(width: 4),
            const Flexible(
              flex: 2,
              child: AcnooFileInputField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10)
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _buildRow(
          label: 'Current Password',
          initialValue: '123456',
          obscureText: true,
        ),
        const SizedBox(height: 16),
        _buildRow(
          label: 'New Password',
          initialValue: '123456',
          obscureText: true,
        ),
        const SizedBox(height: 16),
        _buildRow(
          label: 'Confirm Password',
          initialValue: '123456',
          obscureText: true,
        ),
        const SizedBox(height: 34),
        ElevatedButton.icon(
          label: const Text(
            'Save Changes',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
