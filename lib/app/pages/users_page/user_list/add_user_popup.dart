import 'package:flutter/material.dart';

import '../../../core/theme/_app_colors.dart';
import 'package:responsive_framework/responsive_framework.dart' as rf;

class AddUserDialog extends StatefulWidget {
  const AddUserDialog({super.key});

  @override
  State<AddUserDialog> createState() => _AddUserDialogState();
}

class _AddUserDialogState extends State<AddUserDialog> {
  String? _selectedPosition;
  final List<String> _positions = ['Manager', 'Developer', 'Designer', 'Tester'];

  @override
  Widget build(BuildContext context) {
    final _sizeInfo = rf.ResponsiveValue<_SizeInfo>(
      context,
      conditionalValues: [
        const rf.Condition.between(
          start: 0,
          end: 480,
          value: _SizeInfo(
            alertFontSize: 12,
            padding: EdgeInsets.all(16),
            innerSpacing: 16,
          ),
        ),
        const rf.Condition.between(
          start: 481,
          end: 576,
          value: _SizeInfo(
            alertFontSize: 14,
            padding: EdgeInsets.all(16),
            innerSpacing: 16,
          ),
        ),
        const rf.Condition.between(
          start: 577,
          end: 992,
          value: _SizeInfo(
            alertFontSize: 14,
            padding: EdgeInsets.all(16),
            innerSpacing: 16,
          ),
        ),
      ],
      defaultValue: const _SizeInfo(),
    ).value;
    TextTheme textTheme = Theme.of(context).textTheme;
    final theme = Theme.of(context);
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      alignment: Alignment.center,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///---------------- header section
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0, 16, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Form Dialog'),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.close,
                      color: AcnooAppColors.kError,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 0.1,
              color: theme.colorScheme.outline,
              height: 0,
            ),

            ///---------------- header section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: 606,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///---------------- image section
                    Text('Image', style: textTheme.bodySmall),
                    const SizedBox(height: 8),
                    DottedBorderContainer(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.camera_alt_outlined,
                            color: theme.colorScheme.onTertiary,
                          ),
                          const Text('Upload Image'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    ///---------------- Text Field section
                    Text('Full Name', style: textTheme.bodySmall),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Enter Your Full Name', hintStyle: textTheme.bodySmall),
                      validator: (value) => value?.isEmpty ?? true ? 'Please enter your full name' : null,
                    ),
                    const SizedBox(height: 20),
                    Text('Email', style: textTheme.bodySmall),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Enter Your Email', hintStyle: textTheme.bodySmall),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) => value?.isEmpty ?? true ? 'Please enter your email' : null,
                    ),
                    const SizedBox(height: 20),
                    Text('Phone Number', style: textTheme.bodySmall),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Enter Your Phone Number', hintStyle: textTheme.bodySmall),
                      keyboardType: TextInputType.phone,
                      validator: (value) => value?.isEmpty ?? true ? 'Please enter your phone number' : null,
                    ),
                    const SizedBox(height: 20),
                    Text('Position', style: textTheme.bodySmall),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      dropdownColor: theme.colorScheme.primaryContainer,
                      value: _selectedPosition,
                      hint: Text(
                        'Select Position',
                        style: textTheme.bodySmall,
                      ),
                      items: _positions.map((position) {
                        return DropdownMenuItem<String>(
                          value: position,
                          child: Text(position),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedPosition = value;
                        });
                      },
                      validator: (value) => value == null ? 'Please select a position' : null,
                    ),
                    const SizedBox(height: 20),
                    Text('Note', style: textTheme.bodySmall),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Write Something', hintStyle: textTheme.bodySmall),
                      maxLines: 3,
                    ),
                    const SizedBox(height: 24),

                    ///---------------- Submit Button section
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: _sizeInfo.innerSpacing),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OutlinedButton.icon(
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(horizontal: _sizeInfo.innerSpacing),
                                backgroundColor: theme.colorScheme.primaryContainer,
                                textStyle: textTheme.bodySmall?.copyWith(color: AcnooAppColors.kError),
                                side: const BorderSide(color: AcnooAppColors.kError)),
                            onPressed: () => Navigator.pop(context),
                            label: Text(
                              'Cancel',
                              style: textTheme.bodySmall?.copyWith(color: AcnooAppColors.kError),
                            ),
                          ),
                          SizedBox(width: _sizeInfo.innerSpacing),
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: _sizeInfo.innerSpacing),
                            ),
                            onPressed: () => Navigator.pop(context),
                            label: const Text('Save'),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _SizeInfo {
  final double? alertFontSize;
  final EdgeInsetsGeometry padding;
  final double innerSpacing;
  const _SizeInfo({
    this.alertFontSize = 18,
    this.padding = const EdgeInsets.all(24),
    this.innerSpacing = 24,
  });
}

// -------------------Dotted Border

class DottedBorderContainer extends StatelessWidget {
  final Widget child;

  const DottedBorderContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DottedBorderPainter(color: Theme.of(context).colorScheme.outline),
      child: Container(
        padding: const EdgeInsets.all(4),
        height: 120,
        width: 120,
        child: Center(child: child),
      ),
    );
  }
}

class DottedBorderPainter extends CustomPainter {
  final Color color;

  DottedBorderPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    const radius = Radius.circular(5.0);
    const rect = Rect.fromLTWH(0, 0, 120, 120);
    final rrect = RRect.fromRectAndRadius(rect, radius);

    final path = Path()..addRRect(rrect);

    const dashWidth = 4.0;
    const dashSpace = 4.0;

    double distance = 0.0;
    final pathMetrics = path.computeMetrics();
    for (final pathMetric in pathMetrics) {
      while (distance < pathMetric.length) {
        final start = distance;
        final end = distance + dashWidth;

        final lineSegment = pathMetric.extractPath(start, end);
        canvas.drawPath(lineSegment, paint);

        distance += dashWidth + dashSpace;
      }
      distance = 0.0; // Reset distance for the next segment
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}