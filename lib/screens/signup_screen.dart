import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instafire/constants/colors.dart';
import 'package:instafire/constants/utils.dart';
import 'package:instafire/screens/login_screen.dart';
import 'package:instafire/services/authService.dart';
import 'package:instafire/widgets/input_fields.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  Uint8List? _image;
  bool _isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  void selectImg() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });

    String res = await AuthService().SignUpUser(
      email: _emailController.text,
      password: _passwordController.text,
      username: _usernameController.text,
      bio: _bioController.text,
      image: _image!,
    );
    setState(() {
      _isLoading = false;
    });
    if (res != 'success') {
      showSnackBar(res, context);
    }
    print(res);
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
                  //username
                  SizedBox(
                    height: 34,
                  ),
                  Stack(
                    children: [
                      _image != null
                          ? CircleAvatar(
                              radius: 64, backgroundImage: MemoryImage(_image!))
                          : const CircleAvatar(
                              radius: 64,
                              backgroundImage: NetworkImage(
                                  "https://toppng.com/uploads/preview/instagram-default-profile-picture-11562973083brycehrmyv.png"),
                            ),
                      Positioned(
                        bottom: -10,
                        left: 80,
                        child: IconButton(
                            onPressed: selectImg,
                            icon: const Icon(
                              Icons.add_a_photo,
                              color: Colors.pinkAccent,
                            )),
                      )
                    ],
                  ),

                  const SizedBox(
                    height: 34,
                  ),
                  InputFielsW(
                    textEditingController: _usernameController,
                    hintText: "Enter Your Username",
                    textInputType: TextInputType.text,
                  ),

                  //email
                  const SizedBox(
                    height: 30,
                  ),
                  InputFielsW(
                    textEditingController: _emailController,
                    hintText: "Enter Your Email",
                    textInputType: TextInputType.emailAddress,
                  ),

                  SizedBox(
                    height: 30,
                  ),

                  InputFielsW(
                    textEditingController: _bioController,
                    hintText: "Enter Your Bio",
                    textInputType: TextInputType.text,
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
                    onTap: signUpUser,
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
                      child: _isLoading
                          ? Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 3,
                                backgroundColor: Colors.black,
                              ),
                            )
                          : Text('Sign Up'),
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
                        child: const Text('Already have an Signin?'),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => login(),
                            ),
                          );
                        },
                        child: Container(
                          child: const Text(
                            'Sign in',
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
