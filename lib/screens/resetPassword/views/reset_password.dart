import 'package:flutter/material.dart';
import 'package:my_stackz/constants/app_images.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0,right: 15,top: 15),
        child: Column(
          children: [
            Padding(
            padding: const EdgeInsets.only(left: 15.0,right: 15,top: 15),
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
                        'Reset your password?',
                        style: TextStyle(
                          color: Color(0xFF000000),
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Enter your new password',
                        style: TextStyle(
                          color: Color(0xFF000000),
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 10),
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
                                  ),
                                ),
                                labelText: 'New Password',labelStyle: TextStyle(fontSize: 16),
                                fillColor: Color(0xFF828282),
                              ),
                            ),
                            SizedBox(height: 10),
                            TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(
                                    color: Color(0xFFE0E0E0),
                                    width: 1.0,
                                  ),
                                ),
                                labelText: 'Confirm password',labelStyle: TextStyle(fontSize: 16),
                                fillColor: Color(0xFF828282),
                              ),
                            ),
                            const SizedBox(height: 10),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ForgetPasswordthree(),
                                  ),
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
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Padding(
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
                              color: Color(0xFF000000),
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                          TextSpan(
                            text: 'and \n',
                            style: TextStyle(
                              color: Color(0xFF828282),
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(
                              color: Color(0xFF000000),
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
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
}

class ForgetPasswordthree extends StatelessWidget {
  const ForgetPasswordthree({super.key});

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
            SizedBox(height: 50),
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(85),
                border: Border.all(
                  color: const Color.fromARGB(255, 7, 132, 235),
                  width: 9.0,
                ),
              ),
              child: Icon(
                Icons.check,
                color: Colors.white,
                size: 80.0,
              ),
            ),
            SizedBox(height: 30),
            Container(
              width: double.infinity,
              child: Column(
                children: [
                  Text(
                    'Your password has ',
                    style: TextStyle(
                      color: Color(0xFF1C1C1C),
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'been reset.',
                    style: TextStyle(
                      color: Color(0xFF1C1C1C),
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
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
}
