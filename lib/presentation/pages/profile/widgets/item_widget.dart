import 'package:camera_flutter/common/utils/dimens.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final VoidCallback? callback;
  const ItemWidget({super.key,  this.callback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        width: 180,
        height: 180,
        decoration: BoxDecoration(
        color: Colors.red,
          borderRadius: BorderRadius.circular(Dimens.borderRadius*2)
        ),
        child: const Align(alignment: Alignment.center,child: Text("Lười")),
      ),
    );
  }
}