import 'package:flutter/material.dart';
import '../models/country.dart';

class BalanceCard extends StatelessWidget {
  final Country country;
  const BalanceCard({required this.country, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: color.primaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '1,234.00',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  ClipOval(
                    child: Image.asset(
                      country.flagAsset,
                      width: 24,
                      height: 24,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 8),
                  DropdownButton<String>(
                    value: country.code,
                    underline: const SizedBox.shrink(),
                    items: const [
                      DropdownMenuItem(value: 'GH', child: Text('GHS')),
                      DropdownMenuItem(value: 'US', child: Text('USD')),
                    ],
                    onChanged: (_) {},
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
