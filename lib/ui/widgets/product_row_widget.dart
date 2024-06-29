import 'package:ecom_app/data/models/products.dart';
import 'package:ecom_app/ui/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';

class ProductRow extends StatelessWidget {
  const ProductRow({super.key, required this.currentProduct});
  final Products currentProduct;

  @override
  Widget build(BuildContext context) {
    return ListTile(
            leading: Image.network(currentProduct.images!.first, 
            width: 75,
            fit: BoxFit.fitWidth,),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => 
                ProductDetailScreen(productid: currentProduct.id.toString())));
            },
            title: Text(currentProduct.title!),
            subtitle: Text(currentProduct.description!),
            trailing: Text(currentProduct.price.toString()),
          );
  }
}