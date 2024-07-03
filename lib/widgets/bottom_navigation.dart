import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

class MyStackzBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final onTap;

  const MyStackzBottomNavigationBar({Key? key, this.currentIndex = 0, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: AppColors.bgColor,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 25), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_outlined, size: 25), label: 'Booking'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border, size: 25), label: 'Favorites'),
          /*BottomNavigationBarItem(
              icon: Icon(Icons.wallet_membership_outlined, size: 25), label: 'Wallets'),
          */BottomNavigationBarItem(
              icon: Icon(Icons.notifications_active_outlined, size: 25), label: 'Notification'),
        ],
        currentIndex: currentIndex,
        selectedItemColor: AppColors.princeTonOrange,
        unselectedItemColor: AppColors.darkGray,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedLabelStyle: GoogleFonts.montserrat(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.princeTonOrange),
        unselectedLabelStyle: GoogleFonts.montserrat(
            fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.pineTree),
        onTap: onTap);
  }
}
