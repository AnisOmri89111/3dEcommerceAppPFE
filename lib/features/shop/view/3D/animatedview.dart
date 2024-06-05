import 'package:flutter/material.dart';
import 'package:pfeprojectcar/common/widgets/appbar/appbar.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class AnimatedScreen extends StatelessWidget {
  const AnimatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
     bool animation = false ;
    return  Scaffold(
      bottomNavigationBar: ElevatedButton(onPressed: () => animation = !animation, child: const Text('animate')),
      appBar: const CustomAppBar(showBackArrow: true,),
      body:  const Center(
        child: ModelViewer(
          src: "assets/3dasset/victorinox_multitool_knife.glb",
          alt: '3D models',
          disableZoom: false,
          autoRotate: false,
          cameraControls: true,
          backgroundColor: Colors.grey,
          autoPlay: true,
          
        ),
      ),
    );
  }
}