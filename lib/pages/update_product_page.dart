import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/sharedComponent/button.dart';
import 'package:store_app/sharedComponent/textfield.dart';

class UpdateProductPage extends StatefulWidget {
  static String id = 'update product';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, desc, image;

  String? price;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Update Product',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                CustomTextFormField(
                  onchange: (data) {
                    productName = data;
                  },
                  hint: 'add Product Name',
                  label: const Text('Product Name',
                      style: TextStyle(color: Colors.black)),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  onchange: (data) {
                    desc = data;
                  },
                  hint: 'add description',
                  label: const Text('description',
                      style: TextStyle(color: Colors.black)),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  onchange: (data) {
                    price = data;
                  },
                  label: const Text('price',
                      style: TextStyle(color: Colors.black)),
                  hint: 'add price',
                  inputType: TextInputType.number,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  onchange: (data) {
                    image = data;
                  },
                  hint: 'add image url',
                  label: const Text('image',
                      style: TextStyle(color: Colors.black)),
                ),
                const SizedBox(
                  height: 70,
                ),
                CustomButton(
                  text: 'Update',
                  ontap: () async {
                    isLoading = true;
                    setState(() {});
                    try {
                      await updateProduct(product);

                      print('success');
                    } catch (e) {
                      print(e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProduct().updateProduct(
        id: product.id,
        title: productName == null ? product.title : productName!,
        price: price == null ? product.price.toString() : price!,
        desc: desc == null ? product.description : desc!,
        image: image == null ? product.image : image!,
        category: product.category);
  }
}
