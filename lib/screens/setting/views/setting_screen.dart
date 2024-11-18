import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: const Text(
            'Settings',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Handle search icon press
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 15, left: 5, right: 5),
        children: [
          SettingsTile(
            icon: Icons.person,
            title: 'Profile',
            onTap: () {},
          ),
          SettingsTile(
            icon: Icons.notifications,
            title: 'Notifications',
            onTap: () {},
          ),
          SettingsTile(
            icon: Icons.history,
            title: 'Booking History',
            onTap: () {},
          ),
          SettingsTile(
            icon: Icons.lock,
            title: 'Privacy & Security',
            onTap: () {},
          ),
          SettingsTile(
            icon: Icons.headset_mic,
            title: 'Help and Support',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const SettingsTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20, // Adjust the font size as needed
          fontWeight: FontWeight.normal, // Remove bold text
        ),
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}


// import 'package:flutter/material.dart';

// class SettingsScreen extends StatelessWidget {
//   const SettingsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Data for settings options
//     final List<Map<String, dynamic>> settingsOptions = [
//       {'icon': Icons.person, 'title': 'Profile'},
//       {'icon': Icons.notifications, 'title': 'Notifications'},
//       {'icon': Icons.history, 'title': 'Booking History'},
//       {'icon': Icons.lock, 'title': 'Privacy & Security'},
//       {'icon': Icons.headset_mic, 'title': 'Help and Support'},
//     ];

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//         elevation: 1,
//         title: const Text('Settings'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.search),
//             onPressed: () {
//               // Handle search icon press
//             },
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: ListView.builder(
//           itemCount: settingsOptions.length,
//           itemBuilder: (BuildContext context, int index) {
//             final option = settingsOptions[index];
//             return ListTile(
//               leading: Icon(option['icon']),
//               title: Text(option['title']),
//               trailing: const Icon(Icons.chevron_right),
//               onTap: () {
//                 // Handle navigation or functionality
//                // print('${option['title']} tapped');
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
