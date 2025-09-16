// import 'package:dwrl_project/features/auth/presentation/cubits/auth_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('jal vibhag'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.notifications),
//             onPressed: () {
//               final authCubit = context.read<AuthCubit>();
//               authCubit.logout();
//             },
//           ),
//         ],
//       ),
//       drawer: Drawer(
//         backgroundColor: Color.fromARGB(192, 102, 193, 193),
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//            DrawerHeader(
//   // decoration: BoxDecoration(color: Colors.white),
//   child: Center(
//     child: ClipOval(
//       child: Image.asset(
//         'assets/img12.jpg',
//         width: 100,  // set width
//         height: 100, // set height
//         fit: BoxFit.cover,
//       ),
//     ),
//   ),
// ),

//             ListTile(
//               leading: Icon(Icons.home),
//               title: Text(" H O M E "),
//               onTap: () {
//                 Navigator.pop(context);
//                 Navigator.pushNamed(context, '/home');
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.map_sharp),
//               title: Text(" M A P "),
//                 onTap: () {
//                 Navigator.pop(context);
//                 Navigator.pushNamed(context,  '/map');
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.filter_frames_rounded),
//               title: Text(" Farm help "),
//               onTap: () {
//                 Navigator.pop(context);
//                 Navigator.pushNamed(context,  '/farm');
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.location_on),
//               title: Text(" L O C A T I O N  "),
//               onTap: () {
//                 Navigator.pop(context);
//                 Navigator.pushNamed(context, '/loc');
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.person), 
//               title: Text("P R O F I L E"),
//               onTap: () {
//                 Navigator.pop(context);
//                 Navigator.pushNamed(context, '/profile');
//               },
//               ),
//             ListTile(
//               leading: Icon(Icons.settings),
//               title: Text("S E T T I N G S "),
//               onTap: () {
//                 Navigator.pop(context);
//                 Navigator.pushNamed(context, '/setting');
//               },
//             ),
//           ],
//         ),
//       ),
//       body: const Center(
//         child: Text('Welcome to the jal vibhag!'),
//       ),
//     );
//   }
// }     




import 'package:dwrl_project/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // AuthCubit can be accessed here if needed
    // final authCubit = context.read<AuthCubit>();

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Jal Vibhag'),
          backgroundColor: const Color(0xFF0D47A1), // Professional deep blue
          actions: [
            // A proper place for a notifications button
            IconButton(
              icon: const Icon(Icons.notifications_none_outlined),
              onPressed: () {
                // TODO: Navigate to a dedicated notifications screen
              },
            ),
          ],
          // The TabBar is integrated into the AppBar for a seamless look
          bottom: const TabBar(
            indicatorColor: Colors.yellowAccent,
            indicatorWeight: 3,
            tabs: [
              Tab(text: 'Notifications'),
              Tab(text: 'Schemes'),
              Tab(text: 'Advisories'),
            ],
          ),
        ),
        drawer: Drawer(
          // Using a slightly more subtle and professional color scheme
          backgroundColor: const Color(0xFFF4F6F8),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              // Upgraded to UserAccountsDrawerHeader for a better look
              UserAccountsDrawerHeader(
                accountName: const Text(
                  "A. K. Sharma", // Example User Name
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                accountEmail: const Text("user.sharma@gov.in"), // Example Email
                currentAccountPicture: ClipOval(
                  child: Image.asset(
                    'assets/img12.jpg', // Your existing image asset
                    fit: BoxFit.cover,
                  ),
                ),
                decoration: const BoxDecoration(
                  color: Color(0xFF0D47A1),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text("HOME"),
                onTap: () {
                  Navigator.pop(context);
                  // No need to navigate to the same page if already there
                  // Navigator.pushNamed(context, '/home');
                },
              ),
              ListTile(
                leading: const Icon(Icons.map_sharp),
                title: const Text("MAP"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/map');
                },
              ),
              ListTile(
                leading: const Icon(Icons.filter_frames_rounded),
                title: const Text("PROFESSION"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/profession');
                },
              ),
              ListTile(
                leading: const Icon(Icons.location_on),
                title: const Text("LOCATION"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/loc');
                },
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text("PROFILE"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/profile');
                },
              ),
              ListTile(
                leading: const Icon(Icons.report_problem),
                title: const Text("REPORT ISSUE"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/complaint');
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text("SETTINGS"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/setting');
                },
              ),
              const Divider(),
              // Logout button moved here for better UX
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: const Text("LOGOUT", style: TextStyle(color: Colors.red)),
                onTap: () {
                  final authCubit = context.read<AuthCubit>();
                  authCubit.logout();
                  // Navigator.pop(context) might not be needed if logout triggers navigation
                },
              ),
            ],
          ),
        ),
        // The body now contains the dynamic, tabbed content
        body: TabBarView(
          children: [
            _buildNotificationsList(),
            _buildSchemesList(),
            _buildAdvisoriesList(),
          ],
        ),
      ),
    );
  }

  // A generic list builder for different content types
  Widget _buildContentList(List<ContentItem> items) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          margin: const EdgeInsets.only(bottom: 16.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(item.icon, color: item.iconColor, size: 28),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        item.title,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  item.snippet,
                  style: TextStyle(color: Colors.grey[700], height: 1.4),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: item.iconColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        item.category,
                        style: TextStyle(
                          color: item.iconColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Text(
                      item.date,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Dummy data and list for Notifications
  Widget _buildNotificationsList() {
    final List<ContentItem> notificationItems = [
      ContentItem(
          icon: MdiIcons.bullhornVariantOutline,
          iconColor: Colors.orange.shade700,
          title: "New Guidelines for Groundwater Extraction",
          snippet:
              "The Central Ground Water Authority (CGWA) has issued revised guidelines for issuing No Objection Certificates (NOCs)...",
          category: "REGULATION",
          date: "Sep 15, 2025"),
      ContentItem(
          icon: MdiIcons.calendarAlert,
          iconColor: Colors.red.shade700,
          title: "Deadline Extended for Rainwater Harvesting",
          snippet:
              "The deadline for installing rainwater harvesting systems for all institutional buildings has been extended to Dec 31, 2025.",
          category: "COMPLIANCE",
          date: "Sep 12, 2025"),
    ];
    return _buildContentList(notificationItems);
  }

  // Dummy data and list for Schemes
  Widget _buildSchemesList() {
    final List<ContentItem> schemeItems = [
      ContentItem(
          icon: MdiIcons.waterPump,
          iconColor: Colors.blue.shade800,
          title: "Atal Bhujal Yojana (ATAL JAL)",
          snippet:
              "Participatory groundwater management scheme to improve practices in seven states. Check your eligibility and apply now.",
          category: "SCHEME",
          date: "Updated: Sep 10, 2025"),
      ContentItem(
          icon: MdiIcons.pipe,
          iconColor: Colors.green.shade700,
          title: "Jal Jeevan Mission (JJM)",
          snippet:
              "Learn about the mission to provide functional household tap connections to every rural household.",
          category: "MISSION",
          date: "Updated: Sep 5, 2025"),
    ];
    return _buildContentList(schemeItems);
  }

  // Dummy data and list for Advisories
  Widget _buildAdvisoriesList() {
    final List<ContentItem> advisoryItems = [
      ContentItem(
          icon: MdiIcons.sproutOutline,
          iconColor: Colors.teal.shade700,
          title: "Crop Advisory for Rabi Season in Pune District",
          snippet:
              "Farmers are advised to opt for less water-intensive crops like gram and millet due to below-average monsoon recharge...",
          category: "AGRICULTURE",
          date: "Sep 16, 2025"),
      ContentItem(
          icon: MdiIcons.waterAlertOutline,
          iconColor: Colors.deepPurple.shade600,
          title: "Water Quality Alert for Mula-Mutha River",
          snippet:
              "High turbidity reported post-monsoon. Citizens are advised to boil drinking water sourced from the river.",
          category: "PUBLIC HEALTH",
          date: "Sep 14, 2025"),
    ];
    return _buildContentList(advisoryItems);
  }
}

// A simple data model class for our content
class ContentItem {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String snippet;
  final String category;
  final String date;

  ContentItem({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.snippet,
    required this.category,
    required this.date,
  });
}