import 'package:flutter/material.dart';
import 'package:my_stackz/constants/app_images.dart';
import 'package:my_stackz/routes/app_pages.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only( top:  15.0,left: 15,right: 15),
          child: Column(
                children: [
          Padding(
            padding: const EdgeInsets.only( top:  20.0,left: 20,right: 20),
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.newLogo),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      'Forgot your Password?',
                      style: TextStyle(
                          color: Color(0xFF0000000),
                          fontWeight: FontWeight.w700,
                          fontSize: 23),
                    ),
                    SizedBox(height: 15),
                      Text(
                  'Enter your email ',
                  style: TextStyle(
                      color: Color(0xFF0000000),
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                ),
                SizedBox(
                  height: 15,
                ),
                 Container(
                  width: 327,
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(
                                color: Color(0xFFE0E0E0),
                                width: 1.0,
                              )),
                          labelText: 'email@domain.com',labelStyle: TextStyle(fontSize: 16),
                          fillColor: Color(0xFF828282),
                        ),
                      ),
                      SizedBox(
                  height: 10,
                ),
                  InkWell(
                    onTap: () {
                       Navigator.pushNamed(
                                             context, Routes.EMAIL_VERIFICATION);
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
                          'Next',
                          style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 16,
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
                  height: 15,
                ),
                Container(
                  width: 327,
                 // height: 36,
                  
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
                                  0xFF000000), // Change this to desired color
                              fontWeight: FontWeight
                                  .w400, // Change this to desired font weight
                              fontSize: 12,
                            ),
                          ),
                          TextSpan(
                            text: 'and ',
                            style: TextStyle(
                              color: Color(
                                  0xFF828282), // Change this to desired color
                              fontWeight: FontWeight
                                  .w400, // Change this to desired font weight
                              fontSize: 12,
                            ),
                          ),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(
                              color: Color(
                                  0xFF000000), // Change this to desired color
                              fontWeight: FontWeight
                                  .w400, // Change this to desired font weight
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
              ),
        ));
  }
}
