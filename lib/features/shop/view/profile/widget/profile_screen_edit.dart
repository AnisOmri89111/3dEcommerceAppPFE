import 'package:flutter/material.dart';
import 'package:pfeprojectcar/common/widgets/customheader/customsectionheader.dart';
import 'package:pfeprojectcar/common/widgets/images/circular_image.dart';
import 'package:pfeprojectcar/features/shop/view/profile/widget/profile_screen_edit_menu.dart';
import 'package:pfeprojectcar/utils/constants/image_string.dart';
import 'package:pfeprojectcar/utils/constants/sizes.dart';

class ProfileScreenEdit extends StatelessWidget {
  const ProfileScreenEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const CustomCircularImage(image: ImageString.user , width: 80, height: 80 ) ,
                    TextButton(onPressed: () {}, child: const Text('change profile picture'))
                  ],
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems*0.5,),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems,),
              const CustomHeadingSection(title: 'Profile Information' , showActionButton: false,),
              const SizedBox(height: TSizes.spaceBtwItems,),
              EditMenu(onPressed: () {}, title: 'Name', value: 'Anis Omri'),
              EditMenu(onPressed: () {}, title: 'UserName', value: 'AnisOmri'),

              const SizedBox(height: TSizes.spaceBtwItems*0.5,),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems,),

              const CustomHeadingSection(title: 'Personal Information' , showActionButton: false,),
              const SizedBox(height: TSizes.spaceBtwItems,),
        
              EditMenu(onPressed: () {}, title: 'Email', value: 'omrianis2@gmail.com'),
              EditMenu(onPressed: () {}, title: 'Phone Number', value: '95 516 773'),
              EditMenu(onPressed: () {}, title: 'Gender', value: 'male'),
              EditMenu(onPressed: () {}, title: 'Date of birth', value: '1 september 1999'),

              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems,),

              Center(
                child: TextButton(
                  onPressed: () {},
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