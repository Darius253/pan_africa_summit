import 'package:flutter/material.dart';
import 'package:pan_african_ai_summit/ui/utils/snack_bar.dart';
import 'package:pan_african_ai_summit/ui/home_screens/about_us_page.dart';
import 'package:pan_african_ai_summit/ui/utils/system_alerts.dart';
import 'package:pan_african_ai_summit/ui/onboarding_screens/authentication/authentication_view_model.dart';
import 'package:pan_african_ai_summit/ui/onboarding_screens/onboarding_screen.dart';
import 'package:pan_african_ai_summit/ui/utils/loading.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final AuthenticationViewModel viewModal = AuthenticationViewModel();
    final SystemAlerts systemAlerts = SystemAlerts();
    final id = DateTime.now().millisecondsSinceEpoch % 100000;

    return Scaffold(
      body: ListenableBuilder(
        listenable: viewModal,
        builder: (context, _) {
          if (viewModal.isLoading) {
            return const Loading();
          }
          if (viewModal.errorMessage != null) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              CustomSnackBar.show(
                context,
                viewModal.errorMessage!,
                isError: true,
              );
            });
          }

          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              //About Us
              _buildSettingsTile(
                theme: theme,
                title: "About Us",
                subtitle: "About the Pan-African AI Summit",
                icon: Icons.info,
                color: theme.colorScheme.onSurface,
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AboutUsPage()),
                    ),
              ),

              //Privacy Policy
              _buildSettingsTile(
                theme: theme,
                title: "Privacy Policy",
                subtitle: "Read our privacy policy",
                icon: Icons.privacy_tip,
                color: theme.colorScheme.onSurface,
                onTap: () {
                  // Handle privacy policy action
                },
              ),

              //Contact Developer
              _buildSettingsTile(
                theme: theme,
                title: "Contact Developer",
                subtitle: "",
                icon: Icons.contact_mail,
                color: theme.colorScheme.onSurface,
                onTap: () {
                  _showContactDevelopeBottomrSheet(context, theme);
                },
              ),
              _buildSettingsTile(
                theme: theme,
                title: "Email Us",
                subtitle: "Get in touch with us",
                icon: Icons.email,
                color: theme.colorScheme.onSurface,
                onTap:
                    () => _launchUrl(
                      "mailto:info@panafricanaisummit.com?subject=Enquiry%20About%20The%20Summit&body=Dear%20Team,",
                    ),
              ),

              _buildSettingsTile(
                theme: theme,
                title: "Share App",
                subtitle: "Share the app with others",
                icon: Icons.adaptive.share,
                color: theme.colorScheme.onSurface,
                onTap: () {},
              ),

              _buildSettingsTile(
                theme: theme,
                title: "Push Notifications",
                subtitle:
                    "Allow push notifications to receive important updates",
                icon: Icons.notifications_active,
                color: theme.colorScheme.onSurface,
                onTap: () {
                  systemAlerts.sendNotification(
                    context: context,
                    title: "PAAIS",
                    body: "Push Notifications Enabled",
                    theme: theme,
                  );
                },
              ),

              //Logout
              _buildSettingsTile(
                theme: theme,
                title: "Logout",
                subtitle: "Logout from the app",
                icon: Icons.logout_sharp,
                color: theme.colorScheme.error,
                onTap: () {
                  systemAlerts.showAlertPopUp(
                    context: context,
                    theme: theme,
                    title: "Logout?",
                    content:
                        "Are you sure you want to logout? You will need to login again to access your account.",
                    onPressed: () async {
                      await viewModal.signOut();
                      if (viewModal.isSignedOut) {
                        if (context.mounted) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const OnBoardingScreen(),
                            ),
                          );
                          CustomSnackBar.show(context, "Logout Successful");
                        }
                      }
                    },
                  );
                  systemAlerts.cancelNotification(id);
                },
              ),

              //Delete Account
              _buildSettingsTile(
                theme: theme,
                title: "Delete Account",
                subtitle: "Remove your account from our system",
                icon: Icons.delete,
                color: theme.colorScheme.error,
                onTap: () {
                  systemAlerts.showAlertPopUp(
                    context: context,
                    theme: theme,
                    title: "Delete Account?",
                    content:
                        "Are you sure you want to delete your account? This action cannot be undone.",

                    onPressed: () {
                      systemAlerts.cancelNotification(id);
                    },
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

Widget _buildSettingsTile({
  required ThemeData theme,
  required String title,
  required String subtitle,
  required IconData? icon,
  required Color color,
  Function()? onTap,
  Widget? trailing,
}) {
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
                  theme: theme,
                  title: "Contact via LinkedIn",
                  subtitle: "Connect on LinkedIn",
                  icon: Icons.link,
                  color: theme.colorScheme.onSurface,
                  onTap:
                      () => _launchUrl(
                        "https://www.linkedin.com/in/twumasi-ankrah-darius/",
                      ),
                  trailing: Image.asset(
                    "assets/images/linkedin.png",
                    height: 30,
                    width: 30,
                  ),
                ),

                _buildSettingsTile(
                  theme: theme,
                  title: "Contact via Email",
                  subtitle: "Email Developer",
                  icon: Icons.email,
                  color: theme.colorScheme.onSurface,
                  onTap:
                      () => _launchUrl(
                        "mailto:trondarius13@gmail.com?subject=Feedback&body=Dear%20Darius,",
                      ),
                ),
              ],
            ),
          ),
        ),
  );
}

Future<void> _launchUrl(String url) async {
  if (!await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
    throw 'Could not launch $url';
  }
}
