import 'package:flutter/material.dart';

class CarInfoRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final MainAxisAlignment alignment;

  const CarInfoRow({
    super.key,
    required this.icon,
    required this.text,
    this.alignment = MainAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end, // Updated to end for this specific requirement
        children: [
          Icon(icon, size: 16, color: Colors.grey.shade400),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.grey.shade500, 
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
