// import 'package:flutter/material.dart';
// import 'package:my_stackz/constants/string_constants.dart';
// import 'package:my_stackz/screens/resetPassword/provider/reset_password_provider.dart';
// import 'package:my_stackz/screens/resetPassword/views/reset_password_form.dart';
// import 'package:my_stackz/themes/custom_text_theme.dart';
// import 'package:my_stackz/widgets/button_widget.dart';
// import 'package:my_stackz/widgets/text_widget.dart';
// import 'package:provider/provider.dart';

// class ResetPasswordView extends StatelessWidget {
//   const ResetPasswordView({super.key});

//   @override
//    Widget build(BuildContext context) {
//                      ResetPasswordProvider controller = Provider.of<ResetPasswordProvider>(context, listen: false);

//     return Scaffold(
//         backgroundColor: context.getTheme.primaryColor,
//         appBar: AppBar(
//           leading:
//           InkWell(onTap: () => Navigator.pop(context), child: const Icon(Icons.close)),
//           title: const TextWidget(
//             text: StringConstants.resetPassword,
//           ),
//         ),
//         body: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//             child: Column(children: [
//               const SizedBox(height: 50),
//               ResetPasswordForm(controller: controller),
//               const Spacer(),
//               ButtonWidget(
//                   buttonText: StringConstants.resetPassword,
//                   onTap: () {
//                     controller.validateFields(context);
//                   }),
//             ])));
//   }
// }

import 'package:flutter/material.dart';
import 'package:my_stackz/constants/app_images.dart';


class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          width: 187.68,
          height: 75.23,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.logo),
            ),
          ),
        ),
        SizedBox(
          height: 80,
        ),
        Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    'You must’ve received a 6 digit', 
                    style: TextStyle(
                        color: Color(0xFF0000000),
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                   Text(
                    'code on your mail',
                    style: TextStyle(
                        color: Color(0xFF0000000),
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                    Text(
                ' Enter verification code ',
                style: TextStyle(
                    color: Color(0xFF0000000),
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
              SizedBox(
                height: 10,
              ),
               Container(
                width: 327,
                child: Column(
                  children: [
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                              color: Color(0xFFE0E0E0),
                              width: 1.0,
                            )),
                        hintText: "o o o o o o o o",
                        fillColor: Color(0xFF828282),
                      
                      ),
                    ),
                    SizedBox(
                height: 10,
              ),
                InkWell(
                  onTap: () {
                  //    Navigator.push(
                  //context,
                //  MaterialPageRoute(builder: (context) => ForgetPasswordtwo()),
                //);
                  },
                  child: Container(
                   height: 40,
                    width: 327,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Submit',
                        style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                  
                      ),
                    ),
                  ),
                ),
                  ],
                ),
              ),
             
            
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 327,
                height: 36,
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'By clicking continue, you agree to our ',
                          style: TextStyle(
                            color: Color(0xFF828282),
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                        TextSpan(
                          text: 'Terms of Service ',
                          style: TextStyle(
                            color: Color(
                                0xFF000000), 
                            fontWeight: FontWeight
                                .w400, 
                            fontSize: 12,
                          ),
                        ),
                        TextSpan(
                          text: 'and \n',
                          style: TextStyle(
                            color: Color(
                                0xFF828282), 
                            fontWeight: FontWeight
                                .w400, 
                            fontSize: 12,
                          ),
                        ),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(
                            color: Color(
                                0xFF000000), 
                            fontWeight: FontWeight
                                .w400, 
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
