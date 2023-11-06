import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_all_prodct.dart';
import 'package:store_app/sharedComponent/card_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static String id = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          centerTitle: true,
          title: const Text("New Trend", style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  FontAwesomeIcons.cartShopping,
                  color: Colors.black,
                ))
          ]),
      body:  Padding(
        padding: const EdgeInsets.only(left: 10,right: 10,top: 110),
        child: FutureBuilder<List<ProductModel>>(
          future: AllProductsService().getAllProducts(),
          builder: (context,snapshot){
           if(snapshot.hasData){
             List<ProductModel> products =snapshot.data!;
             return GridView.builder(
               physics: const BouncingScrollPhysics(),
               itemCount: products.length,
               clipBehavior: Clip.none,
               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 2,
                 mainAxisSpacing: 95,
                 crossAxisSpacing: 10,
                 childAspectRatio:1.55,
               ),
               itemBuilder: (context, index) {
                 return  CustomCard(product: products[index],);
               },
             );
           }else
             {
               return const Center(child: CircularProgressIndicator());
             }
          },
        )
      ),
    );
  }
}
