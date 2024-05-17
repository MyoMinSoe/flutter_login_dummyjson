import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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

  @override
  void initState() {
    super.initState();
    // username.text = 'flesslie2q';
    // password.text = 'XUKU613LscMS';
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.25,
            color: const Color.fromARGB(255, 223, 52, 94),
          ),
          const SizedBox(height: 35),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.45,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black12,
                width: 3,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(50),
              ),
            ),
            padding: const EdgeInsets.all(20),
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
                      username.text = 'flesslie2q';
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
                Column(
                  children: [
                    SizedBox(
                      width: 250,
                      child: TextField(
                        onTap: () {
                          password.text = 'XUKU613LscMS';
                        },
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.lock_outline,
                              size: 30, color: Colors.grey),
                          hintText: 'Enter Your Password',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        controller: password,
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
