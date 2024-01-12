
import 'package:flutter/material.dart';
import 'package:shopping_app/screens/widgets/UserWidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets/OrdersList.dart';
import './widgets/ContactList.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile';

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD0E7D2),
      appBar: AppBar(
       title: Center(
          child: Text(
            'Profile',
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: const Color(0xFF618264),
      ),
      body: 
       Padding(
        padding: const EdgeInsets.all(8.0),
        child:
         Column(
           children: [
             const UserWidget(),
            Text(
            'My Orders',
            style: GoogleFonts.lato(
              color: const Color(0xFF618264),
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
             const OrdersThreeButtonBoxes(),
             Text(
            'Contact US',
            style: GoogleFonts.lato(
              color: const Color(0xFF618264),
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
              const ContactThreeButtonBoxes(),
           ],
         ),
        
      ),
    );
  }
}
