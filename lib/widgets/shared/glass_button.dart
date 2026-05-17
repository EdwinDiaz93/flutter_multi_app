import 'dart:ui';

import 'package:flutter/material.dart';

class GlassButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  const GlassButton({super.key, required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      enableFeedback: true,
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(50),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: .15),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withValues(alpha: .2)),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
