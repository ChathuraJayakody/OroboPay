import 'package:flutter/material.dart';
import '../models/country.dart';

class BalanceCard extends StatelessWidget {
  final Country country;
  const BalanceCard({required this.country, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final color = Colors.lightBlueAccent;

    return Container(
      padding: const EdgeInsets.only(left: 5),
      decoration: BoxDecoration(
        // color: color,
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
                style: 
                TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w900),
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
                      DropdownMenuItem(value: 'GH', child: Text('GHS',style: TextStyle(color: Colors.blueGrey),)),
                      DropdownMenuItem(value: 'US', child: Text('USD', style: TextStyle(color: Colors.blueGrey),)),
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
