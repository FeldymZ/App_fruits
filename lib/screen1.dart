import 'package:app_fruits/screen2.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Screen1()));

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(236, 226, 226, 1),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              // Row with Avatar, Search TextField, and Button
              Padding(
                padding: const EdgeInsets.only(top: 35, left: 10, right: 10),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage("assets/icone.jpg"),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 15),
                          prefixIcon: const Icon(Icons.search),
                          hintText: "Search here...",
                          hintStyle: const TextStyle(color: Colors.black26),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(35.0),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.place,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                  height: 16), // Adding space between row and tab bar

              // TabBar (without AppBar)
              TabBar(
                controller: _tabController,
                indicatorColor: Colors.green,
                labelColor: Colors.green,
                unselectedLabelColor: Colors.grey,
                indicatorWeight: 2.0,
                tabs: const [
                  Tab(text: "POPULAR"),
                  Tab(text: "GROCERY"),
                  Tab(text: "VEGETABLES"),
                  Tab(text: "Flash Sale"),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    // debut du premier containeur
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        height: 150,
                        width: 280,
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(13, 12, 35, 1),
                            borderRadius: BorderRadius.circular(30)),
                        child: Column(
                          children: [
                            const Row(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: 20, left: 15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Save Big On Essential",
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            "Get 10% off",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            "All tresh produce this week",
                                            style: TextStyle(
                                                fontSize: 8,
                                                color: Colors.white),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 20, top: 20),
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundImage:
                                        AssetImage("assets/2.jpeg"),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                    top: 10,
                                  ),
                                  child: Container(
                                    width: 140,
                                    height: 35,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: const Center(
                                      child: Text(
                                        "This Week Only",
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 12, left: 10),
                                  child: Text(
                                    "Grad Offer Now  >",
                                    style: TextStyle(fontSize: 8),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ), //  fin du premier containeur
                    // début du deuxième containeur
                    Container(
                      height: 150,
                      width: 280,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(30)),
                      child: Column(
                        children: [
                          const Row(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 20, left: 15),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Save Big On Essential",
                                          style: TextStyle(fontSize: 17),
                                        ),
                                        Text(
                                          "Get 10% off",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25),
                                        ),
                                        Text(
                                          "All tresh produce this week",
                                          style: TextStyle(fontSize: 8),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20, top: 20),
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage("assets/1.jpeg"),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, top: 15),
                                child: Container(
                                  width: 140,
                                  height: 35,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: const Center(
                                    child: Text(
                                      "This Week Only",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 12, left: 10),
                                child: Text(
                                  "Grad Offer Now  >",
                                  style: TextStyle(fontSize: 8),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ), // fin du deuxième containeur
                    // début du troisième containeur
                    Container(
                      height: 150,
                      width: 280,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(30)),
                      child: Column(
                        children: [
                          const Row(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 20, left: 15),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Save Big On Essential",
                                          style: TextStyle(fontSize: 17),
                                        ),
                                        Text(
                                          "Get 10% off",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25),
                                        ),
                                        Text(
                                          "All tresh produce this week",
                                          style: TextStyle(fontSize: 8),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20, top: 20),
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage("assets/1.jpeg"),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, top: 15),
                                child: Container(
                                  width: 140,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "This Week Only",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 10, top: 15),
                                child: Text(
                                  "Grab Offer Now  >",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ) // fin du troisième containeur
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "Recommandations",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Text(
                        "View All",
                        style: TextStyle(
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Container(
                      height: 240,
                      width: 170,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Image.asset(
                              "assets/avocado.png",
                              height: 100,
                            ),
                          ),
                          const Text(
                            "Avocado",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Text("250g"),
                          const SizedBox(
                            height: 15,
                          ),
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Column(
                                      children: [
                                        Text('6 USD'),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Color.fromRGBO(
                                                  100, 100, 95, 1),
                                              size: 12,
                                            ), // Étoile pleine
                                            Icon(
                                              Icons.star,
                                              color: Color.fromRGBO(
                                                  100, 100, 95, 1),
                                              size: 12,
                                            ), // Étoile pleine
                                            Icon(
                                              Icons.star,
                                              color: Color.fromRGBO(
                                                  100, 100, 95, 1),
                                              size: 12,
                                            ), // Étoile pleine
                                            Icon(
                                              Icons.star_half,
                                              color: Color.fromRGBO(
                                                  100, 100, 95, 1),
                                              size: 12,
                                            ), // Étoile partielle
                                            Icon(
                                              Icons.star_border,
                                              color: Color.fromRGBO(
                                                  100, 100, 95, 1),
                                              size: 12,
                                            ), // Étoile vide
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Spacer(),
                              Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Icon(
                                  Icons.add_circle,
                                  size: 40,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Screen2()),
                      );
                    },
                    child: Container(
                      height: 240,
                      width: 170,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Image.asset(
                              "assets/banana.png",
                              height: 100,
                            ),
                          ),
                          const Text(
                            "Fresh Banana",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Text("250g"),
                          const SizedBox(
                            height: 15,
                          ),
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Column(
                                      children: [
                                        Text('5 USD'),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Color.fromRGBO(
                                                  100, 100, 95, 1),
                                              size: 12,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Color.fromRGBO(
                                                  100, 100, 95, 1),
                                              size: 12,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Color.fromRGBO(
                                                  100, 100, 95, 1),
                                              size: 12,
                                            ),
                                            Icon(
                                              Icons.star_half,
                                              color: Color.fromRGBO(
                                                  100, 100, 95, 1),
                                              size: 12,
                                            ),
                                            Icon(
                                              Icons.star_border,
                                              color: Color.fromRGBO(
                                                  100, 100, 95, 1),
                                              size: 12,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Icon(
                                  Icons.add_circle,
                                  size: 40,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "Categories",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 23),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Text(
                        "View All",
                        style: TextStyle(color: Colors.green, fontSize: 15),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          borderRadius: BorderRadius.circular(20)),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 8, left: 8),
                            child: CircleAvatar(
                              radius: 20,
                              backgroundImage:
                                  AssetImage("assets/fraise_avatar.png"),
                            ),
                          ),
                          Center(
                              child: Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text("Fraise au choix"),
                          ))
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          borderRadius: BorderRadius.circular(20)),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 8, left: 8),
                            child: CircleAvatar(
                              radius: 20,
                              backgroundImage: AssetImage("assets/huile.png"),
                            ),
                          ),
                          Center(
                              child: Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text("Huile d'olive"),
                          ))
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          borderRadius: BorderRadius.circular(20)),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 8, left: 8),
                            child: CircleAvatar(
                              radius: 20,
                              backgroundImage: AssetImage("assets/viande.png"),
                            ),
                          ),
                          Center(
                              child: Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text("Viande de boeuf"),
                          ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
