import 'package:flutter/material.dart';
import 'package:my_stackz/constants/app_images.dart';
import 'package:my_stackz/screens/resetPassword/views/reset_password.dart';


class Emailverification extends StatelessWidget {
  const Emailverification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
                children: [
          Container(
            width: 187.68,
            height: 75.23,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.newLogo),
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
                     SizedBox(
                  height: 20,
                ),
                     Text(
                      'code on your mail',
                      style: TextStyle(
                          color: Color(0xFF0000000),
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                     SizedBox(
                  height: 20,
                ),
                      Text(
                  ' Enter verification code ',
                  style: TextStyle(
                      color: Color(0xFF0000000),
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                ),
                SizedBox(
                  height: 20,
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
                        
                        ),
                      ),
                      SizedBox(
                  height: 10,
                ),
                  InkWell(
                    onTap: () {
                       Navigator.push(
                    context,
                   MaterialPageRoute(builder: (context) => ResetPassword()),
                  );
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
              ),
        ));
  }
}
