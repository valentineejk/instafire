import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instafire/constants/colors.dart';
import 'package:instafire/widgets/input_fields.dart';

import 'signup_screen.dart';

class login extends StatefulWidget {
  login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Container(),
                    flex: 2,
                  ),

                  //svg image
                  SvgPicture.asset(
                    'assets/ic_instagram.svg',
                    color: primaryColor,
                    height: 64,
                  ),

                  //email
                  const SizedBox(
                    height: 64,
                  ),
                  InputFielsW(
                    textEditingController: _emailController,
                    hintText: "Enter Your Email",
                    textInputType: TextInputType.emailAddress,
                  ),

                  SizedBox(
                    height: 30,
                  ),

                  //password
                  InputFielsW(
                    textEditingController: _passwordController,
                    hintText: "Enter Your Password",
                    textInputType: TextInputType.text,
                    isPas: true,
                  ),

                  //button
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      width: double.infinity,
                      decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                          ),
                          color: Colors.pinkAccent),
                      child: Text('Login'),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Flexible(
                    child: Container(),
                    flex: 2,
                  ),

                  //signup
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: const Text('Dont have an account?'),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => SignUp(),
                            ),
                          );
                        },
                        child: Container(
                          child: const Text(
                            'Sign up',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 8),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
