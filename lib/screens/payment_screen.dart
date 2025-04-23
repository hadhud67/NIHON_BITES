import 'package:flutter/material.dart';
import '../models/food_model.dart';

class PaymentScreen extends StatefulWidget {
  final List<Food> cartItems;

  const PaymentScreen({required this.cartItems, super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late List<Food> _items;

  @override
  void initState() {
    super.initState();
    _items = List.from(widget.cartItems);
  }

  double get totalPrice {
    return _items.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  void _removeItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
  }

  void _updateQuantity(int index, int newQuantity) {
    setState(() {
      if (newQuantity > 0) {
        _items[index] = _items[index].copyWith(quantity: newQuantity);
      } else {
        _items.removeAt(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        backgroundColor: const Color(0xffA94438), // Red app bar color
        foregroundColor: Colors.white, // White back button
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: _items.isEmpty
                  ? const Center(
                child: Text(
                  'Your cart is empty',
                  style: TextStyle(fontSize: 18),
                ),
              )
                  : ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  final item = _items[index];
                  return Dismissible(
                    key: Key(item.name + index.toString()),
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 20),
                      child: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) => _removeItem(index),
                    child: Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: ListTile(
                        leading: Image.asset(
                          item.image,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                        title: Text(item.name),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                '\$${(item.price * item.quantity).toStringAsFixed(2)}'),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove, size: 18),
                                  onPressed: () {
                                    _updateQuantity(
                                        index, item.quantity - 1);
                                  },
                                ),
                                Text(item.quantity.toString()),
                                IconButton(
                                  icon: const Icon(Icons.add, size: 18),
                                  onPressed: () {
                                    _updateQuantity(
                                        index, item.quantity + 1);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _removeItem(index),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            if (_items.isNotEmpty) ...[
              const Divider(thickness: 1.5),
              ListTile(
                title: const Text(
                  'Total',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Text(
                  '\$${totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffA94438),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Payment Successful!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  child: const Text('Pay Now'),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}