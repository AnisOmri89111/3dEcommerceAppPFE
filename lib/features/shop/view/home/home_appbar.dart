import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfeprojectcar/common/widgets/Loaders/shimmer/shimmer.dart';
import 'package:pfeprojectcar/common/widgets/appbar/appbar.dart';
import 'package:pfeprojectcar/common/widgets/shopcart/cart_menu_icon.dart';
import 'package:pfeprojectcar/features/personalizations/controllers/user_controller.dart';
import 'package:pfeprojectcar/utils/constants/colors.dart';
import 'package:pfeprojectcar/utils/constants/texts_string.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return  CustomAppBar(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Text(TTexts.homeAppbarTitle , style: Theme.of(context).textTheme.labelMedium!.apply(color: TColors.grey)),
                 Obx(() {
                  if (controller.profileLoading.value) {
                    return const ShimmerLoader(width: 80, height: 15);
                  } else {
                    return Text(controller.user.value.fullName , style: Theme.of(context).textTheme.labelMedium!.apply(color: TColors.grey));
                  }
                 } 
                 )
                ]
                ,
              ),
              actions: [
               CartMenuWidget(iconColor: TColors.white, onPressed: () {})
              ],
             );
  }
}