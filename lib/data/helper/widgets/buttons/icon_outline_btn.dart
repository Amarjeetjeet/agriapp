import 'package:flutter/material.dart';

class IconOutlineButton extends StatelessWidget {
  const IconOutlineButton({
    super.key,
    required this.onTap,
    required this.icon,
  });

  final void Function()? onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton.outlined(
      style: buildIconOutlineStyleFrom(),
      onPressed: onTap,
      icon: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}

ButtonStyle buildIconOutlineStyleFrom() {
  return IconButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: Colors.white12,
    padding: const EdgeInsets.all(16.0),
    side: const BorderSide(width: 1.5, color: Colors.white),
  );
}
