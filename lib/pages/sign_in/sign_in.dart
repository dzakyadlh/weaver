import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weaver/components/buttons.dart';
import 'package:weaver/components/forms.dart';
import 'package:weaver/providers/user_notifier.dart';
import 'package:weaver/theme.dart';

class SignIn extends ConsumerStatefulWidget {
  const SignIn({super.key});

  @override
  ConsumerState<SignIn> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    bool isLoading = false;

    Future<void> handleSignIn() async {
      setState(() {
        isLoading = true;
      });
      try {
        await ref
            .read(userNotifierProvider.notifier)
            .signIn(emailController.text, passwordController.text);
        Navigator.pushNamedAndRemoveUntil(
            context, '/dashboard', (route) => false);
      } catch (e) {
        SnackBar(
            content: Text(
          e.toString(),
          style: errorTextStyle,
        ));
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    }

    return Scaffold(
      backgroundColor: backgroundPrimaryColor,
      body: SafeArea(
          child: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sign In',
                style: primaryTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: bold,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              CustomFormField(
                label: 'Email Address',
                hint: 'example@gmail.com',
                icon: Icons.email,
                controller: emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Email cannot be empty';
                  }
                  if (!value.contains('@')) {
                    return 'Email is not valid';
                  }
                  return null;
                },
                isObscurable: false,
              ),
              CustomFormField(
                label: 'Password',
                hint: '@JohnDoe123.',
                icon: Icons.lock_rounded,
                controller: passwordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Password cannot be empty';
                  }
                  if (value.length < 8) {
                    return 'Password must be at least 8 characters';
                  }
                  return null;
                },
                isObscurable: true,
              ),
              const SizedBox(
                height: 20,
              ),
              FilledButtonStateful(
                buttonText: 'Sign In',
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    handleSignIn();
                  }
                },
                isLoading: isLoading,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account? ',
                    style: primaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: semibold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/sign_up');
                    },
                    child: Text(
                      'Sign Up',
                      style: secondaryTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: semibold,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
