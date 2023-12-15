import 'package:flutter/material.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({Key? key, required this.icon}) : super(key: key);
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: IconButton(
              icon: Icon(
                icon,
                color: Colors.white,
                size: 24,
              ),
              onPressed: () {}),
        ),
      ),
    );
  }
}
