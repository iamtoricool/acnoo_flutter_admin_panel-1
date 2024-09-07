import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:feather_icons/feather_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart' as rf;

import '../../../dev_utils/dev_utils.dart';
import '../../core/helpers/fuctions/helper_functions.dart';
import '../../core/static/static.dart';
import '../../widgets/widgets.dart';

class SigninView extends StatefulWidget {
  const SigninView({super.key});

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  bool rememberMe = false;
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _screenWidth = MediaQuery.sizeOf(context).width;

    final _desktopView = _screenWidth >= 1200;

    final _ssoButtonStyle = OutlinedButton.styleFrom(
      side: BorderSide(
        color: _theme.colorScheme.outline,
      ),
      foregroundColor: _theme.colorScheme.onTertiary,
      padding: rf.ResponsiveValue<EdgeInsetsGeometry?>(
        context,
        conditionalValues: [
          const rf.Condition.between(
            start: 0,
            end: 576,
            value: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
        ],
      ).value,
    );

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Row(
          children: [
            Flexible(
              child: Container(
                constraints: BoxConstraints(
                  minWidth: _desktopView ? (_screenWidth * 0.45) : _screenWidth,
                ),
                decoration: BoxDecoration(
                  color: _theme.colorScheme.primaryContainer,
                ),
                child: SafeArea(
                  child: Column(
                    children: [
                      // Header With Logo
                      const CompanyHeaderWidget(),

                      // Sign in form
                      Flexible(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 375),
                          child: Center(
                            child: SingleChildScrollView(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Sign in',
                                    style: _theme.textTheme.headlineSmall
                                        ?.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 10),

                                  Text.rich(
                                    TextSpan(
                                      text: 'Need an account? ',
                                      children: [
                                        TextSpan(
                                          text: 'Sign up',
                                          style: _theme.textTheme.labelLarge
                                              ?.copyWith(
                                            color: _theme.colorScheme.primary,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              context.push(
                                                '/authentication/signup',
                                              );
                                            },
                                        ),
                                      ],
                                    ),
                                    style:
                                        _theme.textTheme.labelLarge?.copyWith(
                                      color: _theme.checkboxTheme.side?.color,
                                    ),
                                  ),
                                  const SizedBox(height: 16),

                                  // SSO Login Buttons
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        child: OutlinedButton.icon(
                                          onPressed: () {},
                                          label: const Text('Use Google'),
                                          icon: getImageType(
                                            AcnooStaticImage.googleIcon,
                                            height: 14,
                                            width: 14,
                                          ),
                                          style: _ssoButtonStyle,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Flexible(
                                        child: OutlinedButton.icon(
                                          onPressed: () {},
                                          label: const Text('Use Apple'),
                                          icon: getImageType(
                                            AcnooStaticImage.appleIcon,
                                            height: 14,
                                            width: 14,
                                          ),
                                          style: _ssoButtonStyle,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),

                                  // Divider
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Flexible(
                                        child: Container(
                                          height: 1,
                                          color: _theme.colorScheme.outline,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        'or',
                                        style: _theme.textTheme.bodyMedium
                                            ?.copyWith(),
                                      ),
                                      const SizedBox(width: 10),
                                      Flexible(
                                        child: Container(
                                          height: 1,
                                          color: _theme.colorScheme.outline,
                                        ),
                                      )
                                    ],
                                  ),

                                  // Email Field
                                  TextFieldLabelWrapper(
                                    labelText: 'Email',
                                    inputField: TextFormField(
                                      decoration: const InputDecoration(
                                        hintText: 'Enter your email address',
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),

                                  // Password Field
                                  TextFieldLabelWrapper(
                                    labelText: 'Password',
                                    inputField: TextFormField(
                                      obscureText: !showPassword,
                                      decoration: InputDecoration(
                                        hintText: 'Enter your password',
                                        suffixIcon: IconButton(
                                          onPressed: () => setState(
                                            () => showPassword = !showPassword,
                                          ),
                                          icon: Icon(
                                            showPassword
                                                ? FeatherIcons.eye
                                                : FeatherIcons.eyeOff,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),

                                  // Remember Me / Forgot Password
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Remember Me
                                      Flexible(
                                        child: Text.rich(
                                          TextSpan(
                                            children: [
                                              WidgetSpan(
                                                alignment:
                                                    PlaceholderAlignment.middle,
                                                child: SizedBox.square(
                                                  dimension: 16,
                                                  child: Checkbox(
                                                    value: rememberMe,
                                                    onChanged: (value) =>
                                                        setState(
                                                      () => rememberMe = value!,
                                                    ),
                                                    visualDensity:
                                                        const VisualDensity(
                                                      horizontal: -4,
                                                      vertical: -2,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const WidgetSpan(
                                                child: SizedBox(width: 6),
                                              ),
                                              TextSpan(
                                                text: 'Remember Me',
                                                mouseCursor:
                                                    SystemMouseCursors.click,
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () => setState(
                                                            () => rememberMe =
                                                                !rememberMe,
                                                          ),
                                              ),
                                            ],
                                          ),
                                          style: _theme.textTheme.labelLarge
                                              ?.copyWith(
                                            color: _theme
                                                .checkboxTheme.side?.color,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),

                                      // Forgot Password
                                      Text.rich(
                                        TextSpan(
                                          text: 'Forgot Password?',
                                          mouseCursor: SystemMouseCursors.click,
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () =>
                                                _handleForgotPassword(context),
                                        ),
                                        style: _theme.textTheme.labelLarge
                                            ?.copyWith(
                                          color: _theme.primaryColor,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 20),

                                  // Submit Button
                                  SizedBox(
                                    width: double.maxFinite,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: const Text('Sign In'),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Cover Image
            if (_desktopView)
              Container(
                constraints: BoxConstraints(
                  maxWidth: _screenWidth * 0.55,
                  maxHeight: double.maxFinite,
                ),
                decoration: BoxDecoration(
                  color: _theme.colorScheme.tertiaryContainer,
                ),
                child: getImageType(
                  AcnooStaticImage.signInCover,
                  fit: BoxFit.contain,
                  height: double.maxFinite,
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _handleForgotPassword(BuildContext context) async {
    final _result = await showDialog(
      context: context,
      builder: (context) {
        return const ForgotPasswordDialog();
      },
    );
    devLogger(_result.toString());
  }
}

class ForgotPasswordDialog extends StatelessWidget {
  const ForgotPasswordDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Dialog(
        insetPadding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 520),
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 34),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Forgot Password?',
                  style: _theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Enter your email, we will send you a link to Reset your password',
                  style: _theme.textTheme.bodyLarge?.copyWith(),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                TextFieldLabelWrapper(
                  labelText: 'Email',
                  inputField: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Enter your email address',
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Send'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
