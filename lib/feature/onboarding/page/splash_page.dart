import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'onboarding_page.dart';
import '../widgets/splash_painter.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final FlutterSecureStorage _secureStorage= FlutterSecureStorage();
  @override
  void initState() {
    super.initState();
    _checkAuth();

    }
    Future<void> _checkAuth() async{
    final token = await _secureStorage.read(key: "token");

    await Future.delayed(Duration(seconds: 4));

    if(!mounted) return;
    if (token!=null && token.isNotEmpty) {
      context.go("/home-page");
    } else{
      context.go("/onboarding-page");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomPaint(
        painter: SplashPainter(),
        child: Center(child: SvgPicture.asset("assets/splash.svg")),
      ),
    );
  }
}
