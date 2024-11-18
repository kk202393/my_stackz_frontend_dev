import 'package:carousel_slider/carousel_slider.dart' as carousel_slider;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_stackz/constants/app_colors.dart';
import 'package:my_stackz/constants/app_images.dart';
import 'package:my_stackz/constants/string_constants.dart';
import 'package:my_stackz/routes/app_pages.dart';
import 'package:my_stackz/screens/booking/provider/booking_provider.dart';
import 'package:my_stackz/screens/home/controllers/home_controller.dart';
import 'package:my_stackz/screens/home/views/similar_part.dart';
import 'package:my_stackz/screens/login/provider/login_provider.dart';
import 'package:my_stackz/themes/custom_text_theme.dart';
import 'package:my_stackz/utils/utils.dart';
import 'package:my_stackz/widgets/app_divider.dart';
import 'package:my_stackz/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    final bookingProvider =
        Provider.of<BookingProvider>(context, listen: false);
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);

    final width = MediaQuery.of(context).size.width;

    return Consumer<HomeProvider>(
      builder:
          (BuildContext context, HomeProvider homeProvider, Widget? child) {
        return Scaffold(
          body: ValueListenableBuilder(
            valueListenable: homeProvider.isLoading,
            builder: (BuildContext context, bool isLoading, Widget? child) {
              return SafeArea(
                child: SingleChildScrollView(
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ValueListenableBuilder(
                                  valueListenable: homeProvider.name,
                                  builder: (BuildContext context, String name,
                                      Widget? child) {
                                    return RichText(
                                      textAlign: TextAlign.start,
                                      text: TextSpan(
                                        text: "${StringConstants.welcome} ",
                                        style: context.headlineMedium,
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: loginProvider.logInAPIResponse
                                                    ?.user?.username ??
                                                'Guest',
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () =>
                                                  Navigator.pushNamed(
                                                      context, Routes.SIGN_UP),
                                            style: context.headlineSmall,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                                const Spacer(),
                                InkWell(
                                  onTap: () {
                                    homeProvider.onIconClicked();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 2),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border:
                                          Border.all(color: AppColors.darkGray),
                                      color: AppColors.bgColor,
                                    ),
                                    child: const Icon(Icons.menu_outlined,
                                        size: 30),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ValueListenableBuilder(
                            valueListenable: homeProvider.isIconClicked,
                            builder: (BuildContext context, bool isIconClicked,
                                Widget? child) {
                              return Visibility(
                                visible: isIconClicked,
                                child: Container(
                                  width: width,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(color: AppColors.white),
                                    color: AppColors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      InkWell(
                                        onTap: () => Navigator.pushNamed(
                                            context, Routes.MY_PROFILE),
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
                                            style: context.bodyMedium.copyWith(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 17),
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
                                              color: AppColors.princeTonOrange
                                                  .withOpacity(0.2)),
                                          color: AppColors.princeTonOrange
                                              .withOpacity(0.3),
                                        ),
                                        child: InkWell(onTap: () {
                                           Navigator.pushNamed(
                                                      context, Routes.SETTINGS);  
                                        },
                                          child: TextWidget(
                                            text: StringConstants.settings,
                                            style: context.bodyMedium.copyWith(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 17),
                                          ),
                                        ),
                                      ),
                                      AppDivider(width: width),
                                      ValueListenableBuilder(
                                        valueListenable: homeProvider.isLoading,
                                        builder: (BuildContext context,
                                            bool isLoading, Widget? child) {
                                          return InkWell(
                                            onTap: () {
                                              homeProvider
                                                  .callLogoutApi(context)
                                                  .then((success) {
                                                if (success) {
                                                  Navigator
                                                      .pushNamedAndRemoveUntil(
                                                    context,
                                                    Routes.LOGIN,
                                                    (route) => false,
                                                  );
                                                }
                                              });
                                            },
                                            child: Container(
                                              width: width,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 4),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: AppColors
                                                        .princeTonOrange
                                                        .withOpacity(0.2)),
                                                color: AppColors.princeTonOrange
                                                    .withOpacity(0.3),
                                              ),
                                              child: TextWidget(
                                                text: StringConstants.logOut,
                                                style: context.bodyMedium
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 17),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 30),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: ValueListenableBuilder(
                              valueListenable: homeProvider.isLoading,
                              builder: (BuildContext context, bool isLoading,
                                  Widget? child) {
                                return SimilarPart();
                              },
                            ),
                          ),
                       ValueListenableBuilder<bool>(
      valueListenable: homeProvider.isArrowClicked,
      builder: (context, isArrowClicked, child) {
        return Visibility(
          visible: !isArrowClicked, // Show/Hide based on isArrowClicked
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: carousel_slider.CarouselSlider(
              items: [
                SizedBox(
                  height: 220,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(AppImages.carousalOne),
                      Positioned(
                        top: 20,
                        child: TextWidget(
                          text: "We provide you the best services",
                          style: GoogleFonts.knewave(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: AppColors.pineTree,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: InkWell(
                          onTap: () async {
                            // Action for "Book Now" button
                          },
                          child: Container(
                            width: 80,
                            padding: const EdgeInsets.fromLTRB(12, 5, 0, 5),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.white),
                              borderRadius: BorderRadius.circular(5),
                              color: AppColors.white,
                            ),
                            child: TextWidget(
                              text: StringConstants.bookNow,
                              style: context.headlineSmall.copyWith(
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              options: carousel_slider.CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: false,
                aspectRatio: 2.5,
                viewportFraction: 0.5,
                initialPage: 1,
              ),
            ),
          ),
        );
      },
    ),    const SizedBox(height: 20),
                          Container(
                            width: width,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              border: Border.all(color: AppColors.white),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.darkGray.withOpacity(0.3),
                                  blurRadius: 8,
                                  spreadRadius: 5,
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(AppImages.tokenIcon,
                                    height: 30, width: 16),
                                const SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                      text: StringConstants.referFriend,
                                      style: context.headlineMedium.copyWith(
                                          color: AppColors.primaryButtonColor),
                                    ),
                                    const SizedBox(height: 20),
                                    TextWidget(
                                      text: StringConstants
                                          .referToGetRewardFriend,
                                      style: context.labelMedium.copyWith(
                                        color: AppColors.pineTree,
                                        fontSize: 9,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 30),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(AppImages.deliveryIcon,
                                    height: 41, width: 42),
                                const SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                      text: StringConstants.deliveringLove,
                                      style: context.headlineMedium.copyWith(
                                          color: AppColors.princeTonOrange),
                                    ),
                                    const SizedBox(height: 20),
                                    TextWidget(
                                      text: StringConstants.hearFromCustomers,
                                      style: context.headlineMedium.copyWith(
                                          color: AppColors.princeTonOrange),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            width: width,
                            height: 190,
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            decoration: BoxDecoration(
                              color: AppColors.primaryButtonColor,
                              border: Border.all(
                                  color: AppColors.primaryButtonColor),
                            ),
                            child: ListView.separated(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => Container(
                                height: 160,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: AppColors.white),
                                  color: AppColors.white,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    TextWidget(
                                      text: StringConstants.viewSuper,
                                      style: GoogleFonts.montserrat(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.pineTree,
                                      ),
                                    ),
                                    const SizedBox(height: 3),
                                    Row(
                                      children: List.generate(
                                          5,
                                          (index) => Icon(Icons.star,
                                              color: AppColors.princeTonOrange,
                                              size: 15)),
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          children: [
                                            Image.asset(
                                                AppImages.invertedCommaOne,
                                                height: 12),
                                            const SizedBox(height: 20),
                                          ],
                                        ),
                                        const SizedBox(width: 10),
                                        Column(
                                          children: [
                                            TextWidget(
                                              text: StringConstants.review,
                                              style: GoogleFonts.poppins(
                                                fontSize: 9,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.spanishBlue,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(width: 10),
                                        Column(
                                          children: [
                                            const SizedBox(height: 10),
                                            Image.asset(
                                                AppImages.invertedCommaTwo,
                                                height: 12),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Image.asset(AppImages.reviewerProfile,
                                              width: 24),
                                          const SizedBox(width: 20),
                                          TextWidget(
                                            text: "Joeie Senon",
                                            style: GoogleFonts.montserrat(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.pineTree,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(width: 5),
                              itemCount: 15,
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                      homeProvider.isLoading.value
                          ? Utils.getLoadingUI(context)
                          : const SizedBox(),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
