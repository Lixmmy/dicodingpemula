import 'package:dicodingpemula/destination.dart';
import 'package:dicodingpemula/detail_destination.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final String username =
        ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return HomeMobilePage(username: username);
          } else {
            return DesktopHomeScreen(username: username);
          }
        },
      ),
    );
  }
}

class HomeMobilePage extends StatefulWidget {
  final String username;
  const HomeMobilePage({super.key, required this.username});

  @override
  State<HomeMobilePage> createState() => _HomeMobilePageState();
}

class _HomeMobilePageState extends State<HomeMobilePage> {
  late List<bool> _isLovedList;

  @override
  void initState() {
    super.initState();
    _isLovedList = List<bool>.filled(20, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF64B5F6), Color(0xFFE3F2FD)],
            stops: [0.07, 0.5],
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: Icon(
                Icons.account_circle,
                size: 50,
                color: Colors.white,
              ),
              title: widget.username.isNotEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi, ${widget.username}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Let\'s Travel Now!',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi, Guest!',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Let\'s Travel Now!',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.notifications, color: Colors.white),
                ),
                IconButton(
                  icon: const Icon(Icons.logout, color: Colors.white),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/login',
                      (route) => false,
                    );
                  },
                ),
              ],
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 350,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          DetailDestination.routeName,
                          arguments: destinations[index],
                        );
                      },
                      child: Container(
                        width: 250,
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(destinations[index].imageUrl),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Spacer(),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        destinations[index].name,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        destinations[index].location,
                                        style: const TextStyle(
                                          color: Colors.white70,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              bottom: 16,
                              right: 16,
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.favorite_outline_outlined,
                                  ),
                                  color: _isLovedList[index]
                                      ? Colors.red
                                      : Colors.white,
                                  onPressed: () {
                                    setState(() {
                                      _isLovedList[index] =
                                          !_isLovedList[index];
                                    });
                                    final snackBar = SnackBar(
                                      content: Text(
                                        _isLovedList[index]
                                            ? 'Added to favorites'
                                            : 'Removed from favorites',
                                      ),
                                      duration: const Duration(seconds: 1),
                                    );
                                    ScaffoldMessenger.of(
                                      context,
                                    ).showSnackBar(snackBar);
                                  },
                                ),
                              ),
                            ),
                            Positioned(
                              top: 16,
                              right: 16,
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.white70,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                      size: 16,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      destinations[index].rating,
                                      style: const TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: destinations.length,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Popular Destinations',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SliverList.builder(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // Handle card tap if needed
                    Navigator.pushNamed(
                      context,
                      DetailDestination.routeName,
                      arguments: destinations[index],
                    );
                  },
                  child: Container(
                    height: 100,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                          child: Image.asset(
                            destinations[index].imageUrl,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              destinations[index].name,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              destinations[index].location,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: destinations.length,
            ),
          ],
        ),
      ),
    );
  }
}

class DesktopHomeScreen extends StatefulWidget {
  final String username;
  const DesktopHomeScreen({super.key, required this.username});

  @override
  State<DesktopHomeScreen> createState() => _DesktopHomeScreenState();
}

class _DesktopHomeScreenState extends State<DesktopHomeScreen> {
  late List<bool> _isLovedList;

  @override
  void initState() {
    super.initState();
    _isLovedList = List<bool>.filled(20, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF64B5F6), Color(0xFFE3F2FD)],
            stops: [0.07, 0.5],
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: Icon(
                Icons.account_circle,
                size: 50,
                color: Colors.white,
              ),
              title: widget.username.isNotEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi, ${widget.username}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Let\'s Travel Now!',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi, Guest!',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Let\'s Travel Now!',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.notifications, color: Colors.white),
                ),
                IconButton(
                  icon: const Icon(Icons.logout, color: Colors.white),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/login',
                      (route) => false,
                    );
                  },
                ),
              ],
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 350,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          DetailDestination.routeName,
                          arguments: destinations[index],
                        );
                      },
                      child: Container(
                        width: 250,
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(destinations[index].imageUrl),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Spacer(),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        destinations[index].name,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        destinations[index].location,
                                        style: const TextStyle(
                                          color: Colors.white70,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              bottom: 16,
                              right: 16,
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.favorite_outline_outlined,
                                  ),
                                  color: _isLovedList[index]
                                      ? Colors.red
                                      : Colors.white,
                                  onPressed: () {
                                    setState(() {
                                      _isLovedList[index] =
                                          !_isLovedList[index];
                                    });
                                    final snackBar = SnackBar(
                                      content: Text(
                                        _isLovedList[index]
                                            ? 'Added to favorites'
                                            : 'Removed from favorites',
                                      ),
                                      duration: const Duration(seconds: 1),
                                    );
                                    ScaffoldMessenger.of(
                                      context,
                                    ).showSnackBar(snackBar);
                                  },
                                ),
                              ),
                            ),
                            Positioned(
                              top: 16,
                              right: 16,
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.white70,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                      size: 16,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      destinations[index].rating,
                                      style: const TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: destinations.length,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Popular Destinations',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SliverGrid.builder(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // Handle card tap if needed
                    Navigator.pushNamed(
                      context,
                      DetailDestination.routeName,
                      arguments: destinations[index],
                    );
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height > 600
                        ? 300
                        : 100,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      image: destinations[index].imageUrl.isNotEmpty
                          ? DecorationImage(
                              image: AssetImage(destinations[index].imageUrl),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.3),
                                BlendMode.darken,
                              ),
                            )
                          : null,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          destinations[index].name,
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          destinations[index].location,
                          style: TextStyle(fontSize: 20, color: Colors.white60),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: destinations.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).size.width > 1200
                    ? 4
                    : MediaQuery.of(context).size.width > 800
                    ? 3
                    : 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
