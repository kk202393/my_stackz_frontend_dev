import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_stackz/utils/utils.dart';
import 'package:provider/provider.dart';

import '../provider/dashboard_provider.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    DashboardProvider dashboardProvider= Provider.of<DashboardProvider>(context, listen: false);

    Utils().setSystemOverlayStyle();
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: SafeArea(
            child: AnnotatedRegion<SystemUiOverlayStyle>(
                value: SystemUiOverlayStyle.light,
                child:
                dashboardProvider.children[dashboardProvider.currentIndex])),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: dashboardProvider.currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
        onTap: (index) => dashboardProvider.updateIndex(index),
      ),
      // bottomNavigationBar: Obx(() => MyStackzBottomNavigationBar(
        //     currentIndex: dashboardProvider.selectedIndex.value,
        //     onTap: dashboardProvider.onItemTapped,))
            );
  }
}
