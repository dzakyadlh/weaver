import 'package:flutter/material.dart';
import 'package:weaver/components/buttons.dart';
import 'package:weaver/theme.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundPrimaryColor,
        body: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(defaultMargin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/ado.jpg',
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.width * 0.8,
                fit: BoxFit.fitWidth,
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                'Networking and sharing made easy',
                style: primaryTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Weaver helps you to connect with other people and expand your network',
                style: subtitleTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              FilledButtonStateless(
                buttonText: 'Sign In',
                onTap: () {
                  Navigator.pushNamed(context, '/sign_in');
                },
              ),
              OutlinedButtonStateless(
                buttonText: 'Create an Account',
                onTap: () {
                  Navigator.pushNamed(context, '/sign_up');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
