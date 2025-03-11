import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weaver/components/buttons.dart';
import 'package:weaver/components/forms.dart';
import 'package:weaver/providers/user_notifier.dart';
import 'package:weaver/theme.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController repeatPasswordController =
        TextEditingController();
    final formKey = GlobalKey<FormState>();

    bool isLoading = false;

    Future<void> handleSignUp() async {
      setState(() {
        isLoading = true;
      });
      try {
        await ref.read(userNotifierProvider.notifier).signUp(
              emailController.text,
              nameController.text,
              usernameController.text,
              passwordController.text,
            );
        await Navigator.pushNamedAndRemoveUntil(
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
      resizeToAvoidBottomInset: false,
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
                'Create an Account',
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
                label: 'Name',
                hint: 'John Doe',
                icon: Icons.person,
                controller: nameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Name cannot be empty';
                  }
                  return null;
                },
                isObscurable: false,
              ),
              CustomFormField(
                label: 'Username',
                hint: 'jodoe',
                icon: Icons.person,
                controller: usernameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Username cannot be empty';
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
              CustomFormField(
                label: 'Repeat Password',
                hint: '@JohnDoe123.',
                icon: Icons.lock_rounded,
                controller: repeatPasswordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Password cannot be empty';
                  }
                  if (value != passwordController.text) {
                    return 'Password does not match';
                  }
                  return null;
                },
                isObscurable: true,
              ),
              const SizedBox(
                height: 20,
              ),
              FilledButtonStateful(
                buttonText: 'Sign Up',
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    handleSignUp();
                  }
                },
                isLoading: isLoading,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: primaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: semibold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/sign_in');
                    },
                    child: Text(
                      'Sign In',
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
