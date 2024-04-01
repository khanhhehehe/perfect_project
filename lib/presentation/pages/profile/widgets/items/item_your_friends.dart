import 'package:camera_flutter/common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';

class ItemYourFriends extends StatelessWidget {
  final String userName;
  final String image;
  final VoidCallback? delete;
  const ItemYourFriends(
      {super.key, this.userName = '', this.image = '', this.delete});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(SpacingUnit.x0_25),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.amber, width: 2),
              borderRadius: BorderRadius.circular(SpacingUnit.x25)),
          child: Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(SpacingUnit.x25)),
          ),
        ),
        const SizedBox(width: SpacingUnit.x2),
        Expanded(
          child: Text(userName,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700)),
        ),
        IconButton(
          onPressed: () => delete?.call(),
          padding: EdgeInsets.zero,
          icon: Icon(
            Icons.close,
            color: Colors.white.withOpacity(0.8),
          ),
        )
      ],
    );
  }
}
