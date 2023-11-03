import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  const Button(
      {super.key, required this.buttonText, required this.buttonPress});
  final String buttonText;
  final Function() buttonPress;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255)),
      onPressed: buttonPress,
      child: Text(
        buttonText,
        style: GoogleFonts.poppins(
            fontWeight: FontWeight.normal, color: Colors.blue),
      ),
    );
  }
}
