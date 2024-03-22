import 'package:camera_flutter/domain/entities/enum/profile_enum.dart';
import 'package:camera_flutter/gen/assets.gen.dart';
import 'package:camera_flutter/localizations/app_localizations.dart';
import 'package:flutter/material.dart';

class ProfileUtils {
  static IconData iconSetting({required SettingType type}) {
    switch (type) {
      case SettingType.editProfilePicture:
        return Icons.account_circle;
      case SettingType.editName:
        return Icons.sell;
      case SettingType.editBirthDay:
        return Icons.celebration;
      case SettingType.changeEmail:
        return Icons.email;
      case SettingType.addTheWidget:
        return Icons.now_widgets_sharp;
      case SettingType.blocked:
        return Icons.block;
      case SettingType.restorePurchase:
        return Icons.settings_backup_restore;
      default:
        return Icons.error;
    }
  }

  static String titleSetting(
      {required SettingType type, required BuildContext context}) {
    final appLocalizations = AppLocalizations.of(context)!;
    switch (type) {
      case SettingType.editProfilePicture:
        return appLocalizations.editProfilePicture;
      case SettingType.editName:
        return appLocalizations.editName;
      case SettingType.editBirthDay:
        return appLocalizations.editBirthDay;
      case SettingType.changeEmail:
        return appLocalizations.changeEmail;
      case SettingType.addTheWidget:
        return appLocalizations.addTheWidget;
      case SettingType.blocked:
        return appLocalizations.blocked;
      case SettingType.restorePurchase:
        return appLocalizations.restorePurchase;
      default:
        return appLocalizations.myApp;
    }
  }

  static IconData iconSupport({required SupportType type}) {
    switch (type) {
      case SupportType.reportProblem:
        return Icons.error;
      case SupportType.makeSuggestion:
        return Icons.add_comment;
      default:
        return Icons.error;
    }
  }

  static String titleSupport(
      {required SupportType type, required BuildContext context}) {
    final appLocalizations = AppLocalizations.of(context)!;
    switch (type) {
      case SupportType.reportProblem:
        return appLocalizations.reportProblem;
      case SupportType.makeSuggestion:
        return appLocalizations.makeSuggestion;
      default:
        return appLocalizations.myApp;
    }
  }

  static dynamic iconFavorite({required FavoriteType type}) {
    switch (type) {
      case FavoriteType.tiktok:
        return Icons.tiktok;
      case FavoriteType.iconInstagram:
        return Assets.images.iconInstagram;
      case FavoriteType.iconTwitter:
        return Assets.images.iconTwitter;
      case FavoriteType.share:
        return Icons.ios_share;
      case FavoriteType.rate:
        return Icons.star_rate_rounded;
      case FavoriteType.termOfService:
        return Icons.newspaper;
      case FavoriteType.privacyPolicy:
        return Icons.policy;
      default:
        return Icons.error;
    }
  }

  static String titleFavorite(
      {required FavoriteType type, required BuildContext context}) {
    final appLocalizations = AppLocalizations.of(context)!;
    switch (type) {
      case FavoriteType.tiktok:
        return 'TikTok';
      case FavoriteType.iconInstagram:
        return 'Instagram';
      case FavoriteType.iconTwitter:
        return 'Twitter';
      case FavoriteType.share:
        return '${appLocalizations.share} ${appLocalizations.app}';
      case FavoriteType.rate:
        return '${appLocalizations.rate} ${appLocalizations.app}';
      case FavoriteType.termOfService:
        return appLocalizations.termOfService;
      case FavoriteType.privacyPolicy:
        return appLocalizations.privacyPolicy;
      default:
        return appLocalizations.myApp;
    }
  }

  static IconData iconDangerZone({required DangerZoneType type}) {
    switch (type) {
      case DangerZoneType.deleteAccount:
        return Icons.delete;
      case DangerZoneType.signOut:
        return Icons.waving_hand;
      default:
        return Icons.error;
    }
  }

  static String titleDangerZone(
      {required DangerZoneType type, required BuildContext context}) {
    final appLocalizations = AppLocalizations.of(context)!;
    switch (type) {
      case DangerZoneType.deleteAccount:
        return appLocalizations.dangerZone;
      case DangerZoneType.signOut:
        return appLocalizations.signOut;
      default:
        return appLocalizations.myApp;
    }
  }
}
