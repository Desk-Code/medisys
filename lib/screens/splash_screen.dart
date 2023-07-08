import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medisys/content/string.dart';
import 'package:medisys/screens/login_page.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Stack(
        children: [
          Container(
            height: mediaQuery.height * 0.8,
            color: Colors.grey.shade200,
            alignment: Alignment.center,
            child: Lottie.asset(
              "assets/animation/preventive-health-care.json",
              controller: _animationController,
              onLoaded: (compos) {
                _animationController
                  ..duration = compos.duration
                  ..forward().then((value) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ));
                  });
              },
            ),
          ),
          Container(
            height: mediaQuery.height * 0.1,
            margin: EdgeInsets.only(top: mediaQuery.height * 0.70),
            alignment: Alignment.center,
            child: Text(
              StringData.appName,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
