import 'package:flutter/material.dart';
import '../models/food_model.dart';
import '../screens/food_detail_screen.dart';

class PopularFoodCard extends StatelessWidget {
  final Food food;
  final Function(Food) onAddToCart;

  const PopularFoodCard({
    required this.food,
    required this.onAddToCart,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8),
      leading: Image.asset(food.image, height: 40),
      title: Text(food.name),
      subtitle: Row(
        children: [
          const Icon(Icons.star, size: 14, color: Colors.orange),
          const SizedBox(width: 4),
          Text("${food.rating}"),
        ],
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => FoodDetailScreen(
            food: food,
            onAddToCart: onAddToCart,
          ),
        ),
      ),
    );
  }
}