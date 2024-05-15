import 'package:flutter/material.dart';
import 'package:flutter_login_dummyjson/service/api_service.dart';

import '../model/product_model.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: const ProductList(),
    );
  }
}

class ProductList extends StatefulWidget {
  const ProductList({super.key});

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
    return Container(
      color: const Color.fromARGB(255, 223, 52, 94),
      child: Center(
        child: ListView.builder(
            controller: scrollController,
            itemCount: productList.length,
            itemBuilder: (context, index) {
              if (productList.length - 1 == index && isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Card(
                color: Colors.orange,
                child: ListTile(
                  leading: Image.network(
                    productList[index].thumbnail,
                    width: 80,
                  ),
                  title: Text(productList[index].title),
                  subtitle: Text(productList[index].price.toString()),
                  trailing: Text(
                    'ID - ${productList[index].id.toString()}',
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
