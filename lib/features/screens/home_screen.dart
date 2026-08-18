import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_strings.dart';
import 'package:news_app/core/utils/app_styles.dart';
import 'package:news_app/features/screens/widgets/custom_drawer_widget.dart';
import 'package:news_app/features/screens/widgets/custom_home_body_widget.dart';
import '../../core/utils/app_assets.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/widgets/custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return  Scaffold(
      drawer: CustomDrawerWidget(),
      appBar: CustomAppBar(theme: theme),
      body: CustomHomeBodyWidget(),
    );
  }
}






