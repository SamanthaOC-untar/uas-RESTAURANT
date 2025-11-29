import 'package:flutter/material.dart';
import 'food.dart';

class Shop extends ChangeNotifier {
  final List<Food> _foodMenu = [
    // food menu
    // salmon
    Food(
      name: "Salmon Sushi",
      price: "2.00",
      imagePath: "lib/images/sushi1.png",
      rating: "4.9",
      description:
          "A smooth and buttery slice of fresh salmon served over perfectly seasoned sushi rice. Known for its rich flavor and melt-in-your-mouth texture.",
    ),

    // tuna
    Food(
      name: "Tuna Sushi",
      price: "3.00",
      imagePath: "lib/images/sushi2.png",
      rating: "4.3",
      description:
          "Tender, lean tuna placed on top of vinegared rice. Clean, bold, and slightly sweet taste that appeals to classic sushi lovers.",
    ),

    // belut
    Food(
      name: "Unagi Sushi",
      price: "3.00",
      imagePath: "lib/images/sushi5.png",
      rating: "4.0",
      description:
          "Grilled freshwater eel glazed with a sweet savory sauce. Rich, smoky, and slightly caramelized, offering a deep and comforting flavor.",
    ),

    // kepiting
    Food(
      name: "Kani Sushi",
      price: "1.00",
      imagePath: "lib/images/sushi6.png",
      rating: "3.9",
      description:
          "Sweet and delicate crab meat served on sushi rice. Light, refreshing, and perfect for those who enjoy gentle seafood flavors.",
    ),

    // gurita
    Food(
      name: "Ika Sushi",
      price: "4.00",
      imagePath: "lib/images/sushi7.png",
      rating: "4.3",
      description:
          "Soft yet slightly chewy squid paired with sushi rice. Mild in taste with a clean ocean freshness and smooth texture.",
    ),

    // rumput laut
    Food(
      name: "Chuka Wakame",
      price: "1.00",
      imagePath: "lib/images/sushi8.png",
      rating: "3.7",
      description:
          "A seasoned seaweed salad with a slightly sweet, tangy, and sesame-rich flavor. Crunchy, refreshing, and vibrant in color.",
    ),

    // bulu b2
    Food(
      name: "Uni Sushi",
      price: "5.00",
      imagePath: "lib/images/sushi9.png",
      rating: "4.5",
      description:
          "Premium sea urchin with a creamy, custard-like texture and a rich oceanic flavor. Delicate, luxurious, and prized among sushi enthusiasts.",
    ),

    // makarel
    Food(
      name: "Saba Sushi",
      price: "2.00",
      imagePath: "lib/images/sushi10.png",
      rating: "4.0",
      description:
          "Cured mackerel with a bold, savory taste and firm texture. Slightly salty and tangy, perfect for those who enjoy strong traditional flavors.",
    ),
  ];
  //customer cart
  List<Food> _cart = [];

  int get cartItemCount => _cart.length;

  //getter methods
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  //add to cart method
  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  //remove from cart method
  void removeFromCart(Food foodItem) {
    _cart.remove(foodItem);
    notifyListeners();
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }
}
