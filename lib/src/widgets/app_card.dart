import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
    required this.height,
    this.color,
  });

  final Widget child;
  final double height;
  final MaterialColor? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: height,
      decoration: BoxDecoration(
        color: color != null ? null : Colors.white,
        gradient: color == null
            ? null
            : LinearGradient(colors: [color!.shade300, color!.shade500]),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.3),
            blurRadius: 60,
          ),
        ],
      ),
      child: child,
    );
  }
}
