import 'package:flutter/material.dart';
import 'package:my_website/responsive_widgets/drawer_widget.dart';
import 'package:my_website/screens/landing_page.dart';
import 'package:my_website/screens/second_page.dart';
import 'package:my_website/services/responsive/responsive_device.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: ResponsiveDevice.isMobile(context)
          ? AppBar(
              backgroundColor: Theme.of(context).backgroundColor,
              elevation: 0,
              iconTheme: Theme.of(context).iconTheme,
            )
          : null,
      drawer: ResponsiveDevice.isMobile(context) ? const DrawerWidget() : null,
      body: ColoredBox(
        color: Colors.white,
        child: Column(
          children: const [
            ResponsiveDevice(
              desktopUI: SecondPage(),
              mobileUi: LandingPage(),
            ),
          ],
        ),
      ),
    );
  }
}
