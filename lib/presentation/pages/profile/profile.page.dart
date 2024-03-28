import 'package:camera_flutter/common/configs/locators.dart';
import 'package:camera_flutter/common/configs/routers/navigation.dart';
import 'package:camera_flutter/common/configs/routers/pages.dart';
import 'package:camera_flutter/common/utils/dimens.dart';
import 'package:camera_flutter/common/utils/spacing_unit.dart';
import 'package:camera_flutter/gen/assets.gen.dart';
import 'package:camera_flutter/localizations/app_localizations.dart';
import 'package:camera_flutter/presentation/pages/profile/widgets/bottom_sheets/edit_name_bottom_sheet.dart';
import 'package:camera_flutter/presentation/pages/profile/widgets/bottom_sheets/widget_bottom_sheet.dart';
import 'package:camera_flutter/presentation/pages/profile/widgets/items/item_detail.dart';
import 'package:camera_flutter/presentation/pages/profile/widgets/items/item_setting.dart';
import 'package:camera_flutter/presentation/pages/profile/widgets/items/item_widget.dart';
import 'package:camera_flutter/presentation/widgets/avatar/circle_avatar.dart';
import 'package:camera_flutter/presentation/widgets/bottom_sheets/friend_bottom_sheet.dart';
import 'package:camera_flutter/presentation/widgets/bottom_sheets/content.dart';
import 'package:flutter/material.dart';
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
    final appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black.withOpacity(0.9),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
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
        padding: EdgeInsets.only(top: DimensionApp.padding.top * 0.3),
        child: ListView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          children: [
            Column(
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
                        "Khanh an buoi",
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
                ItemSetting(
                    iconData: Icons.search,
                    title: appLocalizations.friend,
                    child: [
                      ItemDetail(
                        iconData: Icons.people,
                        title: '${9} ${appLocalizations.friend}',
                        onTap: () {
                          showAppModalBottomSheet(
                            context: context,
                            child: const FriendBottomSheet(),
                          );
                        },
                      )
                    ]),
                ItemSetting(
                    pathSvg: Assets.images.iconWidget,
                    title: appLocalizations.widget,
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Stack(
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
                                  const SizedBox(
                                    height: SpacingUnit.x1,
                                  ),
                                  Text(
                                    appLocalizations.everyone,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.3),
                                  )
                                ],
                              )),
                          ItemWidget(
                            callback: () {
                              showAppModalBottomSheet(
                                context: context,
                                child: const WidgetBottomSheet(),
                              );
                            },
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
                                          DimensionApp.borderRadius * 5)),
                                  child: Container(
                                      margin: const EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                          color: Colors.yellow.withOpacity(0.8),
                                          borderRadius: BorderRadius.circular(
                                              DimensionApp.borderRadius * 5)),
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
                                  width: DimensionApp.screenWidth,
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(
                                            DimensionApp.borderRadius * 1.8),
                                        bottomRight: Radius.circular(
                                            DimensionApp.borderRadius * 1.8),
                                        topLeft: Radius.circular(
                                            DimensionApp.borderRadius * 0.8),
                                        topRight: Radius.circular(
                                            DimensionApp.borderRadius * 0.8),
                                      ),
                                      color: Colors.grey.withOpacity(0.4)),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      appLocalizations.create,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
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
                ItemSetting(
                    iconData: Icons.person,
                    title: appLocalizations.general,
                    child: [
                      ItemDetail(
                        iconData: Icons.account_circle,
                        title: appLocalizations.editProfilePicture,
                        onTap: () {
                          print("hehe");
                        },
                      ),
                      ItemDetail(
                        iconData: Icons.sell,
                        title: appLocalizations.editName,
                        onTap: () {
                          showAppModalBottomSheet(
                              context: context,
                              child: const EdigNametBottomSheet());
                        },
                      ),
                      ItemDetail(
                        iconData: Icons.celebration,
                        title: appLocalizations.editBirthDay,
                        onTap: () {
                          print("hehe");
                        },
                      ),
                      ItemDetail(
                        iconData: Icons.email,
                        title: appLocalizations.changeEmail,
                        onTap: () {
                          print("hehe");
                        },
                      ),
                      ItemDetail(
                        iconData: Icons.now_widgets_sharp,
                        title: appLocalizations.addTheWidget,
                        onTap: () {
                          print("hehe");
                        },
                      ),
                      ItemDetail(
                        iconData: Icons.block,
                        title: appLocalizations.blocked,
                        onTap: () {
                          print("hehe");
                        },
                      ),
                      ItemDetail(
                        iconData: Icons.settings_backup_restore,
                        title: appLocalizations.restorePurchase,
                        onTap: () {
                          print("hehe");
                        },
                      ),
                    ]),
                ItemSetting(
                    iconData: Icons.support_agent,
                    title: appLocalizations.support,
                    child: [
                      ItemDetail(
                          title: appLocalizations.reportProblem,
                          iconData: Icons.error,
                          onTap: () {
                            print("hehe");
                          }),
                      ItemDetail(
                          title: appLocalizations.makeSuggestion,
                          iconData: Icons.add_comment,
                          onTap: () {
                            print("hehe");
                          }),
                    ]),
                ItemSetting(
                    title: appLocalizations.about,
                    iconData: Icons.favorite,
                    child: [
                      ItemDetail(
                        title: 'TikTok',
                        onTap: () {},
                        iconData: Icons.tiktok,
                      ),
                      ItemDetail(
                        title: 'Instagram',
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
                        title:
                            '${appLocalizations.share} ${appLocalizations.app}',
                        onTap: () {},
                        iconData: Icons.ios_share,
                      ),
                      ItemDetail(
                        title:
                            '${appLocalizations.rate} ${appLocalizations.app}',
                        onTap: () {},
                        iconData: Icons.star_rate_rounded,
                      ),
                      ItemDetail(
                        title: appLocalizations.termOfService,
                        onTap: () {
                          getIt<AppNavigation>().push(page: Pages.term);
                        },
                        iconData: Icons.newspaper,
                      ),
                      ItemDetail(
                        title: appLocalizations.privacyPolicy,
                        onTap: () {
                          getIt<AppNavigation>().push(page: Pages.policy);
                        },
                        iconData: Icons.policy,
                      ),
                    ]),
                ItemSetting(
                    title: appLocalizations.dangerZone,
                    iconData: Icons.gpp_maybe,
                    child: [
                      ItemDetail(
                        title: appLocalizations.deleteAccount,
                        onTap: () {},
                        iconData: Icons.delete,
                      ),
                      ItemDetail(
                        title: appLocalizations.signOut,
                        onTap: () {},
                        iconData: Icons.waving_hand,
                      ),
                    ])
              ],
            )
          ],
        ),
      ),
    );
  }
}
