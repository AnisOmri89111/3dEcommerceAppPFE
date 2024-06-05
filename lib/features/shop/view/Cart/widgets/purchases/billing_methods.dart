import 'package:flutter/material.dart';
import 'package:pfeprojectcar/common/widgets/custom_shapes/container/circular_container.dart';
import 'package:pfeprojectcar/common/widgets/customheader/customsectionheader.dart';
import 'package:pfeprojectcar/utils/constants/colors.dart';
import 'package:pfeprojectcar/utils/constants/image_string.dart';
import 'package:pfeprojectcar/utils/constants/sizes.dart';
import 'package:pfeprojectcar/utils/helpers/helper_function.dart';

class BiliingMethods extends StatelessWidget {
  const BiliingMethods({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
     return  Column(
      children: [
        CustomHeadingSection(title: 'Payment Methods' , buttonTitle: 'change', onPressed: () {},),
        const SizedBox(height: TSizes.spaceBtwItems/2,),
        Row(
          children: [
            CustomContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? TColors.light : TColors.white,
              child: const Image(image: AssetImage(ImageString.paypal)),
            ),
            const SizedBox(height: TSizes.spaceBtwItems/2,),
            Text('Paypal' , style: Theme.of(context).textTheme.bodyLarge,)

          ],
        )
      ],
    );
  }
}