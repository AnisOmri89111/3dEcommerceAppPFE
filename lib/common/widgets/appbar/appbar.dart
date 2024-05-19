import 'package:flutter/material.dart';
import 'package:pfeprojectcar/utils/constants/sizes.dart';
import 'package:pfeprojectcar/utils/devices/deviceutils.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
  super.key, 
  this.showBackArrow = true, 
  this.title, 
  this.loadingIcon, 
  this.actions, 
  this.loadingOnPressed});
  final bool showBackArrow ;
  final Widget? title ;
  final IconData? loadingIcon ;
  final List<Widget>? actions ;
  final VoidCallback? loadingOnPressed ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding : const EdgeInsets.symmetric(horizontal: TSizes.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading : showBackArrow 
        ? IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_left)) 
        : loadingIcon != null ? IconButton(onPressed: loadingOnPressed, icon: Icon(loadingIcon)) : null ,
        title: title,
        actions: actions,
      ),
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight()) ;
  
}


