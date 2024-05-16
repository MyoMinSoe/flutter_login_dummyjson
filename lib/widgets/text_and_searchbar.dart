import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_login_dummyjson/model/login_model.dart';
import 'package:flutter_login_dummyjson/screen/search_screen.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TextAndSearchBar extends StatefulWidget {
  final LoginModel? myLoginModel;
  const TextAndSearchBar({super.key, required this.myLoginModel});

  @override
  State<TextAndSearchBar> createState() => _TextAndSearchBarState();
}

class _TextAndSearchBarState extends State<TextAndSearchBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.width * 0.3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hi, ${widget.myLoginModel!.firstName} ${widget.myLoginModel!.lastName} ',
            style: const TextStyle(fontSize: 20, color: Colors.black54),
          ),
          const Text(
            'Choose Your Favourite Product',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          //SearchBar************************************************************
          InkWell(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black26, width: 2),
                borderRadius: const BorderRadius.all(Radius.circular(15)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: const Row(
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.black26,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Search Product',
                    style: TextStyle(color: Colors.black26, fontSize: 15),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
