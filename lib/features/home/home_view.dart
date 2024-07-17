import 'package:flutter/material.dart';
import 'package:safesweep/features/home/active_view.dart';
import 'package:safesweep/features/home/setting_view.dart';
import 'package:safesweep/services/local_storage_service.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  void checkActiveStatus() async {
    final savedAttempts = localStorageService.read(LocalStorageKeys.attempts);
    await Future.delayed(Duration.zero);

    if (savedAttempts != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const ActiveView()));
    } else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const SettingView()));
    }
  }

  @override
  void initState() {
    super.initState();
    checkActiveStatus();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
