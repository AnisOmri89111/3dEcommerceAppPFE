import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfeprojectcar/common/widgets/list_files/userprofile_file.dart';
import 'package:pfeprojectcar/features/personalizations/views/profile/settings.dart';
import 'package:pfeprojectcar/features/shop/view/home/home_screen.dart';
import 'package:pfeprojectcar/features/shop/view/store/store_screen.dart';
import 'package:pfeprojectcar/features/shop/view/wishlist/wishlist_screen.dart';
import 'package:pfeprojectcar/utils/constants/colors.dart';
import 'package:pfeprojectcar/utils/helpers/helper_function.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
  final darkMode = THelperFunctions.isDarkMode(context);

    final controller = Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          backgroundColor: darkMode ? TColors.black : TColors.white,
          indicatorColor: darkMode ? TColors.white.withOpacity(0.1) : TColors.black.withOpacity(0.1),
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index ,
          destinations: const[
            NavigationDestination(icon: Icon(Icons.home), label: 'home'),
            NavigationDestination(icon: Icon(Icons.store), label: 'Store'),
            NavigationDestination(icon: Icon(Icons.heat_pump_rounded), label: 'wishlist'),
            NavigationDestination(icon: Icon(Icons.person), label: 'profile'),
        
          ],
        ),
      ),
      body: Obx(()=> controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [const HomeScreen(),const StoreScreen(),const WishListScreen(),const ProfileSettingScreen()];
}