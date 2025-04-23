import 'package:flutter/material.dart';
import '../models/food_model.dart';
import '../widgets/food_card.dart';
import '../widgets/popular_food_card.dart';
import 'food_detail_screen.dart';
import 'payment_screen.dart';
import 'onboarding_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Food> _cartItems = [];
  final List<Food> foodMenu =   [
    Food(
      name: "Tuna Sushi",
      image: "assets/tuna_sushi.png",
      description: "Delicious tuna sushi",
      price: 20.0,
      rating: 4.5,
    ),
    Food(
      name: "Sushi Promo",
      image: "assets/sushi_promo.png",
      description: "Delicious sushi",
      price: 21.0,
      rating: 4.8,
    ),
    Food(
      name: "Salmon Sushi",
      image: "assets/salmon_sushi.png",
      description: "Delicious salmon sushi",
      price: 21.0,
      rating: 4.8,
    ),
    Food(
      name: "Tempura",
      image: "assets/tempura.png",
      description: "Japanese fried dish",
      price: 7.99,
      rating: 4.6,
    ),
    Food(
      name: "Ramen",
      image: "assets/ramen.png",
      description: "Japanese noodle soup",
      price: 12.99,
      rating: 4.8,
    ),
    Food(
      name: "Miso Soup",
      image: "assets/mis_soup.png",
      description: "Traditional Japanese soup",
      price: 5.99,
      rating: 4.5,
    ),
    Food(
      name: "Nabe",
      image: "assets/nab.png",
      description: "Traditional Japanese hot pot with fresh ingredients",
      price: 21.00,
      rating: 4.8,
    ),
    Food(
      name: "Onigiri",
      image: "assets/oni.png",
      description: "Japanese rice balls",
      price: 3.99,
      rating: 4.7,
    ),





  ];

  final List<Food> popularFood =   [
    Food(
      name: "Salmon Eggs",
      image: "assets/salmon_eggs.png",
      description: "Popular salmon eggs",
      price: 15.0,
      rating: 4.9,
    ),
    Food(
      name: "Dango",
      image: "assets/dang.png",
      description: "A Japanese sweet dumpling made from rice flour and served on a skewer",
      price: 21.0,
      rating: 4.8,
    ),

  ];

  void _addToCart(Food food) {
    setState(() {
      final index = _cartItems.indexWhere((item) => item.name == food.name);
      if (index >= 0) {
        _cartItems[index] = _cartItems[index].copyWith(
          quantity: _cartItems[index].quantity + food.quantity,
        );
      } else {
        _cartItems.add(food);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tokyo"),
        backgroundColor: const Color(0xffA94438), // Red app bar color
        foregroundColor: Colors.white, // White text and icons
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentScreen(cartItems: _cartItems),
                    ),
                  );
                },
              ),
              if (_cartItems.isNotEmpty)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      _cartItems.length.toString(),
                      style: const TextStyle(
                        color: Color(0xffA94438),
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const OnboardingScreen()),
            );
          },
        ),

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/sushi_promo.png',
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                "Food Menu",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: foodMenu.length,
                  itemBuilder: (context, index) => FoodCard(
                    food: foodMenu[index],
                    onAddToCart: (food) {
                      _addToCart(food);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${food.name} added to cart'),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                "Popular Food",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              ...popularFood.map((food) => PopularFoodCard(
                food: food,
                onAddToCart: (food) {
                  _addToCart(food);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${food.name} added to cart'),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
              )).toList(),
            ],
          ),
        ),
      ),
    );
  }
}