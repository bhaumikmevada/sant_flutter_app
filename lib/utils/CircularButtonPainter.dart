import 'package:flutter/material.dart';

class CircularButtonPainter extends StatelessWidget {
  final Color outerColor; 
  final Color innerColor;
  final double size;
  Widget child;

  CircularButtonPainter({
    super.key,
    required this.outerColor,
    required this.innerColor,
    this.size = 48.0,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Outer layer (largest circle)
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: outerColor,
            ),

          ),
          
          Padding(
            padding: const EdgeInsets.all(2.0), // Matches android:bottom="2dp" etc.
            child: Container(
              width: size - 4, // Adjust for padding
              height: size - 4,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: innerColor,
              ),
            ),
          ),
          // Inner layer (smallest circle with padding)
          Padding(
            padding: const EdgeInsets.all(6.0), // Matches android:bottom="6dp" etc.
            child: Container(
              width: size - 12, // Adjust for padding
              height: size - 12,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: outerColor,
              ),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}