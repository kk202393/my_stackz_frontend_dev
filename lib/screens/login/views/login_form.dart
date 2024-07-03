// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:my_stackz/constants/string_constants.dart';
// import 'package:my_stackz/screens/home/controllers/home_controller.dart';
// import 'package:my_stackz/screens/login/provider/login_provider.dart';
// import 'package:my_stackz/themes/custom_text_theme.dart';
// import 'package:my_stackz/utils/input_validator.dart';
// import 'package:my_stackz/widgets/app_form_field.dart';
// import 'package:provider/provider.dart';

// import '../../../../widgets/button_widget.dart';
// import '../../../../widgets/text_widget.dart';
// import '../../../routes/app_pages.dart';

// class LoginForm extends StatelessWidget {

//   const LoginForm({
//     super.key,
//    });

//   @override
//   Widget build(BuildContext context) {
//        LoginProvider controller = Provider.of<LoginProvider>(context, listen: false);
//          HomeProvider homeController = Provider.of<HomeProvider>(context, listen: false);
//     final size = MediaQuery.of(context).size;
//     return Form(
//       key: controller.formKey,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           AppFormField(
//             controller: controller.emailController,
//             hintText: StringConstants.enterEmail,
//             validator: (value) => InputValidator.isValidEmail(value),
//           ),
//           const SizedBox(height: 20),
//           AppFormField(
//             controller: controller.passwordController,
//             obscureText: controller.obscureText.value,
//             hintText: StringConstants.enterPassword,
//             onTapSuffixIcon: () => controller.onChangePasswordVisibility(),
//             validator: (value) =>
//                 InputValidator.validateFields("password", value),
//           ),
//           const SizedBox(height: 10),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 5),
//             child: Row(
//               children: [
//                 InkWell(
//                   onTap: () => controller.onClickRememberMe(),
//                   child: Icon(
//                       controller.rememberMe.value
//                           ? Icons.check_box_outlined
//                           : Icons.check_box_outline_blank,
//                       size: 15),
//                 ),
//                 const SizedBox(width: 7),
//                 TextWidget(
//                     text: StringConstants.rememberMe, style: context.bodySmall),
//                 const Spacer(),
//                 InkWell(
//                   onTap: () {},
//                   // => Get.toNamed(Routes.FORGOT_PASSWORD),
//                   child: TextWidget(
//                       text: StringConstants.forgotPassword,
//                       style: context.bodySmall),
//                 )
//               ],
//             ),
//           ),
//           // ignore: prefer_const_constructors
//           SizedBox(height: 50),
//           ButtonWidget(
//             buttonText: StringConstants.login,
//             onTap: () async {
//               bool _isSuccess = await controller.validateFields();
//               if (_isSuccess) {
//                 bool another =
//                     await homeController.callGetViewHomePageApi(context);
//                 if (another) {
//                   Navigator.pushNamed(context, Routes.HOME);
//                 }
//               } else {}
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
