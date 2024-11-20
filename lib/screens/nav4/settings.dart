import 'package:flutter/material.dart';
import '../login_screen.dart';
import 'edit_profile.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isPushNotificationsEnabled = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: const Icon(Icons.arrow_back),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            const SectionTitle(title: 'Account'),
            SettingsItem(
              icon: Icons.person,
              title: 'Edit Profile',
              onTap: () {
                // Navigate to the EditProfilePage when clicked
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        const ProfileEditPage(), // Ensure EditProfilePage is imported
                  ),
                );
              },
            ),
            const SettingsItem(icon: Icons.security, title: 'Security'),
            const SettingsItem(
                icon: Icons.notifications, title: 'Notifications'),
            const SettingsItem(icon: Icons.privacy_tip, title: 'Privacy'),
            const SectionTitle(title: 'Support & About'),
            const SettingsItem(
                icon: Icons.subscriptions, title: 'My Subscription'),
            const SettingsItem(icon: Icons.help, title: 'Help & Support'),
            const SettingsItem(icon: Icons.policy, title: 'Terms and Policies'),
            const SectionTitle(title: 'Preferences'),
            SwitchListTile(
              title: const Text('Push Notifications'),
              value:
                  _isPushNotificationsEnabled, // Dynamically change based on state
              onChanged: (value) {
                setState(() {
                  _isPushNotificationsEnabled =
                      value; // Update state when switch is toggled
                });
              },
              secondary: const Icon(Icons.notifications),
              activeColor: Colors.green, // Set the active color to green
            ),
            const SectionTitle(title: 'Actions'),
            const SettingsItem(
                icon: Icons.report_problem, title: 'Report a problem'),
            const SettingsItem(icon: Icons.add, title: 'Add account'),
            SettingsItem(
              icon: Icons.logout,
              title: 'Log out',
              onTap: () {
                // Navigate to the homepage (or login page if that's your first screen)
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) =>
                        const LoginScreen(), // Ensure HomePage is imported
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class SettingsItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  const SettingsItem({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }
}
