import 'package:flutter/material.dart';
import 'package:beritapps/screen/LoginScreen.dart';
import 'package:beritapps/theme.dart';
import 'package:beritapps/widget/ResetForm.dart';
import 'package:beritapps/widget/primaryButton.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: kDefaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 250,
            ),
            Text(
              'Reset Password',
              style: titleText,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Please enter your email address',
              style: subTitle.copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            ResetForm(),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ));
                },
                child: PrimaryButton(
                  buttonText: 'Reset Password',
                  onPressed: () {},
                )),
          ],
        ),
      ),
    );
  }
}
