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
      description: "A popular type of nigiri sushi featuring slices of fresh,"
                   " raw tuna placed atop seasoned rice."
                   " It’s known for its smooth texture and rich,"
                   " clean flavor. Tuna is a sushi staple and comes in different grades,"
                   " including lean (akami) and fatty (toro).",
      price: 20.0,
      rating: 4.5,
    ),
    Food(
      name: "Sushi Promo",
      image: "assets/sushi_promo.png",
      description: "This generally refers to a special promotional offer or combo "
                   "that includes a selection of sushi items—often a mix of nigiri,"
                   " maki (rolled sushi), and possibly sashimi—offered at a discounted price "
                   "or as a featured menu item.",
      price: 21.0,
      rating: 4.8,
    ),
    Food(
      name: "Salmon Sushi",
      image: "assets/salmon_sushi.png",
      description: "Another favorite nigiri sushi made"
                   " with a slice of raw salmon laid over a bed of vinegared rice."
                   " Salmon sushi is prized for its buttery texture and mild,"
                   " slightly sweet flavor",
      price: 21.0,
      rating: 4.8,
    ),
    Food(
      name: "Tempura",
      image: "assets/tempura.png",
      description: "A Japanese dish where seafood, vegetables, "
          "or even mushrooms are lightly battered and deep-fried to a crisp"
          " golden finish. Common tempura items include shrimp, sweet potato, and eggplant. "
          "It's often served with dipping sauce and grated daikon.",
      price: 7.99,
      rating: 4.6,
    ),
    Food(
      name: "Ramen",
      image: "assets/ramen.png",
      description: " A beloved noodle soup dish with Chinese-style wheat noodles in a savory broth,"
          " often flavored with soy sauce, miso, or pork bone (tonkotsu)."
          " Toppings include sliced pork, green onions, soft-boiled eggs,"
          " and nori (seaweed).",
      price: 12.99,
      rating: 4.8,
    ),
    Food(
      name: "Miso Soup",
      image: "assets/mis_soup.png",
      description: " A traditional Japanese soup made with dashi (broth) and miso paste,"
          " which is fermented soybean paste. It usually contains tofu, seaweed, and green onions. "
          "It’s commonly served as a starter or side in Japanese meals.",
      price: 5.99,
      rating: 4.5,
    ),
    Food(
      name: "Nabe",
      image: "assets/nab.png",
      description: " A communal hot pot dish where ingredients like sliced meat, "
          "vegetables, tofu, and mushrooms are simmered in a flavorful broth at the table. "
          "There are various regional styles, "
          "such as sukiyaki and shabu-shabu.",
      price: 21.00,
      rating: 4.8,
    ),
    Food(
      name: "Onigiri",
      image: "assets/oni.png",
      description: " A convenient and portable snack made from rice "
          "formed into a triangular or oval shape and often wrapped in nori "
          "(seaweed). It may be filled with ingredients like pickled plum (umeboshi),"
          " salted salmon, or tuna mayo",
      price: 3.99,
      rating: 4.7,
    ),





  ];

  final List<Food> popularFood =   [
    Food(
      name: "Salmon Eggs",
      image: "assets/salmon_eggs.png",
      description: "These are bright orange, large salmon roe often used in sushi."
          " They burst with a salty, umami-rich flavor and are commonly served atop rice or as a garnish. "
          "Ikura is appreciated for its texture and luxurious taste.",
      price: 15.0,
      rating: 4.9,
    ),
    Food(
      name: "Dango",
      image: "assets/dang.png",
      description: " A chewy, sweet rice dumpling typically served on skewers. "
          "Dango comes in various flavors and coatings, such as mitarashi (sweet soy glaze), "
          "anko (red bean paste), or sesame. It's a popular snack during festivals.",
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
        title: const Text("MENU"),
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