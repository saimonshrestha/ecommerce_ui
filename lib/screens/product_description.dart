import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_ui/models/product_model.dart';
import 'package:ecommerce_ui/screens/homepage.dart';
import 'package:flutter/material.dart';

class ProductDescription extends StatefulWidget {
  const ProductDescription({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  int currentPage = 0;
  bool changeIndicator = false;
  final CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: iconWidget(
              icon: Icons.keyboard_arrow_left,
              onTap: () {
                Navigator.pop(context);
              }),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child:
                iconWidget(icon: Icons.favorite_outline_rounded, onTap: () {}),
          )
        ],
      ),
      body: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              CarouselSlider(
                  carouselController: carouselController,
                  items: widget.productModel.imagesList
                      .map((e) => Padding(
                            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                            child: CachedNetworkImage(
                                height: 250,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover,
                                imageUrl: e),
                          ))
                      .toList(),
                  options: CarouselOptions(
                    viewportFraction: 0.9,
                    initialPage: currentPage,
                    onPageChanged: (value, reason) {
                      setState(() {
                        currentPage = value;
                        changeIndicator = !changeIndicator;
                      });
                    },
                    aspectRatio: 12 / 9,
                    autoPlay: false,
                  )),
              Positioned(
                bottom: 20,
                child: CarouselIndicator(
                  count: widget.productModel.imagesList.length,
                  height: 7.5,
                  width: 7.5,
                  cornerRadius: 5,
                  activeColor: Colors.yellow,
                  color: Colors.grey.shade700,
                  index: currentPage,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: Container(
                width: double.infinity,
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.fromLTRB(23, 35, 23, 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.productModel.productName,
                      style: const TextStyle(
                          fontSize: 35,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      widget.productModel.description,
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          ...List.generate(
                              widget.productModel.colorList.length,
                              (index) => InkWell(
                                    onTap: () {
                                      carouselController.animateToPage(index);
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(2.5),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: currentPage == index
                                                  ? Colors.black
                                                  : Colors.white)),
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                            color: widget
                                                .productModel.colorList[index],
                                            shape: BoxShape.circle),
                                      ),
                                    ),
                                  ))
                        ]),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            children: [
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      widget.productModel.quantity--;
                                    });
                                  },
                                  child: const Icon(Icons.remove)),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                '${widget.productModel.quantity}',
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    widget.productModel.quantity++;
                                  });
                                },
                                child: const Icon(
                                  Icons.add_circle,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              '\$${widget.productModel.discountPrice.toStringAsFixed(0)}',
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              widget.productModel.mainPrice.toStringAsFixed(0),
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.lineThrough),
                            ),
                          ],
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(
                                      15,
                                    ),
                                    backgroundColor: Colors.black),
                                onPressed: () {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                          content: Text(
                                    'Added to Cart',
                                  )));
                                },
                                child: const Text(
                                  'Add to Cart',
                                  style: TextStyle(color: Colors.white),
                                )),
                          ),
                        )
                      ],
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
