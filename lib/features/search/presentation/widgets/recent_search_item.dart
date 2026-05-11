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
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: Text(
                query,
                style: const TextStyle(color: Colors.grey, fontSize: 16),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.close, size: 18, color: Colors.grey),
              onPressed: onRemove,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ],
        ),
      ),
    );
  }
}
