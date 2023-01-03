// ignore_for_file: prefer_const_constructors

import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> banners = [
    "assets/banner1.png",
    "assets/banner2.png",
    "assets/banner3.png"
  ];
  List<String> products = [
    "assets/monitor.png",
    "assets/mug.png",
    "assets/airpods.png",
    "assets/ps4.png"
  ];
  List<String> product_name = [
    'Monitor LG 22"inc 4K...',
    'Aestechic Mug - white...',
    'Airpods pro',
    'Playstation 4 - SSD 128...'
  ];
  List<String> product_price = [r"$199.99", r"$19.99", r"$499.99", r"$1999.99"];

  int _page = 0;
  _changeTab(int index) {
    setState(() {
      _page = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (value) => _changeTab(value),
          selectedItemColor: Colors.green,
          unselectedItemColor: Color.fromARGB(255, 211, 204, 204),
          currentIndex: _page,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Wishlist"),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/paper.png",
                  color: _page == 2
                      ? Colors.green
                      : Color.fromARGB(255, 170, 167, 167),
                ),
                label: "History"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: _page == 3
                      ? Colors.green
                      : Color.fromARGB(255, 189, 186, 186),
                ),
                label: "Profile"),
          ]),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 45),
            DelayedDisplay(
              delay: Duration(milliseconds: 350),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 116),
                        child: Text("Delivery address",
                            style: TextStyle(
                                color: Color.fromARGB(255, 161, 158, 158),
                                fontWeight: FontWeight.w400,
                                fontSize: 12)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Salatiga City, Central Java",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(width: 8),
                          Image.asset("assets/downward_arrow.png")
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 25,
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            SvgPicture.asset("assets/Buy.svg", height: 30),
                            SvgPicture.asset("assets/num.svg")
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      SvgPicture.asset("assets/not.svg")
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 15),
            DelayedDisplay(
              delay: Duration(milliseconds: 500),
              child: SizedBox(
                height: 40,
                child: TextField(
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(10),
                    prefixIcon: Icon(Icons.search, size: 20),
                    hintText: "Search here",
                    hintStyle: TextStyle(
                        color: Color.fromARGB(255, 128, 126, 126),
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 204, 200, 200)),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 228, 222, 222),
                            width: 0.5)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 230, 226, 226),
                            width: 0.5)),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            DelayedDisplay(
              delay: Duration(milliseconds: 750),
              child: SizedBox(
                height: 150,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: banners.length,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 6),
                        child: SizedBox(
                          width: 300,
                          child: Image.asset(banners[index]),
                        ),
                      );
                    })),
              ),
            ),
            DelayedDisplay(
              delay: Duration(milliseconds: 1000),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Category",
                    style: GoogleFonts.inter(
                        textStyle: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500)),
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            DelayedDisplay(
              delay: Duration(milliseconds: 1250),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 201, 218, 243),
                            borderRadius: BorderRadius.circular(5)),
                        child: Image.asset("assets/apparel.png"),
                      ),
                      SizedBox(height: 3),
                      Text(
                        "Apparel",
                        style: TextStyle(
                            color: Color.fromARGB(255, 182, 173, 173),
                            fontSize: 14),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color.fromARGB(255, 79, 132, 223)),
                        child: Image.asset("assets/school.png"),
                      ),
                      SizedBox(height: 3),
                      Text(
                        "School",
                        style: TextStyle(
                            color: Color.fromARGB(255, 182, 173, 173),
                            fontSize: 14),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color.fromARGB(255, 247, 211, 164)),
                        child: Image.asset("assets/sports.png"),
                      ),
                      SizedBox(height: 3),
                      Text(
                        "Sports",
                        style: TextStyle(
                            color: Color.fromARGB(255, 182, 173, 173),
                            fontSize: 14),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color.fromARGB(255, 228, 173, 192)),
                        child: Image.asset("assets/electronics.png"),
                      ),
                      SizedBox(height: 3),
                      Text(
                        "Electronics",
                        style: TextStyle(
                            color: Color.fromARGB(255, 182, 173, 173),
                            fontSize: 14),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color.fromARGB(255, 159, 221, 191)),
                        child: Image.asset("assets/all2.png"),
                      ),
                      SizedBox(height: 3),
                      Text(
                        "All",
                        style: TextStyle(
                            color: Color.fromARGB(255, 182, 173, 173),
                            fontSize: 14),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            DelayedDisplay(
              delay: Duration(milliseconds: 1500),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("Recent product",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          width: 1,
                          color: Color.fromARGB(255, 225, 222, 222),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Filters",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 102, 102, 102))),
                          SizedBox(width: 15),
                          Image.asset("assets/sort.png")
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            DelayedDisplay(
              delay: Duration(milliseconds: 1750),
              child: SizedBox(
                height: 350,
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 4 / 5),
                    itemCount: products.length,
                    itemBuilder: ((context, index) {
                      return Container(
                        height: 176,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 245, 242, 242),
                            borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Image.asset(
                              products[index],
                              fit: BoxFit.fitWidth,
                            ),
                            SizedBox(height: 12),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 10),
                              child: Text(product_name[index]),
                            ),
                            SizedBox(height: 3),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(
                                product_price[index],
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 15),
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Container(
                                height: 40,
                                width: 150,
                                decoration: BoxDecoration(
                                    color: (Color(0xff67C4A7)),
                                    borderRadius: BorderRadius.circular(7)),
                                child: Center(
                                  child: Text(
                                    "Add to cart",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    })),
              ),
            )
          ],
        ),
      )),
    );
  }
}
