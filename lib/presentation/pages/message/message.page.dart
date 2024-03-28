import 'package:camera_flutter/localizations/app_localizations.dart';
import 'package:camera_flutter/presentation/pages/message/widgets/item_message.dart';
import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  final VoidCallback? onBack;

  const MessagePage({Key? key, this.onBack}) : super(key: key);

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: AppBar(
            backgroundColor: Colors.transparent,
            leading: InkWell(
              onTap: widget.onBack,
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
        ),
        Positioned(
          top: AppBar().preferredSize.height + 40,
          left: 0,
          right: 0,
          bottom: 0,
          child: ListView.builder(
            padding: const EdgeInsets.only(top: 10),
            itemCount: 22,
            itemBuilder: (context, index) {
              return const ItemMessage();
            },
          ),
        ),
      ],
    );
  }
}
