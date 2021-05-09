import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:login/config/palette.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isMale = true;
  bool isSignup = true;
  bool isRememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/background.png'),
                  fit: BoxFit.fill
                )
              ),
              child: Container(
                padding: EdgeInsets.only(top: 90, left: 20),
                color: Color(0xFF3B5999).withOpacity(.25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "Welcome to",
                        style: TextStyle(
                          fontSize: 25,
                          letterSpacing: 2,
                          color: Colors.yellow[700]
                        ),
                        children: [
                          TextSpan(
                          text: " Football Café",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.yellow[700]
                          ),),
                        ]
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      'Signup to continue',
                      style: TextStyle(
                          letterSpacing: 1,
                          color: Colors.white
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 200,
            child: Container(
              height: 380,
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 15,
                    spreadRadius: 5
                  )
                ]
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSignup = false;
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              'LOGIN',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: !isSignup ? Palette.activeColor : Palette.textColor1
                              ),
                            ),
                            Container(
                              height: 2,
                              width: 52,
                              color: Colors.orange,
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSignup = true;
                          });
                        },
                       child: Column(
                         children: [
                           Text(
                             'SIGN UP',
                             style: TextStyle(
                                 fontSize: 16,
                                 fontWeight: FontWeight.bold,
                                 color: isSignup ? Palette.activeColor : Palette.textColor1
                             ),
                           ),

                           Container(
                             margin: EdgeInsets.only(top: 3),
                             height: 2,
                             width: 68,
                             color: Colors.orange,
                           )
                         ],
                       ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        buildTextField(MaterialCommunityIcons.account_outline, 'User name', false, false),
                        buildTextField(MaterialCommunityIcons.email_outline, 'email', false, true),
                        buildTextField(MaterialCommunityIcons.lock_outline, 'password', true, false),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildTextField(IconData icon, String hintText, bool isPassword, bool isEmail){
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextField(
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(

          prefixIcon: Icon(
            icon,
            color: Palette.iconColor,
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Palette.textColor1
              ),
              borderRadius: BorderRadius.all(Radius.circular(35.0))
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Palette.textColor1
              ),
              borderRadius: BorderRadius.all(Radius.circular(35.0))
          ),
          contentPadding: EdgeInsets.all(10),
          hintText: hintText,
          hintStyle: TextStyle(
              fontSize: 14,
              color: Palette.textColor1
          ),
        )
      ),
    );
  }
}
