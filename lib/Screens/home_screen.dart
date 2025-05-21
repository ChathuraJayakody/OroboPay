import 'package:flutter/material.dart';
import 'package:orobopay/Providers/settings_provider.dart';
import 'package:orobopay/Widgets/action_card.dart';
import 'package:orobopay/Widgets/balance_card.dart';
import 'package:orobopay/Widgets/favorite_avatar.dart';
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
            const SizedBox(height: 24),
            Text(
              'Here are some things you can do',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.4,
              children: [
                ActionCard(
                  label: 'Pay someone',
                  description: 'To wallet, bank or mobile number',
                  icon: Icons.arrow_forward,
                  background: const Color(0xFFF2EEFF),
                  onTap: () {
                    // Handle Pay Someone action
                  },
                ),
                ActionCard(
                  label: 'Request money',
                  description: 'Request money from OroboPay users',
                  icon: Icons.note_add_outlined,
                  background: const Color(0xFFEAFAF1),
                  onTap: () {
                    // Handle Request Money action
                  },
                ),
                ActionCard(
                  label: 'Buy airtime',
                  description: 'Top-up or send airtime across Africa',
                  icon: Icons.phone_android_outlined,
                  background: const Color(0xFFFFF8E1),
                  onTap: () {
                    // Handle Buy Airtime action
                  },
                ),
                ActionCard(
                  label: 'Pay bill',
                  description: 'Zero transaction fees when you pay',
                  icon: Icons.receipt_long_outlined,
                  background: const Color(0xFFF4F4F4),
                  onTap: () {
                    // Handle Pay Bill action
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              'Your favorite people',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  FavoriteAvatar(
                    icon: Icons.add,
                    label: 'Add',
                    countryFlag: null,
                    onTap: () {
                      // Handle Add Favorite
                    },
                  ),
                  const SizedBox(width: 16),
                  FavoriteAvatar(
                    imageUrl: 'https://i.pravatar.cc/150?img=32',
                    label: 'Grace L.',
                    countryFlag: 'assets/flags/gh.png',
                    onTap: () {
                      // Handle Grace L.
                    },
                  ),
                  const SizedBox(width: 16),
                  FavoriteAvatar(
                    label: 'Lawrence A.',
                    countryFlag: 'assets/flags/gh.png',
                    onTap: () {
                      // Handle Lawrence A.
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    return Scaffold();
  }
}
