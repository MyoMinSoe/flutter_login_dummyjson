import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_login_dummyjson/model/product_model.dart';
import 'package:flutter_login_dummyjson/widgets/detail_product.dart';

class SearchProduct extends SearchDelegate {
  List<ProductElement> productElementList;
  SearchProduct({required this.productElementList});
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back,
          size: 25,
          color: Colors.black26,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<ProductElement> searchProductElement = productElementList
        .where((element) =>
            element.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Found ${searchProductElement.length.toString()} items',
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemCount: searchProductElement.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (c) => DetailProduct(
                              product: searchProductElement[index]),
                        ),
                      );
                    },
                    child: Container(
                      color: Colors.amber,
                      width: 150,
                      height: 300,
                      child: Column(
                        children: [
                          const Row(
                            children: [
                              Spacer(),
                              Icon(Icons.favorite_outline),
                            ],
                          ),
                          SizedBox(
                            width: 130,
                            height: 200,
                            child: Image.network(
                              searchProductElement[index].thumbnail,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Text(searchProductElement[index].brand),
                          Text('\$ ${productElementList[index].price}')
                        ],
                      ),
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<ProductElement> searchProductElement = productElementList
        .where((element) =>
            element.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return query.isEmpty
        ? const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('no data found'))
        : Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Found ${searchProductElement.length.toString()} items',
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 600,
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemCount: searchProductElement.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (c) => DetailProduct(
                                  product: searchProductElement[index]),
                            ),
                          );
                        },
                        child: Container(
                            color: Colors.amber,
                            width: 200,
                            height: 300,
                            child: ListView(children: [
                              Icon(Icons.favorite),
                              SizedBox(
                                height: 200,
                                child: Image.network(
                                  width: 100,
                                  height: 100,
                                  searchProductElement[index].thumbnail,
                                ),
                              ),
                              Text(searchProductElement[index].brand),
                              Text('\$${searchProductElement[index].price}')
                            ])),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
  }
}
