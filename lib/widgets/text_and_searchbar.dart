import 'package:flutter/material.dart';
import 'package:flutter_login_dummyjson/model/login_model.dart';

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
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
//SearchBar*****************************************************
          const SizedBox(
            height: 50,
            child: SearchBar(
              leading: Padding(
                padding: EdgeInsets.only(left: 10),
                child: FaIcon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: Colors.black38,
                ),
              ),
              elevation: MaterialStatePropertyAll(0),
              hintStyle: MaterialStatePropertyAll(
                TextStyle(color: Colors.black26, fontSize: 15),
              ),
              hintText: 'Search Product',
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  side: BorderSide(
                    color: Colors.black26,
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
