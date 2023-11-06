import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/pages/update_product_page.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdateProductPage.id ,arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
           SizedBox(
            /*decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                blurRadius: 5,
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 5,
                blurStyle: BlurStyle.normal,
               // offset: const Offset(10, 10),
              )
            ]),*/
            child: Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      overflow: TextOverflow.ellipsis,
                      product.title,
                      style: const TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$${product.price.toString()}",
                          style: const TextStyle(color: Colors.black, fontSize: 17),
                        ),
                        const Icon(
                          FontAwesomeIcons.heart,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              right: 30,
              bottom: 85,
              child: Image.network(
                product.image,
                height: 120,
                width: 100,
                //height: 60,
              ))
        ],
      ),
    );
  }
}
