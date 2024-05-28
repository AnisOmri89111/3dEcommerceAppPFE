import 'package:flutter/material.dart';
import 'package:pfeprojectcar/common/widgets/Loaders/shimmer/shimmer.dart';
import 'package:pfeprojectcar/common/widgets/images/circular_image.dart';
import 'package:pfeprojectcar/features/personalizations/controllers/user_controller.dart';
import 'package:pfeprojectcar/utils/constants/colors.dart';
import 'package:pfeprojectcar/utils/constants/image_string.dart';
import 'package:get/get.dart';
class CustomUserProfile extends StatelessWidget {
  const CustomUserProfile({super.key, required this.onPressed});
  final VoidCallback onPressed ;
  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return  ListTile(
                leading: Obx(()  {
                    final networkImage = controller.user.value.profilePicture ;
                      final image = networkImage.isNotEmpty ? networkImage : ImageString.user ;
                      return  controller.imageLoading.value ? const ShimmerLoader(width: 80, height: 80, radius: 80,)
                      :CustomCircularImage(image: image, width: 50, height: 50, padding: 0,  isNetworkImage: networkImage.isNotEmpty, );
                } ),
                title: Text(controller.user.value.fullName , style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),),
                subtitle: Text(controller.user.value.email , style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),),
                trailing: IconButton(onPressed: onPressed, icon: const Icon(Icons.edit , color: TColors.white,),),
                );
  }
}