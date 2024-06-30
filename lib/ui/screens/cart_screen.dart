import 'package:ecom_app/data/models/products.dart';
import 'package:ecom_app/utils/constants.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
   
  @override
  Widget build(BuildContext context) {
      final width= MediaQuery.of(context).size.width;
       
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cartList.length,
        itemBuilder: (context, index) {
          Products products=cartList[index];
          return  Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
             child: Row(
              children: [
              Image.network(products.images!.first, 
              width: 75,
              fit: BoxFit.fitWidth,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                
                    SizedBox(
                      width: width*0.55,
                      child: Text(products.title!, 
                      style: const TextStyle(
                      fontWeight: FontWeight.bold, 
                       ),),
                    ),
                    
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: width*0.55,
                    child: Text(products.description!)),
                  ],
                
                ),
              ),
                
            const Spacer(),
             Column(
              crossAxisAlignment: CrossAxisAlignment.end,
               children: [
                  Text('\$${products.price}'),

                  SizedBox(
                    height: 20,
                    child: IconButton(onPressed: () {
                      cartList.removeAt(index);
                      setState(() {
                        
                      });
                      },
                      icon: const Icon(
                       Icons.delete),
                       color: Colors.red,
                       ),
                  )
               ],
             ),
            
              
              ],
             ),
            ),
          );
        },
      )  ,

    );
  }
}