import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub_app/core/cubits/favorites_cubit/favorites_cubit.dart';
import 'package:fruit_hub_app/core/cubits/locale_cubit/locale_cubit.dart';
import 'package:fruit_hub_app/core/helper_function/get_saved_user.data.dart';
import 'package:fruit_hub_app/core/services/firebase_auth_service.dart';
import 'package:fruit_hub_app/core/services/get_it_service.dart';
import 'package:fruit_hub_app/core/utils/app_colors.dart';
import 'package:fruit_hub_app/core/utils/app_images.dart';
import 'package:fruit_hub_app/core/utils/app_styles.dart';
import 'package:fruit_hub_app/features/auth/presentation/views/login_view.dart';
import 'package:fruit_hub_app/features/favorites/presentation/views/favorites_view.dart';
import 'package:fruit_hub_app/features/notifications/presentation/views/notifications_view.dart';
import 'package:fruit_hub_app/features/orders/presentation/views/my_orders_view.dart';
import 'package:fruit_hub_app/generated/l10n.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final user = getSavedUserData();
    final favoritesCount = context.watch<FavoritesCubit>().state.length;

    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      children: [
        SizedBox(height: 16.h),
        Center(
          child: Text(s.profile,
              style: AppStyles.bodyLargeBold
                  .copyWith(color: AppColors.grayscale950)),
        ),
        SizedBox(height: 20.h),
        Row(
          children: [
            Stack(
              children: [
                const CircleAvatar(
                  radius: 36,
                  backgroundColor: AppColors.green150,
                  backgroundImage: AssetImage(Assets.imagesProfileImage),
                ),
                PositionedDirectional(
                  bottom: 0,
                  end: 0,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xffF1F1F5)),
                    ),
                    child: const Icon(Icons.camera_alt_outlined,
                        size: 14, color: AppColors.green1500),
                  ),
                ),
              ],
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user.name,
                      style: AppStyles.bodyBaseBold
                          .copyWith(color: AppColors.grayscale950)),
                  Text(user.email,
                      style: AppStyles.bodySmallRegular
                          .copyWith(color: AppColors.grayscale400)),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 24.h),
        _SectionTitle(s.general),
        _MenuTile(
          icon: Icons.inventory_2_outlined,
          title: s.myOrders,
          onTap: () => Navigator.pushNamed(context, MyOrdersView.routeName),
        ),
        _MenuTile(
          icon: Icons.favorite_border,
          title: s.favorites,
          trailingText: favoritesCount > 0 ? '$favoritesCount' : null,
          onTap: () => Navigator.pushNamed(context, FavoritesView.routeName),
        ),
        _MenuTile(
          icon: Icons.notifications_none_rounded,
          title: s.notifications,
          onTap: () =>
              Navigator.pushNamed(context, NotificationsView.routeName),
        ),
        BlocBuilder<LocaleCubit, Locale>(
          builder: (context, locale) => _MenuTile(
            icon: Icons.language_rounded,
            title: s.language,
            trailingText: locale.languageCode == 'ar' ? s.arabic : s.english,
            onTap: () => _chooseLanguage(context),
          ),
        ),
        SizedBox(height: 12.h),
        _SectionTitle(s.help),
        _MenuTile(
          icon: Icons.info_outline_rounded,
          title: s.aboutUs,
          onTap: () => showAboutDialog(
            context: context,
            applicationName: 'FruitHub',
            applicationVersion: '1.0.0',
            applicationIcon:
                Image.asset(Assets.imagesAppLogo, width: 48, height: 48),
            children: [Text(s.aboutText)],
          ),
        ),
        SizedBox(height: 24.h),
        InkWell(
          onTap: () => _logout(context),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            decoration: BoxDecoration(
              color: AppColors.green150,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(s.logout,
                    style: AppStyles.bodySmallBold
                        .copyWith(color: AppColors.green1500)),
                const SizedBox(width: 8),
                const Icon(Icons.logout_rounded,
                    color: AppColors.green1500, size: 20),
              ],
            ),
          ),
        ),
        SizedBox(height: 24.h),
      ],
    );
  }

  void _chooseLanguage(BuildContext context) {
    final cubit = context.read<LocaleCubit>();
    final s = S.of(context);
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      builder: (_) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            Text(s.language, style: AppStyles.bodyBaseBold),
            for (final entry in {'ar': s.arabic, 'en': s.english}.entries)
              RadioListTile<String>(
                value: entry.key,
                groupValue: cubit.state.languageCode,
                activeColor: AppColors.green1500,
                title: Text(entry.value, style: AppStyles.bodySmallsemiBold),
                onChanged: (v) {
                  cubit.changeLanguage(v!);
                  Navigator.pop(context);
                },
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _logout(BuildContext context) async {
    final s = S.of(context);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.white,
        title: Text(s.logoutConfirm,
            textAlign: TextAlign.center, style: AppStyles.bodyBaseBold),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: AppColors.green1500),
            onPressed: () => Navigator.pop(context, true),
            child: Text(s.confirm),
          ),
          OutlinedButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(s.cancel,
                style: const TextStyle(color: AppColors.green1500)),
          ),
        ],
      ),
    );
    if (confirmed != true || !context.mounted) return;
    await getIt<FirebaseAuthService>().signOut();
    if (!context.mounted) return;
    Navigator.of(context)
        .pushNamedAndRemoveUntil(LoginView.routeName, (route) => false);
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(text,
          style:
              AppStyles.bodySmallBold.copyWith(color: AppColors.grayscale950)),
    );
  }
}

class _MenuTile extends StatelessWidget {
  const _MenuTile({
    required this.icon,
    required this.title,
    required this.onTap,
    this.trailingText,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final String? trailingText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          onTap: onTap,
          leading: Icon(icon, color: AppColors.green1500),
          title: Text(title,
              style: AppStyles.bodySmallsemiBold
                  .copyWith(color: AppColors.grayscale400)),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (trailingText != null)
                Text(trailingText!,
                    style: AppStyles.bodySmallRegular
                        .copyWith(color: AppColors.grayscale950)),
              const SizedBox(width: 6),
              const Icon(Icons.arrow_forward_ios_rounded,
                  size: 14, color: AppColors.grayscale950),
            ],
          ),
        ),
        const Divider(height: 1, color: Color(0xffF2F3F3)),
      ],
    );
  }
}
