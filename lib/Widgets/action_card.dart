import 'package:flutter/material.dart';

class ActionCard extends StatelessWidget {
  final String label;
  final String description;
  final IconData icon;
  final Color background;
  final VoidCallback? onTap; 

  const ActionCard({
    Key? key,
    required this.label,
    required this.description,
    required this.icon,
    required this.background,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 32),
            const SizedBox(height: 12),
            Text(label, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 4),
            Text(description, style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
