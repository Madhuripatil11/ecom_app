import 'package:ecom_app/ui/screens/all_products_screen.dart';
import 'package:ecom_app/data/repos/product_repo.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
final ProductRepo _productRepo= ProductRepo();

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProducts();
   
  }

  Future getProducts() async{
   await _productRepo.getProducts(null).then((productList) async{
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (_) => AllProductsScreen(productList: productList))
    //     );
    // // Navigator.pushAndRemoveUntil(context, newRoute, predicate)
    await _productRepo.getCategoryList().then((categoryList) {
       
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => 
      AllProductsScreen(productList: productList, categoryList: categoryList)));
    });
  });

  }

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}