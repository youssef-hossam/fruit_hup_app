import 'package:flutter/material.dart';
import 'package:fruit_hub_app/core/utils/app_colors.dart';

class QuantityButton extends StatelessWidget {
  const QuantityButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.filled = true,
    this.size = 36,
  });

  final IconData icon;
  final VoidCallback onTap;
  final bool filled;
  final double size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(size),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: filled ? AppColors.green1500 : const Color(0xffF3F5F7),
        ),
        child: Icon(icon,
            size: size * 0.5,
            color: filled ? Colors.white : AppColors.grayscale400),
      ),
    );
  }
}

class QuantityStepper extends StatelessWidget {
  const QuantityStepper({
    super.key,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
    this.size = 36,
  });

  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        QuantityButton(icon: Icons.add, onTap: onIncrement, size: size),
        SizedBox(
          width: size * 1.1,
          child: Text(
            '$quantity',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: size * 0.45,
                fontWeight: FontWeight.w700,
                color: AppColors.grayscale950),
          ),
        ),
        QuantityButton(
            icon: Icons.remove, onTap: onDecrement, filled: false, size: size),
      ],
    );
  }
}
