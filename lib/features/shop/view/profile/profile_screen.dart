import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pfeprojectcar/common/widgets/appbar/appbar.dart';
import 'package:pfeprojectcar/common/widgets/custom_shapes/container/primary_header_container.dart';
import 'package:pfeprojectcar/common/widgets/customheader/customsectionheader.dart';
import 'package:pfeprojectcar/common/widgets/images/circular_image.dart';
import 'package:pfeprojectcar/common/widgets/list_files/userprofile_file.dart';
import 'package:pfeprojectcar/features/shop/view/profile/setting_menu.dart';
import 'package:pfeprojectcar/utils/constants/colors.dart';
import 'package:pfeprojectcar/utils/constants/image_string.dart';
import 'package:pfeprojectcar/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  
      Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomHeader(child: Column(
                children: [
                CustomAppBar(title: Text('Account', style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white),)
                ),
                const SizedBox(height: TSizes.spaceBtwSections,),
                const CustomUserProfile(),
                const SizedBox(height: TSizes.spaceBtwSections,)
                ],
              )
              ),
               Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                const   CustomHeadingSection(title: 'Account Settings' , showActionButton: false,),
                const   SizedBox(height: TSizes.spaceBtwItems,),
                const   SettingMenu(icon: Iconsax.safe_home, title: 'adresses', subtitle: 'set Car delivery adresses'),
                const   SettingMenu(icon: Iconsax.shopping_cart, title: 'cart', subtitle: 'Add , remove cars and move to checkout'),
                const   SettingMenu(icon: Iconsax.bag_tick, title: 'Orders', subtitle: 'in-progress and completed order'),
                const   SettingMenu(icon: Iconsax.bank, title: 'Bank Account', subtitle: 'withdraw balance to registered bank accounts'),
                const   SettingMenu(icon: Iconsax.notification, title: 'notification', subtitle: 'Set any kind of notification message'),
                const   SettingMenu(icon: Iconsax.security_card, title: 'Account Privacy', subtitle: 'Manage data usage and connected accounts'),
const 
                 SizedBox(height: TSizes.spaceBtwSections,),
                 SizedBox(
                width: double.infinity,
                child: OutlinedButton(onPressed: (){}, child: const Text('logout')),
                 )
                ],
              ),
              )
           ],
          
          ),
        ),
      );
    
  }
}