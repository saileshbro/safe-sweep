import 'package:flutter/material.dart';
import 'package:safesweep/constants/app_images.dart';
import 'package:safesweep/features/permission/permission_view.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        children: [
          const SizedBox(
            width: 32,
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PermissionView(),
                  ),
                );
              },
              child: const Text("Get Started"),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 32,
              ),
              Image.asset(
                AppImages.logo,
                width: MediaQuery.of(context).size.width / 2,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Welcome to Safe Sweep",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                "Protect your device with our secure solution.\n\n If multiple failed unlock attempts occur,\n SafeSweep will wipe your data to protect sensitive information getting in wrong hands.\n\n Set up now for peace of mind.",
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
