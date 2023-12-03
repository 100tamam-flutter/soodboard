import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:soodboard/src/components/animated_sliver_list_view.dart';
import 'package:soodboard/src/modules/login/components/send_reset_link_button.dart';
import 'package:soodboard/src/modules/login/components/text_field_component.dart';

import '../providers/forgot_password_provider.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ForgotPasswordProvider(context),
      child: const _ForgotPasswordPage(),
    );
  }
}

class _ForgotPasswordPage extends StatelessWidget {
  const _ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final staticProvider = context.read<ForgotPasswordProvider>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomScrollView(
          key: UniqueKey(),
          slivers: [
            AnimatedSliverListView(
              transitionType: TransitionType.slide,
              delay: const Duration(milliseconds: 100),
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 68,
                    ),
                    SvgPicture.asset('assets/icons/login.svg'),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Don\'t worry, it happens to the best of us.',
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: const Color(0xFF9098B1),
                            letterSpacing: 0.5,
                          ),
                    ),
                  ],
                ),
                const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 16,
                    ),
                    TextFieldComponent(
                      title: 'Enter your email address',
                      icon: 'assets/icons/email.svg',
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    SendResetLinkButton(),
                    SizedBox(
                      height: 21,
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: staticProvider.goToLoginPage,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Remember your password? Sign In instead.',
                            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                  color: const Color(0xFF40BFFF),
                                  letterSpacing: 0.5,
                                ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don’t have a account?',
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: const Color(0xFF9098B1),
                                letterSpacing: 0.5,
                              ),
                        ),
                        InkWell(
                          onTap: staticProvider.goToRegisterPage,
                          child: Text(
                            ' Register',
                            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                  color: const Color(0xFF40BFFF),
                                  letterSpacing: 0.5,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
