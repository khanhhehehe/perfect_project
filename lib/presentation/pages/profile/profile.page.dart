import 'package:camera_flutter/common/configs/routers/pages.dart';
import 'package:camera_flutter/common/utils/dimens.dart';
import 'package:camera_flutter/common/utils/spacing_unit.dart';
import 'package:camera_flutter/gen/assets.gen.dart';
import 'package:camera_flutter/presentation/pages/profile/widgets/item_detail.dart';
import 'package:camera_flutter/presentation/pages/profile/widgets/item_setting.dart';
import 'package:camera_flutter/presentation/pages/profile/widgets/item_widget.dart';
import 'package:camera_flutter/presentation/widgets/avatar/circle_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

final profilePageRoute = GoRoute(
    path: Pages.profile,
    builder: (context, GoRouterState state) => const ProfilePage());

class ProfilePage extends StatefulWidget {
  final VoidCallback? onBack;

  const ProfilePage({Key? key, this.onBack}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late ScrollController _scrollController;
  double _appBarOpacity = 1.0;
  bool _showRowInAppBar = false;
  bool _showAvatar = true;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    double offset = _scrollController.offset;
    double twentyPercentOfScreenHeight =
        MediaQuery.of(context).size.height * 0.19;

    double newOpacity = 1.0 - (offset / twentyPercentOfScreenHeight);
    newOpacity = 1.0 - newOpacity * 0.8;

    setState(() {
      _appBarOpacity = newOpacity.clamp(0.0, 1.0);
      _showRowInAppBar = offset >= twentyPercentOfScreenHeight;
      _showAvatar = offset == 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black.withOpacity(0.9),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: _showRowInAppBar
            ? const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatarWidget(
                    width: 50,
                    height: 50,
                    path: '',
                    color: Colors.transparent,
                  ),
                  SizedBox(
                    width: SpacingUnit.x1,
                  ),
                  Text(
                    "Khanhanbuoi",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontFamily: '',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            : Container(),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: widget.onBack,
            child: const Icon(Icons.chevron_right),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: Dimens.padding.top * 2),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Opacity(
                opacity: _showAvatar ? 1 : 1 - _appBarOpacity,
                child: Column(
                  children: [
                    GestureDetector(
                        onTap: () {},
                        child: const CircleAvatarWidget(
                            width: 150, height: 150, path: '')),
                    const SizedBox(height: SpacingUnit.x2_25),
                    const Text(
                      "data",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: SpacingUnit.x10,
              ),
              ItemSetting(iconData: Icons.search, title: "Friends", child: [
                ItemDetail(
                  iconData: Icons.people,
                  title: '9 Friends',
                  onTap: () {
                    print("hehe");
                  },
                )
              ]),
              ItemSetting(
                  pathSvg: Assets.images.iconWidget,
                  title: "Widget",
                  opacityWidget: 0,
                  padding: 4,
                  isUsingSvgFile: true,
                  child: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ItemWidget(
                            callback: () {},
                            isTutorial: true,
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Positioned(
                                      left: -30,
                                      top: 5,
                                      child: CircleAvatarWidget(
                                          padding: 0.8,
                                          width: 40,
                                          height: 40,
                                          path: ''),
                                    ),
                                    Positioned(
                                      left: 30,
                                      top: 5,
                                      child: CircleAvatarWidget(
                                          padding: 0.8,
                                          width: 48,
                                          height: 40,
                                          path: ''),
                                    ),
                                    CircleAvatarWidget(
                                        padding: 0.8,
                                        width: 50,
                                        height: 50,
                                        path: ''),
                                  ],
                                ),
                                SizedBox(
                                  height: SpacingUnit.x1,
                                ),
                                Text(
                                  "Everyone",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.3),
                                )
                              ],
                            )),
                        ItemWidget(
                          callback: () {},
                          isTutorial: false,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.orange, width: 3),
                                    borderRadius: BorderRadius.circular(
                                        Dimens.borderRadius * 5)),
                                child: Container(
                                    margin: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                        color: Colors.yellow.withOpacity(0.8),
                                        borderRadius: BorderRadius.circular(
                                            Dimens.borderRadius * 5)),
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 28,
                                    )),
                              ),
                              Container(
                                height: 40,
                                margin: const EdgeInsets.all(5),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 3),
                                width: Dimens.screenWidth,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(
                                          Dimens.borderRadius * 1.8),
                                      bottomRight: Radius.circular(
                                          Dimens.borderRadius * 1.8),
                                      topLeft: Radius.circular(
                                          Dimens.borderRadius * 0.8),
                                      topRight: Radius.circular(
                                          Dimens.borderRadius * 0.8),
                                    ),
                                    color: Colors.grey.withOpacity(0.4)),
                                child: const Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Create",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ]),
              ItemSetting(iconData: Icons.person, title: "General", child: [
                ItemDetail(
                  iconData: Icons.account_circle,
                  title: 'Edit profile picture',
                  onTap: () {
                    print("hehe");
                  },
                ),
                ItemDetail(
                  iconData: Icons.sell,
                  title: 'Edit name',
                  onTap: () {
                    print("hehe");
                  },
                ),
                ItemDetail(
                  iconData: Icons.celebration,
                  title: 'Edit birthday',
                  onTap: () {
                    print("hehe");
                  },
                ),
                ItemDetail(
                  iconData: Icons.email,
                  title: 'Change email address',
                  onTap: () {
                    print("hehe");
                  },
                ),
                ItemDetail(
                  iconData: Icons.now_widgets_sharp,
                  title: 'How to add the widget',
                  onTap: () {
                    print("hehe");
                  },
                ),
                ItemDetail(
                  iconData: Icons.block,
                  title: 'Blocked',
                  onTap: () {
                    print("hehe");
                  },
                ),
                ItemDetail(
                  iconData: Icons.settings_backup_restore,
                  title: 'Restore purchases',
                  onTap: () {
                    print("hehe");
                  },
                ),
              ]),
              ItemSetting(
                  iconData: Icons.support_agent,
                  title: "Support",
                  child: [
                    ItemDetail(
                        title: 'Report a problem',
                        iconData: Icons.error,
                        onTap: () {
                          print("hehe");
                        }),
                    ItemDetail(
                        title: 'Make a suggestion',
                        iconData: Icons.add_comment,
                        onTap: () {
                          print("hehe");
                        }),
                  ]),
              ItemSetting(title: 'About', iconData: Icons.favorite, child: [
                ItemDetail(
                  title: 'TikTok',
                  onTap: () {},
                  iconData: Icons.tiktok,
                ),
                ItemDetail(
                  title: 'Instasgram',
                  onTap: () {},
                  isUsingSvgFile: true,
                  pathSvg: Assets.images.iconInstagram,
                ),
                ItemDetail(
                  title: 'Twitter',
                  onTap: () {},
                  isUsingSvgFile: true,
                  pathSvg: Assets.images.iconTwitter,
                ),
                ItemDetail(
                  title: 'Share Locket',
                  onTap: () {},
                  iconData: Icons.ios_share,
                ),
                ItemDetail(
                  title: 'Rate Locket',
                  onTap: () {},
                  iconData: Icons.star_rate_rounded,
                ),
                ItemDetail(
                  title: 'Terms of Service',
                  onTap: () {},
                  iconData: Icons.newspaper,
                ),
                ItemDetail(
                  title: 'Privacy Policy',
                  onTap: () {},
                  iconData: Icons.policy,
                ),
              ]),
              ItemSetting(
                  title: 'Danger Zone',
                  iconData: Icons.gpp_maybe,
                  child: [
                    ItemDetail(
                      title: 'Delete account',
                      onTap: () {},
                      iconData: Icons.delete,
                    ),
                    ItemDetail(
                      title: 'Sign out',
                      onTap: () {},
                      iconData: Icons.waving_hand,
                    ),
                  ])
            ],
          ),
        ),
      ),
    );
  }
}
