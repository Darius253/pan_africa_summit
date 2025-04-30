import 'package:flutter/material.dart';
import 'package:pan_african_ai_summit/ui/home_screens/about_us_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          //About Us
          _buildSettingsTile(
            theme,
            "About Us",
            "About the Pan-African AI Summit",
            Icons.info,
            theme.colorScheme.onSurface,
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AboutUsPage()),
            ),
          ),

          //Privacy Policy
          _buildSettingsTile(
            theme,
            "Privacy Policy",
            "Read our privacy policy",
            Icons.privacy_tip,
            theme.colorScheme.onSurface,
            () {
              // Handle privacy policy action
            },
          ),

          //Contact Developer
          _buildSettingsTile(
            theme,
            "Contact Developer",
            "",
            Icons.contact_mail,
            theme.colorScheme.onSurface,
            () {
              // Handle contact developer action
            },
          ),

          //Logout
          _buildSettingsTile(
            theme,
            "Logout",
            "Logout from the app",
            Icons.logout_sharp,
            theme.colorScheme.error,
            () {
              // Handle logout action
            },
          ),

          //Delete Account
          _buildSettingsTile(
            theme,
            "Delete Account",
            "Remove your account from our system",
            Icons.delete,
            theme.colorScheme.error,
            () {
              // Handle delete account action
            },
          ),
        ],
      ),
    );
  }
}

Widget _buildSettingsTile(
  ThemeData theme,
  String title,
  String subtitle,
  IconData icon,
  Color color,
  Function()? onTap,
) {
  return ListTile(
    contentPadding: const EdgeInsets.all(0),
    title: Text(
      title,
      style: theme.textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.bold,
        color: color,
      ),
    ),
    subtitle: Text(
      subtitle,
      style: theme.textTheme.bodyMedium?.copyWith(
        color: color.withValues(alpha: 0.7),
      ),
    ),
    trailing: Icon(icon, color: color),
    onTap: onTap,
  );
}
