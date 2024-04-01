import 'package:camera_flutter/common/utils/spacing_unit.dart';
import 'package:camera_flutter/domain/entities/enum/social_media.dart';
import 'package:camera_flutter/gen/fonts.gen.dart';
import 'package:camera_flutter/localizations/app_localizations.dart';
import 'package:camera_flutter/presentation/pages/profile/widgets/items/item_friends_suggest.dart';
import 'package:camera_flutter/presentation/pages/profile/widgets/items/item_your_friends.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FriendBottomSheet extends StatelessWidget {
  const FriendBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style:
                TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 22),
            children: const <TextSpan>[
              TextSpan(
                  text: '${10} / 20 ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24)),
              TextSpan(
                  text: ' người bạn',
                  style: TextStyle(
                      fontFamily: FontFamily.sFCompact,
                      fontWeight: FontWeight.w600)),
            ],
          ),
        ),
        Text(
          'Thêm các bạn thân của bạn',
          style: TextStyle(
              color: Colors.grey.withOpacity(0.7),
              fontSize: 18,
              fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: SpacingUnit.x4),
        Container(
          padding: const EdgeInsets.symmetric(vertical: SpacingUnit.x3_5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(SpacingUnit.x4),
              color: const Color(0xFF383735)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.search,
                color: Colors.white.withOpacity(0.9),
              ),
              const SizedBox(width: SpacingUnit.x2),
              Text('Thêm một người bạn mới',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 18,
                      fontWeight: FontWeight.w700))
            ],
          ),
        ),
        const SizedBox(height: SpacingUnit.x4_5),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.saved_search,
                        color: Colors.grey.withOpacity(0.7)),
                    Text('Tìm bạn bè từ các ứng dụng khác',
                        style: TextStyle(
                            color: Colors.grey.withOpacity(0.7),
                            fontSize: 20,
                            fontWeight: FontWeight.w700))
                  ],
                ),
                const SizedBox(height: SpacingUnit.x2),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: SpacingUnit.x4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(SpacingUnit.x3),
                      color: const Color(0xFF2D2C2A)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: SocialMedia.values
                          .map((e) => Column(
                                children: [
                                  Container(
                                    padding:
                                        const EdgeInsets.all(SpacingUnit.x0_25),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.amber, width: 2),
                                        borderRadius: BorderRadius.circular(
                                            SpacingUnit.x25)),
                                    child: Container(
                                      height: 55,
                                      width: 55,
                                      decoration: BoxDecoration(
                                          color: Colors.amber,
                                          borderRadius: BorderRadius.circular(
                                              SpacingUnit.x25)),
                                    ),
                                  ),
                                  const SizedBox(height: SpacingUnit.x2),
                                  Text(_socialName(context, e),
                                      style:
                                          const TextStyle(color: Colors.white))
                                ],
                              ))
                          .toList()),
                ),
                const SizedBox(height: SpacingUnit.x4_5),
                Row(
                  children: [
                    Icon(Icons.people_alt, color: Colors.grey.withOpacity(0.7)),
                    Text('Bạn bè của bạn',
                        style: TextStyle(
                            color: Colors.grey.withOpacity(0.7),
                            fontSize: 20,
                            fontWeight: FontWeight.w700))
                  ],
                ),
                const SizedBox(height: SpacingUnit.x2),
                SizedBox(
                  height: 4 * SpacingUnit.x17_5,
                  child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: SpacingUnit.x2_5),
                    padding: const EdgeInsets.only(top: SpacingUnit.x1),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: (context, index) => ItemYourFriends(),
                  ),
                ),
                const SizedBox(height: SpacingUnit.x5),
                Row(
                  children: [
                    Icon(Icons.stars, color: Colors.grey.withOpacity(0.7)),
                    Text('Các đề xuất',
                        style: TextStyle(
                            color: Colors.grey.withOpacity(0.7),
                            fontSize: 20,
                            fontWeight: FontWeight.w700))
                  ],
                ),
                const SizedBox(height: SpacingUnit.x2),
                SizedBox(
                  height: 3 * SpacingUnit.x17_5,
                  child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: SpacingUnit.x2_5),
                    padding: const EdgeInsets.only(top: SpacingUnit.x1),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) => ItemFriendsSuggest(userName: 'ten user',),
                  ),
                ),
                const SizedBox(height: SpacingUnit.x5),
              ],
            ),
          ),
        )
      ],
    );
  }
}

String _socialName(BuildContext context, SocialMedia socialMedia) {
  final appLocalizations = AppLocalizations.of(context)!;
  switch (socialMedia) {
    case SocialMedia.mess:
      return 'Messenger';
    case SocialMedia.insta:
      return 'Insta';
    case SocialMedia.sms:
      return appLocalizations.message;
    case SocialMedia.different:
      return appLocalizations.different;
    default:
      return '';
  }
}
