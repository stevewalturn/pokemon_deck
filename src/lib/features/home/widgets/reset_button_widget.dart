import 'package:flutter/material.dart';
import 'package:pokemon_deck/ui/common/app_colors.dart';

class ResetButtonWidget extends StatelessWidget {
  final VoidCallback onReset;

  const ResetButtonWidget({
    required this.onReset,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onReset,
      style: ElevatedButton.styleFrom(
        backgroundColor: kcResetButtonColor,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      icon: const Icon(
        Icons.refresh,
        color: Colors.white,
        size: 24,
      ),
      label: const Text(
        'Reset Deck',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
