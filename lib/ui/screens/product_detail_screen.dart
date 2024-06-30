import 'dart:developer';

import 'package:ecom_app/data/models/products.dart';
import 'package:ecom_app/data/repos/product_repo.dart';
import 'package:ecom_app/utils/constants.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key, required this.productid});
  final String productid;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {

Products? product;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProducts();

  }
  
 Future getProducts() async{
    final ProductRepo _productRepo= ProductRepo();
   product= await _productRepo.getProductFromId(productid: widget.productid);
  setState(() {
    
  });
 }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Product Details'),
      ),
      body: product==null ? 
        const Center(
        child:  CircularProgressIndicator(
          color: Colors.amber,
        ),
      )
      :Center(
        child: Column(
          children: [
            Text(product!.title!),
            Image.network(product!.images!.first, 
            width: 200,fit: BoxFit.cover,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(product!.description!),
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(onPressed: () {
                if(product!=null)
                {
                  
                  cartList.add(product!);
                  log(cartList.length.toString());
                 
                }
              }
              , child: const Text('Add To Card')
              ),
            )

          ],
        ),
      ),
   
    );
  }
}