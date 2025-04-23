import 'package:flutter/material.dart';
import '../models/food_model.dart';
import '../screens/food_detail_screen.dart';

class FoodCard extends StatelessWidget {
  final Food food;
  final Function(Food) onAddToCart;

  const FoodCard({
    required this.food,
    required this.onAddToCart,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => FoodDetailScreen(
            food: food,
            onAddToCart: onAddToCart,
          ),
        ),
      ),
      child: Card(
        margin: const EdgeInsets.only(right: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          width: 150,
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Image.asset(food.image, height: 80),
              const SizedBox(height: 8),
              Text(food.name, style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text("\$${food.price}", style: TextStyle(color: Colors.grey[700])),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.star, size: 14, color: Colors.orange),
                  const SizedBox(width: 4),
                  Text("${food.rating}", style: const TextStyle(fontSize: 12)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}// TODO Implement this library.