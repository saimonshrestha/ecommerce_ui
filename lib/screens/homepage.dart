import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_ui/screens/product_description.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';

import '../models/product_model.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // ProductModel? productModel;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            rowIcons(),
            const SizedBox(height: 25, width: 0),
            RichText(
                text: const TextSpan(children: [
              TextSpan(
                text: 'We have prepared new products',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 26,
                    wordSpacing: 2.5),
              ),
              TextSpan(
                text: ' for you  ',
                style: TextStyle(
                    color: Colors.yellow,
                    fontWeight: FontWeight.normal,
                    fontSize: 26,
                    wordSpacing: 2.5),
              ),
              WidgetSpan(
                  child: Iconify(
                Mdi.hand_peace_variant,
                color: Colors.yellow,
              )),
            ])),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Form(
                    key: formKey,
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.search,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: const TextStyle(color: Colors.white),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        fillColor: Colors.grey.shade700,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                color: Colors.red, width: 1.5)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This field is required';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                iconWidget(icon: Icons.filter_3, onTap: () {}, showCirlce: true)
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Products',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            const SizedBox(
              height: 15,
            ),
            GridView.builder(
              shrinkWrap: true,
              primary: false,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 15,
                  mainAxisExtent: 250),
              itemCount: ProductModel.productLists.length,
              itemBuilder: (context, index) {
                var productDatas = ProductModel.productLists[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductDescription(
                                  productModel: productDatas,
                                )));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      height: 150,
                      width: 150,
                      imageUrl: productDatas.imagesList.first,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
              // staggeredTileBuilder: (value) {
              // return value % 2 == 0
              //     ? const StaggeredTile.count(2, 3)
              //     : const StaggeredTile.count(2, 2);
              //   return const StaggeredTile.count(1, 2);
              // }
            )
          ],
        ),
      ),
    );
  }
}

Widget rowIcons() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      iconWidget(icon: Icons.sort, onTap: () {}),
      iconWidget(icon: Icons.person, onTap: () {})
    ],
  );
}

Widget iconWidget(
    {required IconData icon,
    required Function() onTap,
    bool showCirlce = false}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(8),
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          borderRadius: showCirlce ? null : BorderRadius.circular(15),
          color: Colors.grey.shade700,
          shape: showCirlce ? BoxShape.circle : BoxShape.rectangle),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    ),
  );
}
