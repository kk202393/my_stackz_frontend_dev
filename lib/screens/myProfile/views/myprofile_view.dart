import 'package:flutter/material.dart';
import 'package:my_stackz/screens/myProfile/provider/myprofile_provider.dart';
import 'package:provider/provider.dart'; // Ensure Provider package is added
import 'package:my_stackz/constants/app_colors.dart';
import 'package:my_stackz/constants/app_images.dart';
import 'package:my_stackz/constants/string_constants.dart';
import 'package:my_stackz/themes/custom_text_theme.dart';
import 'package:my_stackz/widgets/text_widget.dart';
//import 'myprofile_provider.dart'; // Import your provider

class MyProfileView extends StatelessWidget {
  const MyProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
      create: (_) => MyProfileProvider(),
      child: Consumer<MyProfileProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(
                            Icons.chevron_left_outlined,
                            size: 30,
                            color: AppColors.pineTree,
                          ),
                        ),
                        SizedBox(width: width * 0.3),
                        TextWidget(
                          text: StringConstants.profile,
                          style: context.headlineSmall,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  CircleAvatar(
                    radius: 70,
                    backgroundColor: Theme.of(context).primaryColor,
                    child: ClipOval(
                      child: Image.asset(
                        AppImages.profileIcon,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Text("User Name"),
                  const SizedBox(height: 30),
                 Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextWidget(
          text: "Booking Id",
          style: context.bodyMedium.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: provider.onfirstArrowClicked, // Toggling arrow state
          child: ValueListenableBuilder<bool>(
            valueListenable: provider.isfirstArrowClicked,
            builder: (context, isArrowClicked, child) {
              return Icon(
                isArrowClicked
                    ? Icons.keyboard_arrow_up_outlined // Arrow up when clicked
                    : Icons.keyboard_arrow_down_outlined, // Arrow down when not clicked
                size: 20,
              );
            },
          ),
        ),
      ],
    ),
    // This ValueListenableBuilder controls the visibility of the text when arrow is clicked
    ValueListenableBuilder<bool>(
      valueListenable: provider.isfirstArrowClicked,
      builder: (context, isArrowClicked, child) {
        return isArrowClicked
            ? const Padding(
                padding: EdgeInsets.only(top: 10), // Adds spacing before the text
                child: Text(
                  "This is your booking ID!",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : const SizedBox(); 
      },
    ),
  ],
),
 const SizedBox(height: 20),
         Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextWidget(
          text: "Full Name",
          style: context.bodyMedium.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
        const Spacer(),
        // The arrow for toggling the text visibility
        InkWell(
          onTap: provider.onsecondArrowClicked, // Toggles the text visibility
          child: ValueListenableBuilder<bool>(
            valueListenable: provider.issecondArrowClicked,
            builder: (context, isArrowClicked, child) {
              return Icon(
                isArrowClicked
                    ? Icons.keyboard_arrow_up_outlined
                    : Icons.keyboard_arrow_down_outlined,
                size: 20,
              );
            },
          ),
        ),
      ],
    ),
    // The text that will be shown or hidden based on the arrow state
    ValueListenableBuilder<bool>(
      valueListenable: provider.issecondArrowClicked,
      builder: (context, isArrowClicked, child) {
        return isArrowClicked
            ? const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "This is your favorite!",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : const SizedBox(); // Hide the text when the arrow is not clicked
      },
    ),
  ],
),
        const SizedBox(height: 20),
       Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextWidget(
          text: "Email Id",
          style: context.bodyMedium.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: provider.onthirdArrowClicked, // Toggles the arrow state
          child: ValueListenableBuilder<bool>(
            valueListenable: provider.isthirdArrowClicked,
            builder: (context, isArrowClicked, child) {
              return Icon(
                isArrowClicked
                    ? Icons.keyboard_arrow_up_outlined // Arrow up when clicked
                    : Icons.keyboard_arrow_down_outlined, // Arrow down when not clicked
                size: 20,
              );
            },
          ),
        ),
      ],
    ),
    // This ValueListenableBuilder controls the visibility of the text when arrow is clicked
    ValueListenableBuilder<bool>(
      valueListenable: provider.isthirdArrowClicked,
      builder: (context, isArrowClicked, child) {
        return isArrowClicked
            ? const Padding(
                padding: EdgeInsets.only(top: 10), // Adds spacing before the text
                child: Text(
                  "This is your email ID!",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : const SizedBox(); // Hides the text when arrow is not clicked
      },
    ),
  ],
),
        SizedBox(height: 20),
       Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextWidget(
          text: "History",
          style: context.bodyMedium.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: provider.onfourArrowClicked, // Toggles the arrow state
          child: ValueListenableBuilder<bool>(
            valueListenable: provider.isfourArrowClicked,
            builder: (context, isArrowClicked, child) {
              return Icon(
                isArrowClicked
                    ? Icons.keyboard_arrow_up_outlined // Arrow up when clicked
                    : Icons.keyboard_arrow_down_outlined, // Arrow down when not clicked
                size: 20,
              );
            },
          ),
        ),
      ],
    ),
    // This ValueListenableBuilder controls the visibility of the text when arrow is clicked
    ValueListenableBuilder<bool>(
      valueListenable: provider.isfourArrowClicked,
      builder: (context, isArrowClicked, child) {
        return isArrowClicked
            ? Padding(
                padding: const EdgeInsets.only(top: 10), // Adds spacing before the text
                child: SizedBox(
                    height: 200, // Adjust the height for the list view
                    child: ListView.builder(
                      itemCount: 10, // Set the number of items in the list
                      itemBuilder: (context, index) {
                        return Card(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          child: ListTile(
                            leading: Icon(Icons.history), // Icon for history
                            title: Text('History Item'),
                            subtitle: Text('Details of history go here.'),
                          ),
                        );
                      },
                    ),
                  ),
              )
            : const SizedBox(); // Hides the text when arrow is not clicked
      },
    ),
  ],
),
        SizedBox(height: 20),
               Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextWidget(
          text: "Settings",
          style: context.bodyMedium.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: provider.onfiveArrowState, // Toggles the arrow state
          child: ValueListenableBuilder<bool>(
            valueListenable: provider.isfiveArrowClicked,
            builder: (context, isArrowClicked, child) {
              return Icon(
                isArrowClicked
                    ? Icons.keyboard_arrow_up_outlined // Arrow up when clicked
                    : Icons.keyboard_arrow_down_outlined, // Arrow down when not clicked
                size: 20,
              );
            },
          ),
        ),
      ],
    ),
    // ValueListenableBuilder controls the visibility of the text when the arrow is clicked
    ValueListenableBuilder<bool>(
      valueListenable: provider.isfiveArrowClicked,
      builder: (context, isArrowClicked, child) {
        return isArrowClicked
            ? const Padding(
                padding: EdgeInsets.only(top: 10), // Adds space before the text
                child: Text(
                  "Settings Details go here!", // Replace this with your actual content
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : const SizedBox(); // Hides the text when the arrow is not clicked
      },
    ),
  ],
),
   const SizedBox(height: 20),
                  Row(
                    children: [
                      const Text(
                        "Favorite",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                      const Spacer(),
                                   InkWell(
                        onTap: provider.onsixArrowState,
                        child: ValueListenableBuilder<bool>(
                          valueListenable: provider.issixArrowClicked,
                          builder: (context, isArrowClicked, child) {
                            return Icon(
                              isArrowClicked
                                  ? Icons.favorite_border
                                  : Icons.favorite,
                              size: 20,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
