import 'dart:ui';
import 'package:camera_flutter/common/utils/dimens.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final VoidCallback? callback;
  final Widget child;
  final bool isTutorial;
  const ItemWidget({Key? key, this.callback, required this.child, required this.isTutorial})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: SizedBox(
        width: 180,
        height: 180,
        child: Stack(
          children: [
            if(isTutorial) Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                    16), 
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                      sigmaX: 5,
                      sigmaY:
                          5), 
                  child: Container(
                    color: Colors.black
                        .withOpacity(0.5), 
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(DimensionApp.borderRadius*2), 
                  border: Border.all(color: Colors.grey.withOpacity(0.4), width: 4),
                  gradient:LinearGradient(
                    colors: isTutorial? [Colors.blue.withOpacity(0.5), Colors.green.withOpacity(0.5)]:[Colors.white.withOpacity(0.2),Color.fromARGB(255, 214, 211, 211).withOpacity(0.2)], 
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: child,
              ),
            ),
          ],
        )
      ),
    );
  }
}
