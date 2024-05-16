import 'package:flutter/material.dart';
import 'package:flutter_login_dummyjson/model/login_model.dart';
import 'package:flutter_login_dummyjson/service/api_service.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../model/product_model.dart';

class ProductList extends StatefulWidget {
  final LoginModel? myLoginModel;
  const ProductList({super.key, required this.myLoginModel});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final scrollController = ScrollController();
  List<ProductElement> productList = [];
  int skip = 0;
  int total = 0;
  bool isLoading = false;

  getProductList() async {
    if (skip > 0 && skip >= total) {
      isLoading = false;
      return; //break -> if(){}
    }
    setState(() {
      isLoading = true;
    });

    Product? product = await getAllProduct(skip);
    if (product != null) {
      var temp = product.products;
      productList.addAll(temp);
      skip = product.skip + product.limit;
      total = product.total;
      isLoading = false;
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    getProductList();
    scrollController.addListener(() {
      if (scrollController.offset ==
          scrollController.position.maxScrollExtent) {
        getProductList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.width * 0.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi, ${widget.myLoginModel!.firstName} ${widget.myLoginModel!.lastName} ',
                  style: const TextStyle(fontSize: 20),
                ),
                const Text(
                  'Choose Your Favourite Product',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
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
          ),
        ],
      ),
    );
  }
}
