import 'package:flutter/material.dart';
import 'package:pfeprojectcar/common/widgets/appbar/appbar.dart';
import 'package:pfeprojectcar/common/widgets/shopcart/cart_menu_icon.dart';
import 'package:pfeprojectcar/utils/constants/colors.dart';
import 'package:pfeprojectcar/utils/constants/texts_string.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomAppBar(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Text(TTexts.homeAppbarTitle , style: Theme.of(context).textTheme.labelMedium!.apply(color: TColors.grey)),
                 Text(TTexts.homeAppbarSubTitle , style: Theme.of(context).textTheme.labelMedium!.apply(color: TColors.grey)),
                ],
              ),
              actions: [
               CartMenuWidget(iconColor: TColors.white, onPressed: () {})
              ],
             );
  }
}