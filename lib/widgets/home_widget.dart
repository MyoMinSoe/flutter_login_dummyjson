import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_login_dummyjson/model/login_model.dart';
import 'package:flutter_login_dummyjson/widgets/tab_and_show_item.dart';
import 'package:flutter_login_dummyjson/widgets/text_and_searchbar.dart';

class HomeWidget extends StatefulWidget {
  final LoginModel? loginModel;
  const HomeWidget({super.key, required this.loginModel});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
