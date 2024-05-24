import 'package:flutter/material.dart';
import 'package:beritapps/screen/ResetPassword.dart';
import 'package:beritapps/screen/SignUp.dart';
import 'package:beritapps/theme.dart';
import 'package:beritapps/widget/LoginForm.dart';
import 'package:beritapps/widget/LoginOption.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: kDefaultPadding,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 120,
              ),
              Image(
                height: 150,
                width: 150,
                image: AssetImage('assets/images/icon2.png'),
              ),
              Text(
                'Welcome Back',
                style: titleText,
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Masuk sistem atau',
                    style: TextStyle(
                      color: kBlackColor,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'buat akun baru',
                      style: subTitle.copyWith(
                        decoration: TextDecoration.underline,
                        color: kBlackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        decorationThickness: 1,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              LoginForm(),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResetPasswordScreen()));
                },
                child: Text(
                  'Forgot password?',
                  style: TextStyle(
                    color: kZambeziColor,
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                    decorationThickness: 1,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Atau login dengan',
                style: TextStyle(
                  color: kBlackColor,
                  fontSize: 12,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              LoginOption(),
            ],
          ),
        ),
      ),
    );
  }
}
