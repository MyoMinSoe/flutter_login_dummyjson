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
            'Found ${searchProductElement.length.toString()} Items',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                mainAxisExtent: 300,
              ),
              padding: const EdgeInsets.only(bottom: 10),
              itemCount: searchProductElement.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (c) =>
                            DetailProduct(product: searchProductElement[index]),
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Column(
                          children: [
                            const Row(
                              children: [
                                Spacer(),
                                Icon(Icons.favorite_outline),
                              ],
                            ),
                            Image.network(
                              searchProductElement[index].thumbnail,
                              fit: BoxFit.contain,
                              height: 200,
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Text(searchProductElement[index].brand),
                      Text('\$ ${productElementList[index].price}')
                    ],
                  ),
                );
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

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Expanded(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            mainAxisExtent: 300,
          ),
          padding: const EdgeInsets.only(bottom: 10),
          itemCount: searchProductElement.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (c) =>
                        DetailProduct(product: searchProductElement[index]),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            Spacer(),
                            Icon(Icons.favorite_outline),
                          ],
                        ),
                        Image.network(
                          searchProductElement[index].thumbnail,
                          fit: BoxFit.contain,
                          height: 200,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Text(searchProductElement[index].title),
                  Text(
                    '\$ ${productElementList[index].price}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
