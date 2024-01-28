import 'package:flutter/material.dart';

class ContactThreeButtonBoxes extends StatelessWidget {
  const ContactThreeButtonBoxes({Key? key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ContactButtonWithShadow(
          text: 'Email',
          icon: Icons.email,
          textStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF618264),
          ),
          iconColor: Color(0xFF618264),
        ),
        ContactButtonWithShadow(
          text: 'Phone',
          icon: Icons.phone,
          textStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF618264),
          ),
          iconColor: Color(0xFF618264),
        ),
        ContactButtonWithShadow(
          text: 'Chat',
          icon: Icons.chat,
          textStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF618264),
          ),
          iconColor: Color(0xFF618264),
        ),
      ],
    );
  }
}

class ContactButtonWithShadow extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final TextStyle? textStyle;
  final Color? iconColor;

  const ContactButtonWithShadow({
    Key? key,
    this.text,
    this.icon,
    this.textStyle,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95,
      height: 95,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 30,
            color: iconColor,
          ),
          const SizedBox(height: 8),
          Text(
            text ?? 'Button',
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
