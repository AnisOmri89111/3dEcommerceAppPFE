import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfeprojectcar/common/widgets/appbar/appbar.dart';
import 'package:pfeprojectcar/features/shop/controller/user/update_user_controller.dart';
import 'package:pfeprojectcar/utils/constants/sizes.dart';
import 'package:pfeprojectcar/utils/constants/texts_string.dart';
import 'package:pfeprojectcar/utils/validators/validation.dart';

class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateUserController());
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: false, 
        title: Text('Change Name' , style: Theme.of(context).textTheme.headlineSmall,),
         ),
      body: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [
          Text('Use real Name for easy verification . This name will appear in several pages',
          style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(height: TSizes.spaceBtwSections,),
          Form(
            key: controller.updateNameGlobal,
      child: Column(
        children: [
          TextFormField(
            controller: controller.firstName,
            validator:(value) => TValidator.validateEmptyText('first Name', value),
            expands: false,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person), labelText: TTexts.firstName),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),
         
            TextFormField(
              controller: controller.lastName,
              validator:(value) => TValidator.validateEmptyText('last Name', value),
              expands: false,
              decoration: const InputDecoration(
                  prefixIcon:  Icon(Icons.person),
                  labelText: TTexts.lastName,
                ),
            ),
         
      
        ],
      ),
    ),
    const SizedBox(height: TSizes.spaceBtwSections,),
    SizedBox(
      width: double.infinity,
      child: ElevatedButton(onPressed: () => controller.updateUserName(), child: const Text('save'),),
    )
        ],
      ),
      ),
    );
  }
}