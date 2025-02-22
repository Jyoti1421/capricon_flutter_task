import 'package:capricon_flutter_task/constant/image_asset.dart';
import 'package:capricon_flutter_task/constant/string_constant.dart';
import 'package:capricon_flutter_task/widgets/custom_app_bar.dart';
import 'package:capricon_flutter_task/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: StringConstants.login),

      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  ImageAssets.backgroundImage,
                ), // Your background image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content on top of the background image
          const Center(
            child: SingleChildScrollView(
              child: Padding(padding: EdgeInsets.all(16.0), child: LoginForm()),
            ),
          ),
        ],
      ),
    );
  }
}
