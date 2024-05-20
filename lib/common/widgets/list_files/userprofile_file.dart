import 'package:flutter/material.dart';
import 'package:pfeprojectcar/common/widgets/images/circular_image.dart';
import 'package:pfeprojectcar/utils/constants/colors.dart';
import 'package:pfeprojectcar/utils/constants/image_string.dart';

class CustomUserProfile extends StatelessWidget {
  const CustomUserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListTile(
                leading: const CustomCircularImage(image:ImageString.user , width: 50, height: 50, padding: 0,),
                title: Text('omri Anis' , style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),),
                subtitle: Text('omrianis2@gmail.com' , style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),),
                trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.edit , color: TColors.white,),),
                );
  }
}