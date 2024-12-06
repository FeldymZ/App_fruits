import 'package:flutter/material.dart';

class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  // Liste des produits dans le panier
  List<CartItemData> cartItems = [
    CartItemData(
      imagePath: "assets/banana.png",
      title: "Fresh Banana",
      subtitle: "Fruit\n250 G",
      price: 2.0,
      quantity: 1,
    ),
    CartItemData(
      imagePath: "assets/pomme_rouge.png",
      title: "Red Apples",
      subtitle: "Fruit\n250 G",
      price: 6.0,
      quantity: 1,
    ),
    CartItemData(
      imagePath: "assets/avocado.png",
      title: "Avocado",
      subtitle: "Fruit\n250 G",
      price: 9.0,
      quantity: 1,
    ),
    CartItemData(
      imagePath: "assets/carotte.png",
      title: "Carrots",
      subtitle: "Vegetables\n250 G",
      price: 5.0,
      quantity: 1,
      isRemovable: true,
    ),
  ];

  // Calcul du total du panier
  double get totalAmount {
    double total = 0.0;
    for (var item in cartItems) {
      total += item.price * item.quantity;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(236, 244, 236, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Retour à l'écran précédent
          },
        ),
        title: const Center(
          child: Text(
            "My Cart",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Container(
              width: 45,
              height: 45,
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.more_horiz, color: Colors.white),
                onPressed: () {
                  // Action pour le panier
                },
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return CartItem(
                  imagePath: item.imagePath,
                  title: item.title,
                  subtitle: item.subtitle,
                  price: item.price,
                  quantity: item.quantity,
                  isRemovable: item.isRemovable,
                  onQuantityChanged: (newQuantity) {
                    setState(() {
                      item.quantity = newQuantity;
                    });
                  },
                  onRemove: () {
                    setState(() {
                      cartItems.removeAt(index);
                    });
                  },
                );
              },
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                SummaryRow(
                    label: "Subtotal",
                    value: "\$${totalAmount.toStringAsFixed(2)}"),
                const SummaryRow(label: "Delivery Free", value: "Free"),
                const SummaryRow(label: "Discount", value: "\$4.00"),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Action pour le bouton Promo Code
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: const BorderSide(color: Colors.green),
                    ),
                  ),
                  child: const Text(
                    "Promo Code",
                    style: TextStyle(color: Colors.green),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      // Action pour le paiement
                    },
                    child: Text(
                      "Checkout For \$${totalAmount.toStringAsFixed(2)}",
                      style: const TextStyle(color: Colors.green),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CartItemData {
  final String imagePath;
  final String title;
  final String subtitle;
  final double price;
  int quantity;
  final bool isRemovable;

  CartItemData({
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.quantity,
    this.isRemovable = false,
  });
}

class CartItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final double price;
  final int quantity;
  final bool isRemovable;
  final ValueChanged<int> onQuantityChanged;
  final VoidCallback onRemove;

  const CartItem({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.quantity,
    this.isRemovable = false,
    required this.onQuantityChanged,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          Image.asset(imagePath, height: 50, width: 50),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(subtitle, style: const TextStyle(fontSize: 12)),
              ],
            ),
          ),
          // Colonne contenant les boutons de quantité et le prix
          Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove_circle_outline),
                    onPressed: () {
                      if (quantity > 1) {
                        onQuantityChanged(quantity - 1);
                      }
                    },
                  ),
                  Text("$quantity"),
                  IconButton(
                    icon: const Icon(Icons.add_circle_outline),
                    onPressed: () {
                      onQuantityChanged(quantity + 1);
                    },
                  ),
                ],
              ),
              // Prix sous la quantité, dynamique selon la quantité
              Text("\$${(price * quantity).toStringAsFixed(2)}"),
            ],
          ),
          if (isRemovable)
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: onRemove,
            ),
        ],
      ),
    );
  }
}

class SummaryRow extends StatelessWidget {
  final String label;
  final String value;

  const SummaryRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 16)),
          Text(value,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
