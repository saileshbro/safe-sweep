import 'package:device_policy_manager/device_policy_manager.dart';
import 'package:flutter/material.dart';
import 'package:safesweep/features/home/home_view.dart';
import 'package:safesweep/services/local_storage_service.dart';
import 'package:safesweep/services/toast_service.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  String attempts = "5";

  void fetchSavedAttempts() {
    final savedAttempts = localStorageService.read(LocalStorageKeys.attempts);

    if (savedAttempts != null) {
      setState(() {
        attempts = savedAttempts;
      });
    }
  }

  @override
  void initState() {
    fetchSavedAttempts();
    super.initState();
  }

  void setupLocks() async {
    final N = int.tryParse(attempts);

    if (N == null) {
      toastService.e("Enter a valid value for number of attempts.");
      return;
    }

    if (N < 3 || N > 20) {
      toastService.e("Number of attempts must be within 3 - 20");
      return;
    }

    await localStorageService.write(LocalStorageKeys.attempts, attempts);
    toastService.s("Lock attempts set to $N.");

    Future.delayed(const Duration(milliseconds: 100), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeView(),
        ),
      );
    });

    await DevicePolicyManager.setMaxFailedPassword(N);
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 24,
              ),
              const Row(
                children: [
                  Icon(
                    Icons.lock_outline_rounded,
                    size: 72,
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Setup Lock Attempts",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Specify the number of attempts allowed before the device data is wiped.",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 32,
              ),
              const Row(
                children: [
                  Text("Number of Attempts"),
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              Form(
                key: _formKey,
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  initialValue: attempts,
                  onChanged: (value) {
                    setState(() {
                      attempts = value;
                    });
                  },
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter a valid number";
                    }

                    final val = int.parse(value);

                    if (val < 3 || val > 20) {
                      return "Value must be within 3 - 20";
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: setupLocks,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.save_outlined),
                    SizedBox(
                      width: 8,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text("Save Settings"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
