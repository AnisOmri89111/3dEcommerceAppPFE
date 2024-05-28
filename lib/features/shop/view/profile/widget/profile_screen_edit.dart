import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfeprojectcar/common/widgets/Loaders/shimmer/shimmer.dart';
import 'package:pfeprojectcar/common/widgets/appbar/appbar.dart';
import 'package:pfeprojectcar/common/widgets/customheader/customsectionheader.dart';
import 'package:pfeprojectcar/common/widgets/images/circular_image.dart';
import 'package:pfeprojectcar/data/repos/authentication_repository.dart';
import 'package:pfeprojectcar/features/personalizations/controllers/user_controller.dart';
import 'package:pfeprojectcar/features/shop/view/profile/widget/changename.dart';
import 'package:pfeprojectcar/features/shop/view/profile/widget/profile_screen_edit_menu.dart';
import 'package:pfeprojectcar/utils/constants/image_string.dart';
import 'package:pfeprojectcar/utils/constants/sizes.dart';

class ProfileScreenEdit extends StatelessWidget {
  const ProfileScreenEdit({super.key});

  @override
  Widget build(BuildContext context) {
        final controller = UserController.instance;

    return Scaffold(
      appBar: const CustomAppBar(showBackArrow: true, title: Text('Profile'),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture ;
                      final image = networkImage.isNotEmpty ? networkImage : ImageString.user ;
                      return  controller.imageLoading.value ? const ShimmerLoader(width: 80, height: 80, radius: 80,)
                      :CustomCircularImage(image: image, width: 80, height: 80 , isNetworkImage: networkImage.isNotEmpty, );
                    }) ,
                    TextButton(onPressed: () => controller.uploadUSerProfilePicture(), child: const Text('change profile picture'))
                  ],
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems*0.5,),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems,),
              const CustomHeadingSection(title: 'Profile Information' , showActionButton: false,),
              const SizedBox(height: TSizes.spaceBtwItems,),
              EditMenu(onPressed: () =>Get.to(() => const ChangeNameScreen()), title: 'Name', value: controller.user.value.fullName),
              EditMenu(onPressed: () {}, title: 'UserName', value: controller.user.value.username),

              const SizedBox(height: TSizes.spaceBtwItems*0.5,),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems,),

              const CustomHeadingSection(title: 'Personal Information' , showActionButton: false,),
              const SizedBox(height: TSizes.spaceBtwItems,),
        
              EditMenu(onPressed: () {}, title: 'Email', value: controller.user.value.email),
              EditMenu(onPressed: () {}, title: 'Phone Number', value: controller.user.value.phoneNumber),
              EditMenu(onPressed: () {}, title: 'Gender', value: 'male'),
              EditMenu(onPressed: () {}, title: 'Date of birth', value: '1 september 1999'),

              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems,),

              Center(
                child: TextButton(
                  onPressed: () => AuthenticationRepository.instance.logOut(),
                  child: const Text('Logout'),
                ),
              )

            ],
          ),
          
          
          
          
        ),
        ),
    );
  }
}