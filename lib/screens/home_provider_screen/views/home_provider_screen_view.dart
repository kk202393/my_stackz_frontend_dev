import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_stackz/constants/app_colors.dart';
import 'package:my_stackz/constants/string_constants.dart';
import 'package:my_stackz/routes/app_pages.dart';
import 'package:my_stackz/screens/home/controllers/home_controller.dart';
import 'package:my_stackz/screens/login/provider/login_provider.dart';
import 'package:my_stackz/widgets/app_divider.dart';
import 'package:my_stackz/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class HomeProviderScreen extends StatelessWidget {
  const HomeProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);

    List<Map<String, String>> jobs = [
      {
        'time': 'Tomorrow, 1 PM',
        'location': '56, Colmean Tanglin Road\nSingapore, 245790',
        'credits': '20 Credits',
      },
      {
        'time': 'Tomorrow, 5 PM',
        'location': '56, Colmean Tanglin Road\nSingapore, 245790',
        'credits': '5 Credits',
      },
      {
        'time': 'Tomorrow, 9 AM',
        'location': '78, Orchard Road\nSingapore, 238895',
        'credits': '10 Credits',
      },
    ];

    double screenHeight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // First section with custom paint class
            Stack(
              children: [
                CustomPaint(
                  painter: CurvedHeaderPainter(color: Color(0xFFFFE28F)),
                  child: Container(
                    height: screenHeight * 0.3,
                  ),
                ),
                // Menu Button at Top-Left
                Positioned(
                  top: 50,
                  right: 20, // Align to the left
                  child: InkWell(
                    onTap: () {
                      homeProvider.onIconClicked();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.darkGray),
                        color: AppColors.bgColor,
                      ),
                      child: const Icon(Icons.menu_outlined, size: 30),
                    ),
                  ),
                ),
                Positioned(
                  top: 100,
                  right: 20,
                  child: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      text: '${StringConstants.welcome} ',
                      style: GoogleFonts.montserrat(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              loginProvider.logInAPIResponse?.user?.username ??
                                  'Guest',
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            ValueListenableBuilder(
              valueListenable: homeProvider.isIconClicked,
              builder:
                  (BuildContext context, bool isIconClicked, Widget? child) {
                return Visibility(
                  visible: isIconClicked,
                  child: Container(
                    width: width,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: AppColors.white),
                      color: AppColors.white,
                    ),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () =>
                              Navigator.pushNamed(context, Routes.MY_PROFILE),
                          child: Container(
                            width: width,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColors.princeTonOrange
                                      .withOpacity(0.3)),
                              color: AppColors.white,
                            ),
                            child: TextWidget(
                              text: StringConstants.myAccount,
                              style: GoogleFonts.montserrat(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        AppDivider(width: width),
                        Container(
                          width: width,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color:
                                    AppColors.princeTonOrange.withOpacity(0.2)),
                            color: AppColors.princeTonOrange.withOpacity(0.3),
                          ),
                          child: TextWidget(
                            text: StringConstants.settings,
                            style: GoogleFonts.montserrat(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          ),
                        ),
                        AppDivider(width: width),
                        InkWell(
                          onTap: () {
                            homeProvider.callLogoutApi(context).then((success) {
                              if (success) {
                                Navigator.pushNamedAndRemoveUntil(
                                    context, Routes.LOGIN, (route) => false);
                              }
                            });
                          },
                          child: Container(
                            width: width,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColors.princeTonOrange
                                      .withOpacity(0.2)),
                              color: AppColors.princeTonOrange.withOpacity(0.3),
                            ),
                            child: TextWidget(
                              text: StringConstants.logOut,
                              style: GoogleFonts.montserrat(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 30),
            // Jobs Section (Same as original)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsetsDirectional.only(bottom: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Today',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '▼ UNAVAILABLE',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tomorrow',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '▲ WORKING',
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: null,
                          icon: Icon(Icons.calendar_today_outlined),
                          iconSize: 25,
                        ),
                      ],
                    ),
                  ),
                  CustomDivider(),
                  // Job List Section
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '2 new jobs',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: null,
                              icon: Icon(Icons.arrow_forward_ios),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenHeight *
                              0.20, // Set the height of the ListView
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: jobs.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 16.0), // Space between cards
                                child: Card(
                                  elevation: 2.5,
                                  color: const Color(
                                      0xFFFFE28F), // Light yellow background
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            jobs[index]['time']!,
                                            style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color: Colors.black,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            jobs[index]['location']!,
                                            style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              color: const Color.fromRGBO(
                                                  68, 68, 68, 1),
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            jobs[index]['credits']!,
                                            style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              color: const Color.fromRGBO(
                                                  68, 68, 68, 1),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomDivider(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'What\'s new?',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                              onPressed: null,
                              icon: Icon(Icons.arrow_forward_ios),
                            ),
                          ],
                        ),
                        // Wrap ListView.builder in SizedBox with fixed height
                        SizedBox(
                          height: screenHeight *
                              0.20, // Set the height of the ListView
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 10, // The length of the job list
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    right: 13.0), // Space between cards
                                child: Card(
                                  elevation: 2.5,
                                  color: const Color(
                                      0xFFFFE28F), // Light yellow background
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Container(
                                    width: 100,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          10), // Match card's border radius
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(12.0),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget CustomDivider() {
    return const Divider(
      color: Color.fromARGB(69, 158, 158, 158),
      thickness: 2,
    );
  }
}

class CurvedHeaderPainter extends CustomPainter {
  final Color color;

  CurvedHeaderPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.8);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height * 0.8,
    );
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
