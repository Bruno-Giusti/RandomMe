import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then(
      (_) => Navigator.of(context).pushReplacementNamed('/profile'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.lightBlueAccent,
        child: const Center(
          child: CircularProgressIndicator(
            color: Colors.white54,
          ),
        ));
  }
}
