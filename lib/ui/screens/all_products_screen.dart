import 'dart:developer';

import 'package:ecom_app/data/models/category.dart';
import 'package:ecom_app/data/models/products.dart';
import 'package:ecom_app/data/repos/product_repo.dart';
import 'package:ecom_app/ui/widgets/product_row_widget.dart';
import 'package:flutter/material.dart';

class AllProductsScreen extends StatefulWidget {
  const AllProductsScreen({super.key, required this.productList, required this.categoryList,
  });
  final List<Products> productList;
  final List<CategoryModel> categoryList;

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
 
 List<Products>? productList;
 final ProductRepo _productRepo= ProductRepo();
 bool isLoading=false;

 @override
  void initState() {
    super.initState();
    // widget.productList.forEach((product){
    //   print(product.brand);
    // });
    productList=widget.productList;

  }
  @override
  Widget build(BuildContext context) {
    final height= MediaQuery.of(context).size.height;

    return  Scaffold(
      backgroundColor:  Colors.amber,
      appBar: AppBar(
        title: const Text('Products'),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
   
      body: Column(
        children: [
        SizedBox(
        height: 50,
        child: ListView.builder(itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () async {
              isLoading=true;
              setState(() {
                });
                productList= await _productRepo.getProducts(widget.categoryList[index].slug);
                setState(() {
                  isLoading=false;
                });
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(widget.categoryList[index].name),
              ),
            ),
          ),
        );
      },
       
      itemCount: widget.categoryList.length,
      scrollDirection: Axis.horizontal,),
      ),
      isLoading? const Padding(
        padding:  EdgeInsets.only(top: 100.0),
        child: Center(
          child: CircularProgressIndicator(
            
          ),
        ),
      ): SizedBox(
        height: height- 170,
        child: ListView.separated(
          itemCount:productList!.length,
          itemBuilder: (context, index) {
            final currentProduct=productList![index];
            return ProductRow(currentProduct: currentProduct);
          },
         separatorBuilder: (context, index) => const Divider(), 
         ),
      ),
     ]
      )
    );
  }

  Future getProductsByCategory(String categoryName) async{
   productList= await _productRepo.getProductsByCategory(categoryName);
   setState(() {
  
   });
  }
}

