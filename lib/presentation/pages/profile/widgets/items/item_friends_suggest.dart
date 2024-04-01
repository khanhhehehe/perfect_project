import 'package:camera_flutter/common/utils/spacing_unit.dart';
import 'package:camera_flutter/themes/color_style.dart';
import 'package:flutter/material.dart';

class ItemFriendsSuggest extends StatelessWidget {
  final String userName;
  final VoidCallback? addFriend;
  const ItemFriendsSuggest({super.key, this.userName = '', this.addFriend});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(SpacingUnit.x0_25),
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFF383735), width: 2),
              borderRadius: BorderRadius.circular(SpacingUnit.x25)),
          child: Container(
            height: 55,
            width: 55,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: const Color(0xFF383735),
                borderRadius: BorderRadius.circular(SpacingUnit.x25)),
            child: Text(
              userName.substring(0, 1).toUpperCase(),
              style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontWeight: FontWeight.w700,
                  fontSize: 20),
            ),
          ),
        ),
        const SizedBox(width: SpacingUnit.x2),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(userName,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700)),
              Text("Đã có trên Locket 💛",
                  style: TextStyle(
                      color: Colors.grey.withOpacity(0.8),
                      fontSize: 16,
                      fontWeight: FontWeight.w500)),
            ],
          ),
        ),
        ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: MyAppColors.cusorColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(SpacingUnit.x5))),
            child: const Row(
              children: [
                Icon(Icons.add, color: Colors.black),
                SizedBox(width: SpacingUnit.x2),
                Text(
                  'Thêm',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.black),
                )
              ],
            ))
      ],
    );
  }
}
