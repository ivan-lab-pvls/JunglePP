import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD8C6A2),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(60, 24, 60, 90),
            child: Row(
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset('assets/chevron_left.png')),
                const Expanded(
                  child: SizedBox(),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: Image.asset('assets/setting.png'),
                ),
                const Expanded(
                  child: SizedBox(),
                )
              ],
            ),
          ),
          Image.asset('assets/share.png'),
          const SizedBox(
            height: 4,
          ),
          Image.asset('assets/privacy.png'),
          const SizedBox(
            height: 4,
          ),
          Image.asset('assets/terms.png')
        ],
      ),
    );
  }
}
