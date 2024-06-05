import 'package:flutter/material.dart';
import 'package:pfeprojectcar/common/widgets/appbar/appbar.dart';

class SubCategoryWidget extends StatelessWidget {
  const SubCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar:  CustomAppBar(
        showBackArrow: true,
      ),
      body: Center(
        child: Text('Next Feature Category'),
      ),
    );
  }
}