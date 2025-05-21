import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/balance_card.dart';
import '../widgets/action_card.dart';
import '../widgets/favorite_avatar.dart';
import '../providers/settings_provider.dart';
import '../providers/navigation_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final navProv = context.watch<NavigationProvider>();
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

    final screens = [
      homeBody,
      // This is to add the rest of the screens like wallet,scan,profiel and more
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Hi Ehi,', style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.blueGrey
                ),),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.notifications_outlined),
                iconSize: 38,
                onPressed: () {
                  // Handle Notification Tap
                },
              ),
              Positioned(
                right: 14,
                top: 14,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: screens[navProv.currentIndex],
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
