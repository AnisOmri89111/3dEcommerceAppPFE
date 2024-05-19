import 'package:flutter/material.dart';
import 'package:pfeprojectcar/utils/constants/colors.dart';

class CartMenuWidget extends StatelessWidget {
  const CartMenuWidget({
    super.key, 
    required this.iconColor, 
    required this.onPressed});
  final Color iconColor ;
  final VoidCallback onPressed ;
  @override
  Widget build(BuildContext context) {
    return  Stack(
                  children: [
                    IconButton(onPressed: onPressed, icon :  Icon(Icons.shopping_bag , color: iconColor,)),
                    Positioned(
                      right: 0,
                      child: Container(
                        width: 18,
                        height:18,
                        decoration: BoxDecoration(
                          color:  TColors.black,
                          borderRadius: BorderRadius.circular(100)
                        ),
                        child: Center(
                          child: Text("2" , style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.white, fontSizeFactor: 0.8))
                        ),
                      ),
                    )
                  ],
                );
  }
}