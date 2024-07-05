import 'package:flutter/material.dart';
import 'package:responsive_demo/adaptive/adaptive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AdaptiveConfig? _adaptiveConfig;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Adaptive Layout"),
          backgroundColor: Colors.blue.shade50),
      body: AdaptiveLayout(builder: (context, config) {
        _adaptiveConfig = config;
        final screenMode = config.screenMode;
        switch (screenMode) {
          case ScreenMode.small:
            return _mainContent();
          case ScreenMode.medium:
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _sideNavigationRail(),
                Expanded(child: _mainContent()),
              ],
            );
          case ScreenMode.large:
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _sideNavigation(),
                VerticalDivider(color: Colors.grey.shade100, width: 8),
                Expanded(child: _mainContent()),
              ],
            );
        }
      }),
      bottomNavigationBar: AdaptiveLayout(builder: (context, config) {
        return Visibility(
          visible: config.screenMode == ScreenMode.small,
          child: _bottomNavigation(),
        );
      }),
    );
  }

  _sideNavigationRail() {
    return NavigationRail(
      indicatorShape:
          const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      indicatorColor: Colors.white12,
      destinations: const [
        NavigationRailDestination(
          icon: Icon(Icons.home_rounded),
          selectedIcon: Icon(Icons.home_rounded),
          label: Text('Beranda'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.shopping_bag_rounded),
          selectedIcon: Icon(Icons.shopping_bag_rounded),
          label: Text('Transaksi'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.wallet_rounded),
          selectedIcon: Icon(Icons.wallet_rounded),
          label: Text('Dompet'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.person_rounded),
          selectedIcon: Icon(Icons.person_rounded),
          label: Text('Profil'),
        ),
      ],
      selectedIndex: 0,
      onDestinationSelected: (index) {},
      selectedIconTheme: const IconThemeData(color: Colors.white),
      unselectedIconTheme: const IconThemeData(color: Colors.white70),
      elevation: 2,
      useIndicator: true,
      backgroundColor: Colors.black54,
      labelType: NavigationRailLabelType.none,
    );
  }

  _bottomNavigation() {
    return BottomNavigationBar(
      showSelectedLabels: true,
      showUnselectedLabels: true,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded, color: Colors.white60),
          activeIcon: Icon(Icons.home_rounded, color: Colors.white),
          label: "Beranda",
          backgroundColor: Colors.black54,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag_rounded, color: Colors.white60),
          activeIcon: Icon(Icons.shopping_bag_rounded, color: Colors.white),
          label: "Transaksi",
          backgroundColor: Colors.black54,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.wallet_rounded, color: Colors.white60),
          activeIcon: Icon(Icons.wallet_rounded, color: Colors.white),
          label: "Dompet",
          backgroundColor: Colors.black54,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_rounded, color: Colors.white60),
          activeIcon: Icon(Icons.person_rounded, color: Colors.white),
          label: "Profil",
          backgroundColor: Colors.black54,
        )
      ],
      currentIndex: 0,
      onTap: (value) {},
    );
  }

  _sideNavigation() {
    return SizedBox(
      width: widthOfSection * 0.75,
      height:
          _adaptiveConfig?.screenHeight ?? MediaQuery.sizeOf(context).height,
      child: ListView(
        children: [
          Container(
            width: double.maxFinite,
            height: 156.0,
            color: Colors.black54,
            child: const Center(
              child: Text(
                "Brand",
                style: TextStyle(color: Colors.white70),
              ),
            ),
          ),
          const SizedBox(width: 8, height: 8),
          const ListTile(
            tileColor: Colors.black54,
            title: Text(
              "Beranda",
              style: TextStyle(color: Colors.white60),
            ),
            leading: Icon(
              Icons.home_rounded,
              color: Colors.white60,
            ),
          ),
          _divider,
          const ListTile(
            tileColor: Colors.black54,
            title: Text(
              "Transaksi",
              style: TextStyle(color: Colors.white60),
            ),
            leading: Icon(
              Icons.shopping_bag_rounded,
              color: Colors.white60,
            ),
          ),
          _divider,
          const ListTile(
            tileColor: Colors.black54,
            title: Text(
              "Dompet",
              style: TextStyle(color: Colors.white60),
            ),
            leading: Icon(
              Icons.wallet_rounded,
              color: Colors.white60,
            ),
          ),
          _divider,
          const ListTile(
            tileColor: Colors.black54,
            title: Text(
              "Profil",
              style: TextStyle(color: Colors.white60),
            ),
            leading: Icon(
              Icons.person_rounded,
              color: Colors.white60,
            ),
          ),
        ],
      ),
    );
  }

  _mainContent() {
    return SizedBox(
      width: _adaptiveConfig?.screenWidth,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ColoredBox(
              color: Colors.red.shade50,
              child: const SizedBox(
                  height: 256.0, child: Center(child: Text("Banner View"))),
            ),
            const SizedBox(width: 8, height: 8),
            _overView(),
          ],
        ),
      ),
    );
  }

  Widget get _divider => const SizedBox(height: 3, width: 3);

  _overView() {
    final crossAxisCount = _adaptiveConfig?.crossAxisCount(180).toInt() ?? 3;
    final delegate = SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: crossAxisCount,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      childAspectRatio: 1,
    );
    return GridView.builder(
      gridDelegate: delegate,
      itemBuilder: (_, i) {
        return Container(
          color: Colors.red.shade100,
        );
      },
      itemCount: 8,
      shrinkWrap: true,
      primary: false,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
