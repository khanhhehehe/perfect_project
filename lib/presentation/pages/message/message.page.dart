import 'package:camera_flutter/common/utils/dimens.dart';
import 'package:camera_flutter/localizations/app_localizations.dart';
import 'package:camera_flutter/presentation/pages/message/widgets/item_message.dart';
import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  final VoidCallback? onBack;

  const MessagePage({super.key, this.onBack});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: InkWell(
          onTap: onBack,
          child: const Icon(
            Icons.chevron_left,
            size: 42,
          ),
        ),
        title: Text(
          appLocalizations.generalMessage,
        ),
        centerTitle: true,
      ),
      body:SingleChildScrollView(
        child: SizedBox(
          width: DimensionApp.screenWidth,
          height: DimensionApp.screenHeight,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return const ItemMessage();
            },
            itemCount: 8,
          ),
        ),
      ),
    );
  }
}
