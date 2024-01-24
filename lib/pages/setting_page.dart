import 'package:flutter/material.dart';
import 'package:flutter_dynamic_icon/flutter_dynamic_icon.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String? iconName;
  @override
  void initState() {
    super.initState();
    _pc();
  }

  void _pc() async {
    if (await FlutterDynamicIcon.supportsAlternateIcons) {
      final name = await FlutterDynamicIcon.getAlternateIconName();
      setState(() {
        iconName = name ?? Icon.values.first.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD8C6A2),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
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
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Vibro'),
                            Switch(
                              value: true,
                              onChanged: (value) {},
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('App icon'),
                            const SizedBox(height: 8),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: Icon.values
                                  .map(
                                    (e) => GestureDetector(
                                      onTap: () async {
                                        try {
                                          if (await FlutterDynamicIcon
                                              .supportsAlternateIcons) {
                                            await FlutterDynamicIcon
                                                .setAlternateIconName(e.name);
                                            setState(() {
                                              iconName = e.name;
                                            });
                                          }
                                        } catch (_) {}
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          color: iconName == e.name
                                              ? const Color(0xFF3FA60D)
                                              : null,
                                        ),
                                        padding: const EdgeInsets.all(4),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          child: Image.asset(
                                            e.asset,
                                            width: 50,
                                            height: 50,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Spacer(flex: 2),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum Icon {
  iconDefault('assets/icons/icon_default.png', 'icon_default'),
  icon1('assets/icons/icon1.png', 'icon1'),
  icon2('assets/icons/icon2.png', 'icon2'),
  icon3('assets/icons/icon3.png', 'icon3'),
  icon4('assets/icons/icon4.png', 'icon4'),
  icon5('assets/icons/icon5.png', 'icon5');

  const Icon(this.asset, this.name);

  final String asset;
  final String name;
}
