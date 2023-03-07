import 'package:flutter/material.dart';

class ProductModel {
  final String productName;
  final String description;
  final double mainPrice;
  final double discountPrice;
  int quantity;
  final List<String> imagesList;
  final List<Color> colorList;

  ProductModel(
      {required this.productName,
      required this.description,
      required this.mainPrice,
      required this.discountPrice,
      required this.quantity,
      required this.imagesList,
      required this.colorList});

  static List<ProductModel> productLists = [
    ProductModel(
        productName: 'productName1',
        description: 'description1',
        mainPrice: 900,
        discountPrice: 700,
        quantity: 2,
        imagesList: [
          'https://images.unsplash.com/photo-1673018183934-500edd0f3e3b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDI3fEJuLURqcmNCcndvfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
          'https://images.unsplash.com/photo-1672437737290-f9e1e2df7461?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDMxfEJuLURqcmNCcndvfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60'
        ],
        colorList: [
          Colors.red,
          Colors.pink,
        ]),
    ProductModel(
        productName: 'productName2',
        description: 'description2',
        mainPrice: 9100,
        discountPrice: 7200,
        quantity: 5,
        imagesList: [
          'https://images.unsplash.com/photo-1675106646184-b0d4bfcde540?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDM1fEJuLURqcmNCcndvfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
          'https://images.unsplash.com/photo-1671797820999-34976e5218d9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDM0fEJuLURqcmNCcndvfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60'
        ],
        colorList: [
          Colors.green,
          Colors.greenAccent,
        ]),
    ProductModel(
        productName: 'productName3',
        description: 'description3',
        mainPrice: 1900,
        discountPrice: 1700,
        quantity: 4,
        imagesList: [
          'https://images.unsplash.com/photo-1674997636824-fade8b767f38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDM3fEJuLURqcmNCcndvfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
          'https://images.unsplash.com/photo-1673586688602-c307a1d2904f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDQyfEJuLURqcmNCcndvfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
          'https://plus.unsplash.com/premium_photo-1664442990583-43a42393fd87?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDQ2fEJuLURqcmNCcndvfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
          'https://images.unsplash.com/photo-1668879109759-696729a15215?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDUwfEJuLURqcmNCcndvfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60,'
        ],
        colorList: [
          Colors.blue,
          Colors.grey,
        ]),
    ProductModel(
        productName: 'productName4',
        description: 'description4',
        mainPrice: 8900,
        discountPrice: 1700,
        quantity: 3,
        imagesList: [
          'https://images.unsplash.com/photo-1671316149446-4da1e921c007?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDU1fEJuLURqcmNCcndvfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
          'https://images.unsplash.com/photo-1671081751060-794ead3bcbaa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDUzfEJuLURqcmNCcndvfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60'
        ],
        colorList: [
          Colors.amber,
          Colors.orange,
        ]),
  ];
}
