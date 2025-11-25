import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:restaurant1/models/shop.dart';
import 'package:restaurant1/themes/colors.dart';
import '../models/food.dart';

class OrderSummaryPage extends StatelessWidget {
  final List<Food> orderedItems;

  const OrderSummaryPage({super.key, required this.orderedItems});

  // Calculate total price
  double calculateTotal() {
    double total = 0;
    for (var item in orderedItems) {
      total += double.parse(item.price);
    }
    return total;
  }

  // Group items by name and count quantity
  Map<String, Map<String, dynamic>> groupItems() {
    Map<String, Map<String, dynamic>> groupedItems = {};

    for (var item in orderedItems) {
      if (groupedItems.containsKey(item.name)) {
        groupedItems[item.name]!['quantity']++;
      } else {
        groupedItems[item.name] = {'food': item, 'quantity': 1};
      }
    }

    return groupedItems;
  }

  @override
  Widget build(BuildContext context) {
    final groupedItems = groupItems();

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text('Order Summary'),
        elevation: 0,
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Order Status Card
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: Colors.green[400],
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.green,
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.check_circle,
                    color: Colors.green[400],
                    size: 40,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order Confirmed!',
                        style: GoogleFonts.dmSerifDisplay(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Your order has been received',
                        style: GoogleFonts.dmSerifDisplay(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Order Details
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Order Details',
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
            ),
          ),

          const SizedBox(height: 15),

          // Ordered Items List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: groupedItems.length,
              itemBuilder: (context, index) {
                final itemName = groupedItems.keys.elementAt(index);
                final itemData = groupedItems[itemName]!;
                final Food food = itemData['food'];
                final int quantity = itemData['quantity'];
                final double itemTotal = double.parse(food.price) * quantity;

                return Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      // Food Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          food.imagePath,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),

                      const SizedBox(width: 15),

                      // Food Details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              food.name,
                              style: GoogleFonts.dmSerifDisplay(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Quantity: $quantity',
                              style: GoogleFonts.dmSerifDisplay(
                                color: Colors.grey[600],
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Price
                      Text(
                        '\$${itemTotal.toStringAsFixed(2)}',
                        style: GoogleFonts.dmSerifDisplay(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: secondaryColor,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Total Section
          Container(
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Items:',
                      style: TextStyle(color: Colors.grey[400], fontSize: 16),
                    ),
                    Text(
                      '${orderedItems.length}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                const Divider(color: Colors.grey),

                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Amount:',
                      style: GoogleFonts.dmSerifDisplay(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '\$${calculateTotal().toStringAsFixed(2)}',
                      style: GoogleFonts.dmSerifDisplay(
                        color: secondaryColor,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                // Back to Menu Button
                GestureDetector(
                  onTap: () {
                    // Clear cart and go back to menu
                    final shop = context.read<Shop>();
                    shop.clearCart();
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/menupage',
                      (route) => false,
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Back to Menu',
                          style: GoogleFonts.dmSerifDisplay(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Icon(Icons.restaurant_menu, color: Colors.black),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
