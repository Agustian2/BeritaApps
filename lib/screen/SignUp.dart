import 'package:flutter/material.dart';
import 'package:beritapps/screen/LoginScreen.dart';
import 'package:beritapps/theme.dart';
import 'package:beritapps/widget/CheckBox.dart';
import 'package:beritapps/widget/LoginOption.dart';
import 'package:beritapps/widget/SignUpForm.dart';
import 'package:beritapps/widget/primaryButton.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 70,
            ),
            Padding(
              padding: kDefaultPadding,
              child: Text(
                'Create Account',
                style: titleText,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: kDefaultPadding,
              child: Row(
                children: [
                  Text(
                    'Already a member?',
                    style: subTitle,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Text(
                      'Log In',
                      style: textButton.copyWith(
                        decoration: TextDecoration.underline,
                        decorationThickness: 1,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: kDefaultPadding,
              child: SignUpForm(),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: kDefaultPadding,
              child: CheckBox('Agree to terms and conditions.'),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: kDefaultPadding,
              child: CheckBox('I have at least 18 years old.'),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: kDefaultPadding,
              child: PrimaryButton(
                buttonText: 'Sign Up',
                onPressed: () {},
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: kDefaultPadding,
              child: Text(
                'Or log in with:',
                style: subTitle.copyWith(color: kBlackColor),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: kDefaultPadding,
              child: LoginOption(),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
