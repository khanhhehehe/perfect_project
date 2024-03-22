import 'package:camera_flutter/common/utils/spacing_unit.dart';
import 'package:flutter/material.dart';

class EditNameBottomSheet extends StatelessWidget {
  const EditNameBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "Sửa tên của bạn",
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
        const Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                  labelText: 'First Name',
                  hintText: 'Enter your first name',
                ),
              ),
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                  labelText: 'Last Name',
                  hintText: 'Enter your last name',
                ),
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {
            // Do something
          },
          child: const Text("Save"),
        ),
        const SizedBox(
          height: SpacingUnit.x1,
        )
      ],
    );
  }
}
