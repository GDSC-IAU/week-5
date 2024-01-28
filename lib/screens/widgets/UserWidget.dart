// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/screens/profile_screen.dart';

class UserWidget extends StatelessWidget {
   const UserWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF618264),
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
            child: Image.asset(
              'lib/assets/account.png',
              width: 100,
              height: 100,
            ),
          ),
          const SizedBox(width: 8.0), // Add some spacing between the button and text
          Text(
            'Welcome',
            textAlign: TextAlign.left,
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
