import 'package:flutter/material.dart';

class CircleIcon extends StatelessWidget {
  const CircleIcon({
    super.key,
    required this.icon,
    this.onPressed ,
  });

  final IconData icon;
  final VoidCallback? onPressed ;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30.0,
      height: 30.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.green.shade500,
      ),
      child: IconButton(
        onPressed: onPressed,
        iconSize: 20,
        padding: EdgeInsets.zero,
        icon: Icon(icon ,color: Colors.white,),
        color: Colors.white,
      ),
    );
  }
}
