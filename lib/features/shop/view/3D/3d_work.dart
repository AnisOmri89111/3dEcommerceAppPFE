import 'package:flutter/material.dart';
import 'package:pfeprojectcar/common/widgets/appbar/appbar.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:get/get.dart';
import 'package:pfeprojectcar/features/shop/view/3D/animatedview.dart';

class PreviewScreen extends StatelessWidget {
  const PreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: ElevatedButton(onPressed: () => Get.to(() => const AnimatedScreen()), child: const Text('Show Engine')),
      appBar: const CustomAppBar(showBackArrow: true,),
      body: const Center(
        child: ModelViewer(
          src: "assets/3dasset/uploads_files_4735787_Honda+civic+type+R.glb",
          alt: '3D models',
          disableZoom: false,
          autoRotate: false,
          cameraControls: true,
          backgroundColor: Colors.grey,
          
        ),
      ),
    );
  }
}