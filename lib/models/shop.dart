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
    ),

    // tuna
    Food(
      name: "Tuna Sushi",
      price: "3.00",
      imagePath: "lib/images/sushi2.png",
      rating: "4.3",
    ),

    // belut
    Food(
      name: "Unagi Sushi",
      price: "3.00",
      imagePath: "lib/images/sushi5.png",
      rating: "4.0",
    ),

    // kepiting
    Food(
      name: "Kani Sushi",
      price: "1.00",
      imagePath: "lib/images/sushi6.png",
      rating: "3.9",
    ),

    // gurita
    Food(
      name: "Ika Sushi",
      price: "4.00",
      imagePath: "lib/images/sushi7.png",
      rating: "4.3",
    ),

    // rumput laut
    Food(
      name: "Chuka Wakame",
      price: "1.00",
      imagePath: "lib/images/sushi8.png",
      rating: "3.7",
    ),

    // bulu b2
    Food(
      name: "Uni Sushi",
      price: "5.00",
      imagePath: "lib/images/sushi9.png",
      rating: "4.5",
    ),

    // makarel
    Food(
      name: "Saba Sushi",
      price: "2.00",
      imagePath: "lib/images/sushi10.png",
      rating: "4.0",
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
