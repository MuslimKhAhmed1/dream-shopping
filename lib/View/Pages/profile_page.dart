import 'package:dream_shopping/View/Pages/extrascreens/notification.dart';
import 'package:dream_shopping/View/Pages/extrascreens/orderHistory.dart';
import 'package:dream_shopping/View/Pages/extrascreens/rewardHistory.dart';
import 'package:dream_shopping/View/Pages/extrascreens/supplierAccount.dart';
import 'package:dream_shopping/View/Pages/order_page.dart';
import 'package:dream_shopping/Controller/themeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../generated/l10n.dart'; // Import the localization file

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).profileTitle, // Localized profile title
          style: TextStyle(
            color: themeProvider.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        backgroundColor: themeProvider.isDarkMode
            ? Colors.black
            : Color.fromARGB(255, 255, 251, 240),
        iconTheme: IconThemeData(
          color: themeProvider.isDarkMode ? Colors.white : Colors.black,
        ),
        elevation: 1,
      ),
      body: Column(
        children: [
          // Profile Header
          Container(
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
                color: themeProvider.isDarkMode
                    ? Colors.grey[900]
                    : Colors.grey[200],
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey.shade300,
                  child: Text(
                    'G',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: themeProvider.isDarkMode
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  'Guest',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color:
                        themeProvider.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ),

          // Options List
          Expanded(
            child: ListView(
              children: [
                // Dark Mode Toggle
                _buildListTile(
                  context,
                  icon: Icons.dark_mode,
                  title:
                      S.of(context).darkMode, // Localized text for "Dark Mode"
                  trailing: Switch(
                    value: themeProvider.isDarkMode,
                    onChanged: (value) {
                      themeProvider.toggleDarkMode(); // Update dark mode
                    },
                  ),
                ),

                // Language Selector
                _buildListTile(
                  context,
                  icon: Icons.language,
                  title:
                      S.of(context).language, // Localized text for "Language"
                  onTap: () {
                    _showLanguageDialog(context);
                  },
                ),

                // Notifications
                _buildListTile(context,
                    icon: Icons.notifications,
                    title: S.of(context).notifications, onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NotificationScreen(),
                      ));
                }),

                // Supplier Account Statement
                _buildListTile(context,
                    icon: Icons.account_balance_wallet,
                    title: S.of(context).supplierAccount, onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SupplierAccount(),
                      ));
                }),

                // Order History
                _buildListTile(context,
                    icon: Icons.history,
                    title: S.of(context).orderHistory, onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OrderdHistory(),
                      ));
                }),

                // Rewards History
                _buildListTile(
                  context,
                  icon: Icons.card_giftcard,
                  title: S.of(context).rewardsHistory,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RewardHistory(),
                        ));
                  },
                ),

                // Logout/Login
                _buildListTile(
                  context,
                  icon: Icons.login,
                  title: S.of(context).logout,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(BuildContext context,
      {required IconData icon,
      required String title,
      Widget? trailing,
      VoidCallback? onTap}) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return ListTile(
      leading: Icon(
        icon,
        color: themeProvider.isDarkMode ? Colors.white : Colors.black,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: themeProvider.isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      trailing: trailing ?? const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }

  // Language Selector Dialog
  void _showLanguageDialog(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor:
              themeProvider.isDarkMode ? Colors.black : Colors.white,
          title: Text(
            S
                .of(context)
                .selectLanguage, // Localized title for "Select Language"
            style: TextStyle(
              color: themeProvider.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _languageOption(context,
                  locale: Locale('en'),
                  title: 'English',
                  img:
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/d/de/Flag_of_the_United_States.png/1200px-Flag_of_the_United_States.png"),
              _languageOption(context,
                  locale: Locale('ku'),
                  title: 'Kurdish',
                  img:
                      "https://upload.wikimedia.org/wikipedia/commons/d/d2/Flag_of_Kurdistan.png"),
              _languageOption(context,
                  locale: Locale('ar'),
                  title: 'Arabic',
                  img:
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f6/Flag_of_Iraq.svg/1200px-Flag_of_Iraq.svg.png"),
            ],
          ),
        );
      },
    );
  }

  Widget _languageOption(BuildContext context,
      {required Locale locale, required String title, required String img}) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    return ListTile(
      leading: Image.network(
        img,
        height: 35,
        width: 45,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: themeProvider.isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      onTap: () {
        themeProvider.setLocale(locale); // Update locale
        Navigator.of(context).pop(); // Close the dialog
      },
    );
  }
}
