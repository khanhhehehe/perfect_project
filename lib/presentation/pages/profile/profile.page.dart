import 'package:camera_flutter/common/configs/locators.dart';
import 'package:camera_flutter/common/configs/routers/navigation.dart';
import 'package:camera_flutter/common/configs/routers/pages.dart';
import 'package:camera_flutter/common/utils/dimens.dart';
import 'package:camera_flutter/common/utils/spacing_unit.dart';
import 'package:camera_flutter/domain/entities/enum/profile_enum.dart';
import 'package:camera_flutter/gen/assets.gen.dart';
import 'package:camera_flutter/localizations/app_localizations.dart';
import 'package:camera_flutter/presentation/pages/profile/utils/profile_utils.dart';
import 'package:camera_flutter/presentation/pages/profile/widgets/bottom_sheets/edit_name_bottom_sheet.dart';
import 'package:camera_flutter/presentation/pages/profile/widgets/bottom_sheets/widget_bottom_sheet.dart';
import 'package:camera_flutter/presentation/pages/profile/widgets/items/item_detail.dart';
import 'package:camera_flutter/presentation/pages/profile/widgets/items/item_setting.dart';
import 'package:camera_flutter/presentation/pages/profile/widgets/profile_app_bar.dart';
import 'package:camera_flutter/presentation/pages/profile/widgets/profile_avatar.dart';
import 'package:camera_flutter/presentation/pages/profile/widgets/setting_widget.dart';
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

  void _search() {
    showAppModalBottomSheet(
      context: context,
      child: const FriendBottomSheet(),
    );
  }

  void _widget() {
    showAppModalBottomSheet(
      context: context,
      child: const WidgetBottomSheet(),
    );
  }

  bool _isUseSvg(FavoriteType type) {
    if (type == FavoriteType.iconInstagram ||
        type == FavoriteType.iconTwitter) {
      return true;
    }
    return false;
  }

  IconData? _iconFavorite(FavoriteType type) {
    if (type == FavoriteType.iconInstagram ||
        type == FavoriteType.iconTwitter) {
      return null;
    }
    return ProfileUtils.iconFavorite(type: type);
  }

  String? _pathFavorite(FavoriteType type) {
    if (type == FavoriteType.iconInstagram ||
        type == FavoriteType.iconTwitter) {
      return ProfileUtils.iconFavorite(type: type);
    }
    return null;
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
            ? const ProfileAppBar(
                avatar: '',
                username: "Khanhne",
              )
            : const SizedBox(),
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
                ProfileAvatar(showAvatar: _showAvatar, opacity: _appBarOpacity),
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
                        onTap: () => _search(),
                      )
                    ]),
                ItemSetting(
                    pathSvg: Assets.images.iconWidget,
                    title: appLocalizations.widget,
                    opacityWidget: 0,
                    padding: 4,
                    isUsingSvgFile: true,
                    child: [
                      SettingWidget(
                        onPressFirst: () {},
                        onPressSecond: () => _widget(),
                      )
                    ]),
                ItemSetting(
                    iconData: Icons.person,
                    title: appLocalizations.general,
                    child: SettingType.values
                        .map((e) => ItemDetail(
                            title: ProfileUtils.titleSetting(
                                type: e, context: context),
                            iconData: ProfileUtils.iconSetting(type: e),
                            onTap: () => _onPressSetting(e)))
                        .toList()),
                ItemSetting(
                  iconData: Icons.support_agent,
                  title: appLocalizations.support,
                  child: SupportType.values
                      .map((e) => ItemDetail(
                            title: ProfileUtils.titleSupport(
                                type: e, context: context),
                            iconData: ProfileUtils.iconSupport(type: e),
                            onTap: () => _onPressSupport(e),
                          ))
                      .toList(),
                ),
                ItemSetting(
                  title: appLocalizations.about,
                  iconData: Icons.favorite,
                  child: FavoriteType.values
                      .map((e) => ItemDetail(
                            title: ProfileUtils.titleFavorite(
                                type: e, context: context),
                            isUsingSvgFile: _isUseSvg(e),
                            iconData: _iconFavorite(e),
                            pathSvg: _pathFavorite(e),
                            onTap: () => _onPressFavorite(e),
                          ))
                      .toList(),
                ),
                ItemSetting(
                  title: appLocalizations.dangerZone,
                  iconData: Icons.gpp_maybe,
                  child: DangerZoneType.values
                      .map((e) => ItemDetail(
                          title: ProfileUtils.titleDangerZone(
                              type: e, context: context),
                          iconData: ProfileUtils.iconDangerZone(type: e),
                          onTap: () => _onPressDangerZone(e)))
                      .toList(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _onPressSetting(SettingType type) {
    switch (type) {
      case SettingType.editProfilePicture:
        print('1');
        break;
      case SettingType.editName:
        showAppModalBottomSheet(
            context: context, child: const EditNameBottomSheet());
        break;
      case SettingType.editBirthDay:
        print('3');
        break;
      case SettingType.changeEmail:
        print('4');
        break;
      case SettingType.addTheWidget:
        _widget();
        break;
      case SettingType.blocked:
        print('6');
        break;
      case SettingType.restorePurchase:
        print('7');
        break;
      default:
        print('8');
        break;
    }
  }

  void _onPressSupport(SupportType type) {
    switch (type) {
      case SupportType.reportProblem:
        print('9');
        break;
      case SupportType.makeSuggestion:
        print('10');
        break;
      default:
        print('11');
        break;
    }
  }

  void _onPressFavorite(FavoriteType type) {
    switch (type) {
      case FavoriteType.tiktok:
        print('9');
        break;
      case FavoriteType.iconInstagram:
        print('10');
        break;
      case FavoriteType.iconTwitter:
        print('10');
        break;
      case FavoriteType.share:
        print('10');
        break;
      case FavoriteType.rate:
        print('10');
        break;
      case FavoriteType.termOfService:
        getIt<AppNavigation>().push(page: Pages.term);
        break;
      case FavoriteType.privacyPolicy:
        getIt<AppNavigation>().push(page: Pages.policy);
        break;
      default:
        print('11');
        break;
    }
  }

  void _onPressDangerZone(DangerZoneType type) {
    switch (type) {
      case DangerZoneType.deleteAccount:
        print('9');
        break;
      case DangerZoneType.signOut:
        print('10');
        break;
      default:
        print('11');
        break;
    }
  }
}
