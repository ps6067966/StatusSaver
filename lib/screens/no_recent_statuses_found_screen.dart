import 'package:device_apps/device_apps.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:status_saver/common.dart';
import 'package:status_saver/constants.dart';
import 'package:status_saver/services/launch_app.dart';

class NoRecentStatusesFoundScreen extends StatelessWidget {
  const NoRecentStatusesFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Go and watch some whatsapp statuses"),
        ),
        LaunchApp(
            packageName: whatsappPackageName,
            label: 'Open WhatsApp',
            iconData: FontAwesomeIcons.whatsapp),
        LaunchApp(
            packageName: w4bPackageName,
            label: 'Open WhatsApp Business',
            iconData: FontAwesomeIcons.whatsapp)
      ],
    );
  }
}

class LaunchApp extends StatelessWidget {
  final String packageName;
  final String label;
  final IconData iconData;
  const LaunchApp(
      {super.key,
      required this.packageName,
      required this.label,
      required this.iconData});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DeviceApps.isAppInstalled(packageName),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data!) {
              return TextButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      iconData,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        label,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
                onPressed: () async =>
                    await launchApp(packageName: packageName),
              );
            }
          } // TODO DO NOT append unnecessary widgets in tree
          return const SizedBox();
        });
  }
}
