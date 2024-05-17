import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_dummyjson/widgets/detail_product.dart';

import '../model/product_model.dart';
import 'package:flutter_login_dummyjson/service/api_service.dart';

class TabAndShowItem extends StatefulWidget {
  const TabAndShowItem({super.key});

  @override
  State<TabAndShowItem> createState() => _TabAndShowItemState();
}

class _TabAndShowItemState extends State<TabAndShowItem>
    with TickerProviderStateMixin {
  late TabController tabController;

  final scrollController = ScrollController();
  final myController = ScrollController();

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
    myController.addListener(() {
      if (myController.offset == myController.position.maxScrollExtent) {
        getProductList();
      }
    });

    tabController = TabController(length: 7, vsync: this);
  }

  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return Column(
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
        const SizedBox(height: 15),
        //Up to 50% Off and Item//******************************************************
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.21,
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
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                width: MediaQuery.of(context).size.width * 0.9,
                // height: MediaQuery.of(context).size.height * 0.2,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black12,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Up to\n${productList[index].discountPercentage}%\nOff',
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w900,
                            color: Color.fromARGB(255, 108, 33, 57),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (c) =>
                                    DetailProduct(product: productList[index]),
                              ),
                            );
                          },
                          child: Image.network(
                            productList[index].images.last,
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: MediaQuery.of(context).size.height * 0.13,
                            fit: BoxFit.contain,
                          ),
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
        const SizedBox(height: 20),
        //Recommended For You and Items//***********************************************
        const Row(
          children: [
            Text(
              'Recommended for you',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700),
            ),
            Spacer()
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: ListView.builder(
            itemExtent: 200,
            scrollDirection: Axis.horizontal,
            controller: myController,
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
                margin: const EdgeInsets.only(right: 25),
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.45,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: MediaQuery.of(context).size.height * 0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black12,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Spacer(),
                              IconButton(
                                onPressed: () {
                                  if (mounted) {
                                    setState(() {
                                      if (isFavourite == false) {
                                        isFavourite == true;
                                      } else if (isFavourite == true) {
                                        isFavourite == false;
                                      }
                                    });
                                  }
                                },
                                icon: isFavourite
                                    ? const Icon(
                                        Icons.favorite,
                                        color: Color.fromARGB(255, 223, 52, 94),
                                        size: 25,
                                      )
                                    : const Icon(
                                        Icons.favorite_outline,
                                        color: Colors.black38,
                                        size: 25,
                                      ),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (c) => DetailProduct(
                                      product: productList[index]),
                                ),
                              );
                            },
                            child: Image.network(
                              productList[index].thumbnail,
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: MediaQuery.of(context).size.height * 0.12,
                              fit: BoxFit.fitWidth,
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          productList[index].brand,
                          style: const TextStyle(fontSize: 15),
                        ),
                        const Spacer()
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '\$${productList[index].price}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
