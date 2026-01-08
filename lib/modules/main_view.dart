import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/bottom_nav_bar.dart';
import 'package:myapp/modules/cart_view.dart';
import 'package:myapp/modules/home_view.dart';
import 'package:myapp/modules/order_view.dart';
import 'package:myapp/modules/profile_view.dart';



class MainView extends StatelessWidget {
  MainView({super.key});

  final controller = Get.put(BottomNavController());

  final pages = const [
    HomeView(),
    CartView(),
    OrderView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: pages[controller.index.value],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.index.value,
            onTap: controller.changeIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.green,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.receipt_long),
                label: 'Orders',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        ));
  }
}
