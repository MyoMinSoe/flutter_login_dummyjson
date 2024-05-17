import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Search',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.black38,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
                width: MediaQuery.of(context).size.width * 0.75,
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
            ),
            const Icon(
              FontAwesomeIcons.sliders,
              size: 35,
              color: Colors.black38,
            )
          ],
        ),
      ),
    );
  }
}
