import 'package:flutter/material.dart';
import 'package:beritapps/screen/HomePageScreen.dart';
import 'package:beritapps/screen/ResetPassword.dart';
import 'package:beritapps/theme.dart';
import 'package:beritapps/widget/primaryButton.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _isObscure = true;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  int _loginAttempts = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildInputForm('Username', _usernameController, false),
        buildInputForm('Password', _passwordController, true),
        SizedBox(
          height: 20,
        ),
        PrimaryButton(
          onPressed: () {
            _handleLogin();
          },
          buttonText: 'Masuk',
        ),
      ],
    );
  }

  Padding buildInputForm(
      String label, TextEditingController controller, bool pass) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: controller,
        obscureText: pass ? _isObscure : false,
        decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(
              color: kTextFieldColor,
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor),
            ),
            suffixIcon: pass
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                    icon: Icon(
                      _isObscure ? Icons.visibility_off : Icons.visibility,
                      color: kPrimaryColor,
                    ),
                  )
                : null),
      ),
    );
  }

  void _handleLogin() {
    // Replace the hardcoded values with your authentication logic
    String hardcodedUsername = 'user';
    String hardcodedPassword = 'password';

    if (_usernameController.text == hardcodedUsername &&
        _passwordController.text == hardcodedPassword) {
      // Successful login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      // Incorrect credentials
      _loginAttempts++;

      if (_loginAttempts < 3) {
        _showErrorDialog('Username atau password salah!');
      } else {
        _showResetPasswordDialog();
      }
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Login Gagal!'),
          content: Text(
            message,
            style: TextStyle(fontSize: 14),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Ya'),
            ),
          ],
        );
      },
    );
  }

  void _showResetPasswordDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Reset Password'),
          content: Text(
            'Anda telah melampaui upaya login maksimum. Apakah Anda ingin mengatur ulang password Anda?',
            style: TextStyle(fontSize: 14),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Logika reset password dapat ditambahkan di sini
                _resetPassword();
              },
              child: Text('Ya'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _resetLoginAttempts();
              },
              child: Text('Tidak'),
            ),
          ],
        );
      },
    );
  }

  void _resetPassword() {
    // Logika reset password dapat ditambahkan di sini
    // Contoh: Navigasi ke halaman reset password
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => ResetPasswordScreen()),
    );
  }

  void _resetLoginAttempts() {
    setState(() {
      _loginAttempts = 0;
    });
  }
}
