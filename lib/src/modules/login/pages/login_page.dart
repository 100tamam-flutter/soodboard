import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:soodboard/src/modules/login/components/logIn_component.dart';
import 'package:soodboard/src/modules/login/components/secure_text_field_component.dart';
import 'package:soodboard/src/modules/login/components/signIn_component.dart';
import 'package:soodboard/src/modules/login/components/text_field_component.dart';
import 'package:soodboard/src/modules/login/providers/login_provider.dart';
import 'package:vrouter/vrouter.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginProvider(context),
      child: const _LoginPage(),
    );
  }
}

class _LoginPage extends StatelessWidget {
  const _LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final staticProvider = context.read<LoginProvider>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const SizedBox(
              height: 68,
            ),
            SvgPicture.asset('assets/icons/login.svg'),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Welcome to Soodboard',
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
              'Sign in to continue',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: const Color(0xFF9098B1),
                    letterSpacing: 0.5,
                  ),
            ),
            const SizedBox(
              height: 28,
            ),
            const TextFieldComponent(
              title: 'Your Email',
              icon: 'assets/icons/email.svg',
            ),
            const SizedBox(
              height: 8,
            ),
            const SecureTextFieldComponent(
              title: 'Password',
              icon: 'assets/icons/passphrase.svg',
            ),
            const SizedBox(
              height: 16,
            ),
            const SignInButtonComponent(),
            const SizedBox(
              height: 21,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width / 3,
                  color: const Color(0xFFEBF0FF),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Text(
                    "OR",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: const Color(0xFF9098B1),
                          letterSpacing: 0.7,
                        ),
                  ),
                ),
                Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width / 3,
                  color: const Color(0xFFEBF0FF),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const LogInButtonComponent(
              icon: 'assets/icons/google.svg',
              title: 'Login with Google',
            ),
            const SizedBox(
              height: 8,
            ),
            const LogInButtonComponent(
              icon: 'assets/icons/facebook.svg',
              title: 'Login with facebook',
            ),
            const SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () => context.vRouter.to('/'),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: staticProvider.goToForgotPasswordPage,
                    child: Text(
                      'Forgot Password?',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: const Color(0xFF40BFFF),
                            letterSpacing: 0.5,
                          ),
                    ),
                  )
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
                  onTap: () => context.vRouter.to('/'),
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
      ),
    );
  }
}
