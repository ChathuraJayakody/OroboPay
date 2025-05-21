import 'package:flutter/material.dart';
import 'package:orobopay/Widgets/balance_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    final settings = context.watch<SettingsProvider>();

    final homeBody = SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            BalanceCard(country: settings.currencyCountry),
          ],
        ),
      ),
    );

    return Scaffold(

    );
  }
}