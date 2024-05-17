import 'package:flutter/material.dart';
import 'package:flutter_login_dummyjson/model/product_model.dart';

class DetailProduct extends StatelessWidget {
  final ProductElement product;
  const DetailProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: const Text(
          'Product Detail',
          style: TextStyle(color: Colors.black45, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.network(
                    product.thumbnail,
                    width: MediaQuery.of(context).size.width * 0.9,
                    fit: BoxFit.contain,
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      color: Colors.black,
                      child: Text(
                        'ID : ${product.id.toString()}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 20),
                      ),
                    ),
                  )
                ],
              ),
              Text(
                product.title,
                style: const TextStyle(
                    color: Color.fromARGB(255, 108, 33, 57),
                    fontSize: 35,
                    fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    '${product.brand} Co.,Ltd',
                    style: const TextStyle(
                        color: Color.fromARGB(255, 31, 14, 75),
                        fontSize: 25,
                        fontWeight: FontWeight.w400),
                  ),
                  const Spacer(),
                  Text(
                    product.category.toUpperCase(),
                    style: const TextStyle(
                        color: Color.fromARGB(255, 223, 52, 94),
                        fontSize: 20,
                        fontWeight: FontWeight.w800),
                  ),
                ],
              ),
              Text(
                product.description,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Row(
                children: [
                  const Spacer(),
                  Text(
                    'Rating(${product.rating.toString()})',
                    style: const TextStyle(fontSize: 20),
                  ),
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 25,
                  ),
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 25,
                  ),
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 25,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(
                    Icons.discount,
                    size: 50,
                  ),
                  Text(
                    '${product.discountPercentage.toString()}% Discount',
                    style: const TextStyle(
                      color: Color.fromARGB(255, 223, 52, 94),
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: product.images.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Image.network(
                      product.images[index],
                      width: MediaQuery.of(context).size.width * 0.7,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
