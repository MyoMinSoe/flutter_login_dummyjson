import 'package:flutter/material.dart';
import 'package:flutter_login_dummyjson/screen/navigation_screen.dart';
import 'package:flutter_login_dummyjson/service/api_service.dart';
import 'package:flutter_login_dummyjson/utility/my_shared_preference.dart';
import 'package:flutter_login_dummyjson/widgets/clip_path.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final username = TextEditingController();
  final password = TextEditingController();

  bool passwordVisibility = true;
  void showHidePassword() {
    passwordVisibility = !passwordVisibility;
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    username.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomPaint(
            size: Size(
              MediaQuery.of(context).size.width,
              (MediaQuery.of(context).size.width * 0.5555555555555556)
                  .toDouble(),
            ),
            //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            painter: ClipPathShape(),
          ),
          const SizedBox(height: 10),
          CustomPaint(
            size: Size(
                MediaQuery.of(context).size.width,
                (MediaQuery.of(context).size.width * 1.0852337514253136)
                    .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            painter: LogInClipPath(),
            child: Padding(
              padding: const EdgeInsets.all(50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 250,
                    child: Row(
                      children: [
                        Spacer(),
                        Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 108, 33, 57),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 250,
                    child: TextField(
                      onTap: () {
                        username.text = 'levih';
                      },
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.mail_outline,
                            size: 30, color: Colors.grey),
                        hintText: 'yourmail@gmail.com',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      controller: username,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      SizedBox(
                        width: 250,
                        child: TextField(
                          controller: password,
                          onTap: () {
                            password.text = 'levihpass';
                          },
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: passwordVisibility,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock_outline,
                                size: 30, color: Colors.grey),
                            hintText: 'Enter Your Password',
                            hintStyle: const TextStyle(color: Colors.grey),
                            suffixIcon: IconButton(
                              onPressed: showHidePassword,
                              icon: passwordVisibility
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 250,
                        child: Row(
                          children: [
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return const AlertDialog(
                                        content: Text('Forgot Your Password?'),
                                      );
                                    });
                              },
                              child: const Text(
                                'Forgot Password ?',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 131, 94, 107),
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      backgroundColor: const Color.fromARGB(255, 223, 52, 94),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100, vertical: 15),
                    ),
                    onPressed: () async {
                      var response = await logIn(username.text, password.text);

                      if (response == null) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const AlertDialog(
                                content: Text('Login Error !'),
                              );
                            });
                      } else {
                        MySharedPreference.setToken(response.token);
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => NavigationScreen(
                                  myLoginModel: response,
                                )));
                      }
                      setState(() {});
                    },
                    child: const Text('Login'),
                  ),
                ],
              ),
            ),
          ),
          //Join With and Social Icons**************************************
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              const Text(
                'Join with',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 108, 33, 57),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Color.fromARGB(255, 223, 52, 94),
                      child: FaIcon(
                        FontAwesomeIcons.google,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Color.fromARGB(255, 223, 52, 94),
                      child: FaIcon(
                        FontAwesomeIcons.twitter,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Color.fromARGB(255, 223, 52, 94),
                      child: FaIcon(
                        FontAwesomeIcons.linkedinIn,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Color.fromARGB(255, 223, 52, 94),
                      child: FaIcon(
                        FontAwesomeIcons.facebookF,
                        size: 20,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
