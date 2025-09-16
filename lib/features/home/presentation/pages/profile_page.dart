import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dwrl_project/features/auth/presentation/cubits/auth_cubit.dart'; // Your AuthCubit import

// To make this file runnable for testing, you can use this mock cubit.
// In your real app, you will use your actual AuthCubit.
// class AuthCubit extends Cubit<void> {
//   AuthCubit() : super(null);
//   void logout() => print('User logged out!');
// }

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        backgroundColor: const Color(0xFF0D47A1), // Consistent app bar color
      ),
      backgroundColor: const Color(0xFFF4F6F8), // Consistent background color
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileHeader(context),
            const SizedBox(height: 20),
            _buildInfoCard(
              title: "Contact Information",
              items: {
                Icons.email_outlined: "user.sharma@gov.in",
                Icons.phone_outlined: "+91 98765 43210",
              },
            ),
            const SizedBox(height: 16),
            _buildInfoCard(
              title: "Jurisdiction",
              items: {
                Icons.flag_outlined: "Maharashtra",
                Icons.location_city_outlined: "Pune",
                Icons.map_outlined: "Haveli Block",
              },
            ),
            const SizedBox(height: 16),
            _buildActionMenu(context),
          ],
        ),
      ),
    );
  }

  /// Builds the top header section with the user's picture and name.
  Widget _buildProfileHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24.0),
      decoration: const BoxDecoration(
        color: Color(0xFF0D47A1),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: const AssetImage('assets/img12.jpg'), // Your image asset
            backgroundColor: Colors.white,
          ),
          const SizedBox(height: 12),
          const Text(
            "A. K. Sharma",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "District Hydrogeologist",
            style: TextStyle(
              fontSize: 16,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }

  /// A reusable widget to create information cards.
  Widget _buildInfoCard({required String title, required Map<IconData, String> items}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(height: 20),
              // Create a ListTile for each item in the map
              ...items.entries.map((entry) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: [
                      Icon(entry.key, color: Colors.grey[600]),
                      const SizedBox(width: 16),
                      Text(
                        entry.value,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the menu for user actions like changing password and logging out.
  Widget _buildActionMenu(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.edit_outlined),
              title: const Text("Edit Profile"),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // TODO: Navigate to Edit Profile Page
              },
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.lock_outline),
              title: const Text("Change Password"),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // TODO: Navigate to Change Password Page
              },
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text("Logout", style: TextStyle(color: Colors.red)),
              onTap: () {
                // Access the AuthCubit and call the logout method
                context.read<AuthCubit>().logout();
              },
            ),
          ],
        ),
      ),
    );
  }
}