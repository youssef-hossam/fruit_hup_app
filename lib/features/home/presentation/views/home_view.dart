import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub_app/core/utils/app_images.dart';
import 'package:fruit_hub_app/core/utils/app_styles.dart';
import 'package:fruit_hub_app/features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:fruit_hub_app/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:fruit_hub_app/generated/l10n.dart';

class HomeView extends StatefulWidget {
  static const String routeName = '/home';
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selected = 0;
  late PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Main Pages
          SafeArea(
            child: PageView(
              controller: controller,
              onPageChanged: (index) {
                setState(() {
                  selected = index;
                });
              },
              children: const [
                HomeViewBody(),
                Center(child: Text('Star')),
                Center(child: Text('Style')),
                Center(child: Text('Profile')),
              ],
            ),
          ),

          // Floating Bottom Bar
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: CustomBottomNavigationBar(
              controller: controller,
              selected: selected,
            ),
          ),
        ],
      ),
    );
  }
}
