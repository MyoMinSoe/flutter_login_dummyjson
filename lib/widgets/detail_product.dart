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
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(),
              Stack(
                children: [
                  Image.network(
                    product.thumbnail,
                    width: MediaQuery.of(context).size.width * 0.9,
                    fit: BoxFit.contain,
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      color: const Color.fromARGB(255, 223, 52, 94),
                      child: Text(
                        'ID : ${product.id.toString()}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
              //Title************************************
              Text(
                product.title,
                style: const TextStyle(
                    color: Color.fromARGB(255, 108, 33, 57),
                    fontSize: 35,
                    fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 10),
              //Brand and Category*************************
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 223, 52, 94),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          product.brand,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w500),
                        ),
                        const Spacer()
                      ],
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        const Text(
                          'Category - ',
                          style: TextStyle(
                            fontSize: 17,
                            color: Color.fromARGB(255, 108, 33, 57),
                          ),
                        ),
                        Text(
                          product.category.toUpperCase(),
                          style: const TextStyle(
                              color: Color.fromARGB(255, 108, 33, 57),
                              fontSize: 20,
                              fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //Description***************************************************
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Text(
                  textAlign: TextAlign.center,
                  product.description,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.black87,
                  ),
                ),
              ),
              Container(
                height: 2,
                color: const Color.fromARGB(255, 223, 52, 94),
              ),
              //Rating**********************************************************
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
              const SizedBox(height: 30),
              //DiscountPercentage and Price***********************************
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 223, 52, 94),
                  border: Border.all(
                    color: Colors.amber,
                    width: 5,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.discount,
                          size: 70,
                          color: Colors.amber,
                        ),
                        Text(
                          '${product.discountPercentage.toString()}% Discount',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '\$${product.price.toString()}',
                      style: const TextStyle(
                        color: Colors.amber,
                        fontSize: 60,
                        fontWeight: FontWeight.w900,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              //Stock********************************************************
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    const Text(
                      'Availiable 👉',
                      style: TextStyle(fontSize: 30),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.shopping_cart_sharp,
                      size: 40,
                    ),
                    Text(
                      '(${product.stock.toString()})',
                      style: const TextStyle(fontSize: 30),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              //Images[]********************************************************
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: product.images.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Image.network(
                        product.images[index],
                        width: MediaQuery.of(context).size.width * 0.7,
                      ),
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
