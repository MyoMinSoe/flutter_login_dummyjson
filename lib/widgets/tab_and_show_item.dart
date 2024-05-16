import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../model/product_model.dart';
import 'package:flutter_login_dummyjson/service/api_service.dart';

class TabAndShowItem extends StatefulWidget {
  const TabAndShowItem({super.key});

  @override
  State<TabAndShowItem> createState() => _TabAndShowItemState();
}

class _TabAndShowItemState extends State<TabAndShowItem>
    with TickerProviderStateMixin {
  bool isFavourite = false;
  Icon favouriteIcon = const Icon(
    Icons.favorite_outline,
    color: Colors.black38,
    size: 40,
  );
  late TabController tabController;

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
    if (mounted) {
      setState(() {
        isLoading = true;
      });
    }
    setState(() {});

    Product? product = await getAllProduct(skip);

    if (product != null) {
      var temp = product.products;
      productList.addAll(temp);
      skip = product.skip + product.limit;
      total = product.total;
      isLoading = false;
      if (mounted) {
        setState(() {});
      }
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
    tabController = TabController(length: 7, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ButtonsTabBar(
            unselectedLabelStyle: const TextStyle(color: Colors.black45),
            labelStyle: const TextStyle(color: Colors.white),
            radius: 7,
            borderColor: Colors.transparent,
            unselectedBorderColor: Colors.black26,
            borderWidth: 2,
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            backgroundColor: const Color.fromARGB(255, 223, 52, 94),
            unselectedBackgroundColor: Colors.transparent,
            controller: tabController,
            tabs: const [
              Tab(text: 'Adidas'),
              Tab(text: 'Nike'),
              Tab(text: 'Puma'),
              Tab(text: 'Superga'),
              Tab(text: 'Clarks'),
              Tab(text: 'Converse'),
              Tab(text: 'Crocs'),
            ],
          ),
//Up to 50% Off and Item//******************************************************
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              controller: scrollController,
              itemCount: productList.length,
              itemBuilder: (BuildContext context, int index) {
                if (productList.length - 1 == index && isLoading) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                return Container(
                  margin: const EdgeInsets.only(right: 30),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black12,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Up to\n${productList[index].discountPercentage}%\nOff',
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                              color: Color.fromARGB(255, 108, 33, 57),
                            ),
                          ),
                          Image.network(
                            productList[index].images.last,
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: MediaQuery.of(context).size.height * 0.15,
                            fit: BoxFit.fitWidth,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3)),
                              textStyle: const TextStyle(fontSize: 15),
                              backgroundColor:
                                  const Color.fromARGB(255, 223, 52, 94),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                            ),
                            onPressed: () {},
                            child: const Text('Shop Now'),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
//Recommended For You and Items//***********************************************
          const Text(
            'Recommended for you',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.45,
                  margin: const EdgeInsets.only(right: 25),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black12,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: favouriteIcon,
                          ),
                        ],
                      ),
                      Image.network(
                        productList[0].thumbnail,
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.height * 0.12,
                        fit: BoxFit.fitWidth,
                      )
                    ],
                  ),
                ),
                Text(
                  'title',
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  '\$458',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
