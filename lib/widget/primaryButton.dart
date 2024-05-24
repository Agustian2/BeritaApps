import 'package:flutter/material.dart';
import 'package:beritapps/theme.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const PrimaryButton({
    required this.onPressed,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        minimumSize:
            Size(double.infinity, MediaQuery.of(context).size.height * 0.08),
        backgroundColor: kPrimaryColor,
      ),
      child: Text(
        buttonText,
        style: textButton.copyWith(color: kWhiteColor),
      ),
    );
  }
}
