import 'package:camera_flutter/presentation/pages/home/home.page.dart';
import 'package:flutter/material.dart';
class WidgetBottomSheet extends StatelessWidget {
  const WidgetBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text(
            "Thêm tiện ích vào\nmàn hình chính của bạn",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 28, fontWeight: FontWeight.w600),
          ),
          Expanded(
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return const TempWidget(color: Colors.white);
              },
            ),
          )
        ],
      ),
    );
  }
}
