import 'package:camera_flutter/gen/dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final VoidCallback? onBack;

  const ProfilePage({Key? key, this.onBack}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.9),
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          InkWell(
            child: Icon(Icons.chevron_right),
            onTap: widget.onBack,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: Dimens.screenWidth,
          height: Dimens.screenHeight,
          child: ListView.builder(

            itemBuilder: (context, index) {
              return Container(
                color: Colors.black.withOpacity(0.9),
                height: 100.0,
                child: Center(
                  child: Text(
                    '$index',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              );
            },
            itemCount: 20,
          ),
        ),
      ),
    );
  }
}
