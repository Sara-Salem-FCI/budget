import 'package:budget/core/constants/app_styles.dart';
import 'package:flutter/material.dart';

class RecentSearchItem extends StatelessWidget {
  final String query;
  final VoidCallback onTap;
  final VoidCallback onRemove;

  const RecentSearchItem({
    super.key,
    required this.query,
    required this.onTap,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            const Icon(Icons.history, color: Colors.grey, size: 20),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                query,
                style: AppStyles.body1.copyWith(color: Colors.grey),
              ),
            ),
            IconButton(
              onPressed: onRemove,
              icon: const Icon(Icons.close, color: Colors.grey, size: 18),
            ),
          ],
        ),
      ),
    );
  }
}
