import 'package:flutter/material.dart';
import 'package:flutter_login_dummyjson/model/login_model.dart';
import 'package:flutter_login_dummyjson/widgets/tab_and_show_item.dart';
import 'package:flutter_login_dummyjson/widgets/text_and_searchbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeWidget extends StatefulWidget {
  final LoginModel? loginModel;
  const HomeWidget({super.key, required this.loginModel});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: FaIcon(FontAwesomeIcons.barsStaggered),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Container(
              width: 60,
              height: 60,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: const Color.fromARGB(255, 223, 52, 94), width: 2),
              ),
              child: Image.network(
                widget.loginModel!.image,
                width: 30,
                fit: BoxFit.contain,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextAndSearchBar(myLoginModel: widget.loginModel),
              const SizedBox(height: 10),
              const TabAndShowItem(),
            ],
          ),
        ),
      ),
    );
  }
}
