
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

// An enum makes the code cleaner and safer than using strings for roles.
enum UserRole { normalUser, farmer, researcher, policymaker }

class ProfessionPage extends StatefulWidget {
  const ProfessionPage({super.key});

  @override
  State<ProfessionPage> createState() => _ProfessionPageState();
}

class _ProfessionPageState extends State<ProfessionPage> {
  UserRole? _selectedRole;

  // Method to get the display name for a role
  String _getRoleName(UserRole role) {
    switch (role) {
      case UserRole.normalUser:
        return "Normal User";
      case UserRole.farmer:
        return "Farmer";
      case UserRole.researcher:
        return "Researcher";
      case UserRole.policymaker:
        return "Policy Maker";
    }
  }

  @override
  Widget build(BuildContext context) {
    // If no role is selected yet, show the selection grid.
    // Otherwise, show the content view for the selected role.
    return _selectedRole == null
        ? _buildRoleSelectionGrid()
        : _buildRoleContentView();
  }

  /// Builds the initial screen where the user selects their role.
  Scaffold _buildRoleSelectionGrid() {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Your Profile"),
        backgroundColor: const Color(0xFF0D47A1),
      ),
      // backgroundColor: const Color(0xFFF4F6F8),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        children: [
          _buildRoleCard(
            role: UserRole.normalUser,
            icon: Icons.person_outline,
            color: Colors.blue,
            description: "For citizens and household water users.",
          ),
          _buildRoleCard(
            role: UserRole.farmer,
            icon: MdiIcons.tractor,
            color: Colors.green,
            description: "Tools and guides for agricultural needs.",
          ),
          _buildRoleCard(
            role: UserRole.researcher,
            icon: MdiIcons.chartBellCurveCumulative,
            color: Colors.purple,
            description: "Access data, charts, and predictive models.",
          ),
          _buildRoleCard(
            role: UserRole.policymaker,
            icon: MdiIcons.gavel,
            color: Colors.orange,
            description: "Insights for governance and planning.",
          ),
        ],
      ),
    );
  }

  /// A reusable card widget for the role selection grid.
  Widget _buildRoleCard({
    required UserRole role,
    required IconData icon,
    required Color color,
    required String description,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () {
          setState(() {
            _selectedRole = role;
          });
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          // **FIX:** Wrapped Column with SingleChildScrollView to prevent overflow.
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 48, color: color),
                const SizedBox(height: 12),
                Text(
                  _getRoleName(role),
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(color: Colors.grey[600], fontSize: 13),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Builds the main content view after a role has been selected.
  Scaffold _buildRoleContentView() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D47A1),
        title: Text(_getRoleName(_selectedRole!)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            setState(() {
              _selectedRole = null; // Go back to the selection screen
            });
          },
        ),
      ),
      backgroundColor: const Color(0xFFF4F6F8),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // --- SHARED CONTENT (for all roles) ---
          _buildContentCard(
            icon: Icons.article_outlined,
            title: "Information & Guidelines",
            content: "Access guidelines tailored for a ${_getRoleName(_selectedRole!).toLowerCase()}.",
          ),
          _buildContentCard(
            icon: Icons.water_drop_outlined,
            title: "Effective Water Usage",
            content: "Learn best practices for water conservation and efficiency in your specific context.",
          ),
          _buildContentCard(
            icon: Icons.home_work_outlined,
            title: "Groundwater Recharge",
            content: "Explore methods like rainwater harvesting to improve local groundwater levels.",
          ),

          // --- CONDITIONAL CONTENT (for Researchers and Policy Makers) ---
          if (_selectedRole == UserRole.researcher || _selectedRole == UserRole.policymaker)
            _buildContentCard(
              icon: MdiIcons.tools,
              title: "Advanced Analytical Tools",
              content: "Access interactive charts, raw datasets, and AI-powered predictions.",
            ),

          // --- EXCLUSIVE CONTENT (only for Policy Makers) ---
          if (_selectedRole == UserRole.policymaker)
            _buildContentCard(
              icon: MdiIcons.accountGroupOutline,
              title: "Public Insights",
              content: "View aggregated reports, queries, and demands submitted by users to inform policy.",
            ),
        ],
      ),
      // **ADDITION:** Added a FloatingActionButton for the chatbot.
      // This will be visible for any selected role.
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Placeholder action: In a real app, you would navigate to a ChatbotPage.
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Opening chatbot..."),
              backgroundColor: Color(0xFF0D47A1),
            ),
          );
        },
        backgroundColor: const Color(0xFF0D47A1),
        child: const Icon(Icons.chat_bubble_outline, color: Colors.white),
        tooltip: 'Ask a question',
      ),
    );
  }

  /// A reusable card for displaying content sections.
  Widget _buildContentCard({required IconData icon, required String title, required String content}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Theme.of(context).primaryColor, size: 28),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const Divider(height: 20),
            Text(content, style: TextStyle(color: Colors.grey[700], height: 1.4)),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(onPressed: () {}, child: const Text("LEARN MORE")),
            )
          ],
        ),
      ),
    );
  }
}