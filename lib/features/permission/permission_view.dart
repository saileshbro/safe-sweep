import 'package:device_policy_manager/device_policy_manager.dart';
import 'package:flutter/material.dart';
import 'package:safesweep/constants/app_images.dart';
import 'package:safesweep/features/home/home_view.dart';
import 'package:safesweep/services/toast_service.dart';

class PermissionView extends StatelessWidget {
  const PermissionView({super.key});

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
              onPressed: () async {
                final permission = await DevicePolicyManager.requestPermession(
                    "Your app is requesting the Adminstration permission");

                if (permission) {
                  toastService.s("Permission Granted.");
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeView()));
                } else {
                  toastService
                      .e("Device admin permission is required to proceed.");
                }
              },
              child: const Text("Grant Permissions"),
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
                AppImages.shield,
                width: MediaQuery.of(context).size.width / 2,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Activate Device Admin Permissions",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "To enhance security, Safe Sweep requires device admin permissions. This allows us to wipe your device after a set number of unsuccessful attempts.",
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
