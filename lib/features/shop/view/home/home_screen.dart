import 'package:flutter/material.dart';
import 'package:pfeprojectcar/common/widgets/custom_shapes/container/primary_header_container.dart';
import 'package:pfeprojectcar/features/shop/view/home/home_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   const Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
            CustomHeader(child: Column(
              children: [
                HomeAppBar()
              ],
            ),
            
            )            
            ],
          )
        ),
      );
    
  }
}