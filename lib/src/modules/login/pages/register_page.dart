import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:soodboard/src/components/animated_sliver_list_view.dart';
import 'package:soodboard/src/modules/login/components/secure_text_field_component.dart';
import 'package:soodboard/src/modules/login/components/signIn_component.dart';
import 'package:soodboard/src/modules/login/components/text_field_component.dart';
import 'package:soodboard/src/modules/login/providers/register_provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RegisterProvider(context),
      child: const _RegisterPage(),
    );
  }
}

class _RegisterPage extends StatelessWidget {
  const _RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final staticProvider = context.read<RegisterProvider>();
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
                    const Text(
                      'Let’s Get Started',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        letterSpacing: 0.5,
                        color: Color(0xFF223263),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Create an new account',
                      textAlign: TextAlign.center,
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
                      height: 28,
                    ),
                    TextFieldComponent(
                      title: 'Full Name',
                      icon: 'assets/icons/person.svg',
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextFieldComponent(
                      title: 'Your Email',
                      icon: 'assets/icons/email.svg',
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    SecureTextFieldComponent(
                      title: 'Password',
                      icon: 'assets/icons/passphrase.svg',
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    SecureTextFieldComponent(
                      title: 'Password Again',
                      icon: 'assets/icons/passphrase.svg',
                    ),
                    SizedBox(
                      height: 16,
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SignInButtonComponent(),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Have a account?',
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: const Color(0xFF9098B1),
                                letterSpacing: 0.5,
                              ),
                        ),
                        InkWell(
                          onTap: staticProvider.goToLoginPage,
                          child: Text(
                            ' Sign in',
                            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                  color: const Color(0xFF40BFFF),
                                  letterSpacing: 0.5,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
