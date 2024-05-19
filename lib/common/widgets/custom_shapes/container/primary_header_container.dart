import 'package:flutter/cupertino.dart';
import 'package:pfeprojectcar/common/widgets/custom_shapes/container/circular_container.dart';
import 'package:pfeprojectcar/common/widgets/custom_shapes/curvedshape/curved_edge_widget.dart';
import 'package:pfeprojectcar/utils/constants/colors.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
  super.key, 
  required this.child});
  final Widget child ;
  @override
  Widget build(BuildContext context) {
    return  CurvedEdgeWidget(
              child:  Container(
                 color: TColors.primary,
                 padding: const EdgeInsets.all(0),
                 child: SizedBox(
                   height: 400,
                   child: Stack(
                    children: [
                    Positioned(top: -150 , right: -250, child: CustomContainer(backgroundColor: TColors.textWhite.withOpacity(0.1))),
                    Positioned(top: 100 , right : -300 , child: CustomContainer(backgroundColor: TColors.textWhite.withOpacity(0.1))),
                    child
                    ],
                   ),
                 ),
                
                )
             );
  }
}