import 'package:flutter/material.dart';
import 'package:safesweep/constants/app_images.dart';
import 'package:safesweep/features/home/setting_view.dart';

class ActiveView extends StatelessWidget {
  const ActiveView({super.key});

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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingView(),
                  ),
                );
              },
              child: const Text("Update Settings"),
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
                "Lock Protection Active",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Your device is now secured. After the set number of attempts, your device will be wiped automatically.\n\nYou may update the settings at any time. If the services are no longer necessary, you may uninstall the application.",
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
