import 'package:flutter/material.dart';
import 'package:pan_african_ai_summit/ui/home_screens/about_us_page.dart';
import 'package:url_launcher/url_launcher.dart';

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
            null,
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
            null,
          ),

          //Contact Developer
          _buildSettingsTile(
            theme,
            "Contact Developer",
            "",
            Icons.contact_mail,
            theme.colorScheme.onSurface,
            () {
              _showContactDevelopeBottomrSheet(context, theme);
            },
            null,
          ),
          _buildSettingsTile(
            theme,
            "Email Us",
            "Get in touch with us",
            Icons.email,
            theme.colorScheme.onSurface,
            () {
              _launchUrl(
                "mailto:info@panafricanaisummit.com?subject=Enquiry%20About%20The%20Summit&body=Dear%20Team,",
              );
            },
            null,
          ),

          _buildSettingsTile(
            theme,
            "Share App",
            "Share the app with others",
            Icons.adaptive.share,
            theme.colorScheme.onSurface,
            () {},
            null,
          ),

          //Logout
          _buildSettingsTile(
            theme,
            "Logout",
            "Logout from the app",
            Icons.logout_sharp,
            theme.colorScheme.error,
            () {
              _alertPopUp(
                context,
                theme,
                "Logout?",
                "Are you sure you want to logout? You will need to login again to access your account.",
                () {
                  // Handle logout action
                },
              );
            },
            null,
          ),

          //Delete Account
          _buildSettingsTile(
            theme,
            "Delete Account",
            "Remove your account from our system",
            Icons.delete,
            theme.colorScheme.error,
            () {
              _alertPopUp(
                context,
                theme,
                "Delete Account?",
                "Are you sure you want to delete your account? This action cannot be undone.",
                () {
                  // Handle delete account action
                },
              );
            },
            null,
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
  Widget? trailing,
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
    trailing: trailing ?? Icon(icon, color: color),
    onTap: onTap,
  );
}

Future<void> _showContactDevelopeBottomrSheet(
  BuildContext context,
  ThemeData theme,
) {
  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    showDragHandle: true,
    isDismissible: true,
    enableDrag: true,
    isScrollControlled: true,
    barrierColor: theme.colorScheme.primary.withValues(alpha: 0.5),

    builder:
        (_) => Container(
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 20,
              children: [
                _buildSettingsTile(
                  theme,
                  "Contact via LinkedIn",
                  "Connect on LinkedIn",
                  Icons.link,
                  theme.colorScheme.onSurface,
                  () {
                    _launchUrl(
                      "https://www.linkedin.com/in/twumasi-ankrah-darius/",
                    );
                  },
                  Image.asset(
                    "assets/images/linkedin.png",
                    height: 30,
                    width: 30,
                  ),
                ),

                _buildSettingsTile(
                  theme,
                  "Contact via Email",
                  "Email Developer",
                  Icons.email,
                  theme.colorScheme.onSurface,
                  () {
                    _launchUrl(
                      "mailto:trondarius13@gmail.com?subject=Feedback&body=Dear%20Darius,",
                    );
                  },
                  null,
                ),
              ],
            ),
          ),
        ),
  );
}

Future<void> _alertPopUp(
  BuildContext context,
  ThemeData theme,
  String title,
  String content,
  Function() onPressed,
) {
  return showAdaptiveDialog(
    context: context,
    barrierColor: theme.colorScheme.primary.withValues(alpha: 0.5),
    builder:
        (_) => AlertDialog.adaptive(
          backgroundColor: theme.colorScheme.surface,
          title: Text(
            title,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.error,
            ),
          ),
          content: Text(
            content,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => onPressed(),
              child: Text(
                "Yes",
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.error,
                ),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                "No",
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ),
          ],
        ),
  );
}

Future<void> _launchUrl(String url) async {
  if (!await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
    throw 'Could not launch $url';
  }
}
