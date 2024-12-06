import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_fruits/Screen3.dart';
// Assurez-vous d'importer 'provider'

class Product {
  final String name;
  final String category;
  final double price;
  final String size;
  final String image;
  final int quantity;

  Product({
    required this.name,
    required this.category,
    required this.price,
    required this.size,
    required this.image,
    required this.quantity,
  });
}

class CartProvider with ChangeNotifier {
  final List<Product> _cartItems = [];

  List<Product> get cartItems => _cartItems;

  void addItemToCart(Product product) {
    _cartItems.add(product);
    notifyListeners();
  }
}

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  // Liste des images pour le slider
  final List<String> imagePaths = [
    "assets/banana.png",
    "assets/banane1.webp",
    "assets/banane2.png",
    "assets/banane3.png",
  ];

  // Variable pour stocker l'image actuellement sélectionnée
  int selectedIndex = 0;

  // Variables pour le prix et la quantité
  double unitPrice = 2.00; // Prix unitaire
  int quantity = 1; // Quantité initiale

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(236, 244, 236, 1),
      appBar: AppBar(
        title: const Center(child: Text("Product Details")),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Retour à l'écran précédent
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 50, // Diamètre du bouton
              height: 50,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 56, 152, 59), // Couleur de fond
                shape: BoxShape.circle, // Forme circulaire
              ),
              child: IconButton(
                icon: const Icon(Icons.shopping_cart,
                    color: Color.fromARGB(255, 255, 255, 255)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Screen3()),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // Image principale (affichée en grand)
            Center(
              child: Image.asset(
                imagePaths[
                    selectedIndex], // Affiche l'image actuellement sélectionnée
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            // Slider d'images miniatures
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imagePaths.map((imagePath) {
                int index = imagePaths.indexOf(imagePath);
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index; // Change l'image principale
                      });
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: selectedIndex == index
                              ? const Color.fromRGBO(76, 79, 76, 1)
                              : Colors.transparent,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            // Indicateur de page
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                imagePaths.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Container(
                    height: 8,
                    width: selectedIndex == index ? 16 : 8,
                    decoration: BoxDecoration(
                      color:
                          selectedIndex == index ? Colors.green : Colors.grey,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            Row(
              children: [
                Row(
                  children: [
                    Container(
                      width: 120,
                      height: 25,
                      decoration: BoxDecoration(
                          color: const Color(0xFFD6D6D6),
                          borderRadius: BorderRadius.circular(15)),
                      child: const Center(
                          child: Text(
                        "Recommended",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 50,
                      height: 25,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(15)),
                      child: const Center(
                        child: Text(
                          "Fruit",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
                const Spacer(),
                const Icon(Icons.favorite_border_sharp)
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Fresh Banana",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const Text("250G"),
            const SizedBox(
              height: 13,
            ),
            const Row(
              children: [
                Icon(
                  Icons.star,
                  color: Color(0xFFFCC317),
                  size: 12,
                ), // Étoile pleine
                Icon(
                  Icons.star,
                  color: Color(0xFFFCC317),
                  size: 12,
                ), // Étoile pleine
                Icon(
                  Icons.star,
                  color: Color(0xFFFCC317),
                  size: 12,
                ),
                Icon(
                  Icons.star,
                  color: Color(0xFFFCC317),
                  size: 12,
                ), // Étoile pleine
                Icon(
                  Icons.star,
                  color: Color(0xFFFCC317),
                  size: 12,
                ), // Étoile pleine
                Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Text("5k Reviews"),
                ),
              ],
            ),
            const SizedBox(
              height: 13,
            ),
            const Text(
              "Bananas are a popular tropical fruit rich in vitamins, particularly Vitamin B6 and Vitamin C. They are known for their high potassium content, which promotes heart health and muscle function.",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
            ),
            const SizedBox(
              height: 18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${(unitPrice * quantity).toStringAsFixed(2)}", // Prix dynamique
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff34a853)),
                ),
                Container(
                  width: 110,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove_circle_outline,
                            color: Color(0xff34a853)),
                        onPressed: () {
                          setState(() {
                            if (quantity > 1) quantity--;
                          });
                        },
                      ),
                      Text(
                        "$quantity",
                        style: const TextStyle(fontSize: 18),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add_circle,
                            color: Color(0xff34a853)),
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff34a853),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: () {
                  final product = Product(
                    name: "Fresh Banana",
                    category: "Fruit",
                    price: unitPrice, // Prix unitaire
                    size: "250 G",
                    image: "assets/img/banana (1).png",
                    quantity: quantity, // Quantité actuelle
                  );

                  Provider.of<CartProvider>(context, listen: false)
                      .addItemToCart(product);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Added ${product.name} to cart')),
                  );
                },
                child: const Text(
                  "Add items to Cart",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
