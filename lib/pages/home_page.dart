//'import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../components/grocery_item_tile.dart';
import '../model/home_model.dart';
import 'cart_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'intro_screen.dart';
import "account_page.dart";
import "search.dart";
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        //backgroundColor: Colors.lightBlueAccent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 0.0),
          child:
          Icon(
            Icons.location_on,
            size: 30,
            color: Colors.black,
          ),
        ),
        title:
        Text(
          'Islamabad, Pakistan',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        titleSpacing:-12,
        actions:
        [
             GestureDetector(
                onTap: () =>
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return AccountPage();
                        },
                  ),
                  ),
                child:
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Icon(
                    Icons.person,
                    size: 32.0,
                    color: Colors.black,
                  ),
                ),
              ),
    ],
          ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        backgroundColor: Colors.white,
        color: Colors.blue,
        animationDuration: Duration(milliseconds: 450),

        onTap: (index) => Future.delayed(Duration(milliseconds: 550),() {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    if (index == 0) {
                      return HomePage();
                    }
                    else if (index == 1) {
                      return SearchPage();
                    }
                    return CartPage();
                  },
                ),
              );
        }
        ),
        items: [
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.search,
            color: Colors.white,
          ),
          Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
        ],
      ),
      body:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),

          // categories -> horizontal listview
          Padding(
            padding: const EdgeInsets.only(left:110),
            child: Text(
              "Categories:",
              style: GoogleFonts.notoSerif(
                //fontWeight: FontWeight.bold,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // recent orders -> show last 3
          Expanded(
            child: Consumer<HomeModel>(
              builder: (context, value, child) {
                return GridView.builder(
                  padding: const EdgeInsets.all(20),
                  //physics: const NeverScrollableScrollPhysics(),
                  itemCount: value.shopItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.2,
                  ),
                  itemBuilder: (context, index) {
                    return GroceryItemTile(
                      itemName: value.shopItems[index][0],
                      itemPrice: value.shopItems[index][1],
                      imagePath: value.shopItems[index][2],
                      color: value.shopItems[index][3],
                      onPressed: () {},
                          // Provider.of<HomeModel>(context, listen: false)
                          //     .addItemToCart(index),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
