import 'package:flutter/material.dart';

class AdBox extends StatefulWidget {
  @override
  _AdBoxState createState() => _AdBoxState();
}

class _AdBoxState extends State<AdBox> {
  final List<String> adImages = [
    'lib/assets/ad-1.png',
    'lib/assets/ad-2.png',
    'lib/assets/ad-3.png',
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200, // Adjust the height as needed
        child: PageView.builder(
          itemCount: adImages.length,
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Handle the tap on the ad if needed
              },
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(adImages[index]),
                    fit: BoxFit.cover,
                  ),
                ),
                width: MediaQuery.of(context).size.width,
              ),
            );
          },
        ),
      ),
    );
  }
}
