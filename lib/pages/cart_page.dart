import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant1/components/button.dart';
import 'package:restaurant1/models/shop.dart';
import 'package:restaurant1/pages/order_summary_page.dart';
import 'package:restaurant1/themes/colors.dart';
import '../models/food.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  //remove from cart
  void removeFromCart(Food food, BuildContext context) {
    //get access to the shop
    final shop = context.read<Shop>();

    shop.removeFromCart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          title: const Text(
            'Cart Page',
            style: TextStyle(color: Colors.white),
          ),
          elevation: 0,
          backgroundColor: primaryColor,
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
        ),
        body: Column(
          children: [
        
            Expanded(
              child: ListView.builder(
                itemCount: value.cart.length,
                itemBuilder:(context, index) {
                //get food from the cart
                final Food food = value.cart[index];
                //get food name
                final String foodName = food.name;
                //get food price
                final String foodPrice = food.price;
              
                //return list tile
                return Container(
                  decoration: BoxDecoration(color:secondaryColor, borderRadius: BorderRadius.circular(8),
                  ),
                  margin: const EdgeInsets.only(left:20, top:20, right:20),
                  child:
                      //Customer Cart
                      ListTile(
                        title: Text(foodName, style: TextStyle(
                          color: Colors.white, 
                          fontWeight: FontWeight.bold
                          ), 
                        ),
                        subtitle: Text(foodPrice, style: TextStyle(
                          color: Colors.grey[200], 
                          ),  
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.grey[300]),
                          onPressed: () => removeFromCart(food, context), 
                        ),
                      ),
                );
              }
              ),
            ),
            //PAY BUTTON
            if(value.cart.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: MyButton(text: "Order Now", 
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderSummaryPage(
                        orderedItems: List.from(value.cart),
                      ),
                    ),
                  );
                },),
              )
          ],
        )
    )
    );
  }
}