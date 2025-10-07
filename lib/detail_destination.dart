import 'package:dicodingpemula/destination.dart';
import 'package:flutter/material.dart';

class DetailDestination extends StatelessWidget {
  static const routeName = '/detail';
  final Destination destination;
  const DetailDestination({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 720) {
          return DetailDestinationMobile(destination: destination);
        } else {
          return DetailDestinationDesktop(destination: destination);
        }
      },
    );
  }
}

class DetailDestinationMobile extends StatelessWidget {
  final Destination destination;
  const DetailDestinationMobile({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    final otherDestinations = destinations
        .where((d) => d.name != destination.name)
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Image.asset(destination.imageUrl),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.black.withOpacity(0.5),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              transform: Matrix4.translationValues(0.0, -20.0, 0.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      destination.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: Colors.grey,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              destination.location,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.orange,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              destination.rating,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(destination.description, textAlign: TextAlign.justify),
                    const SizedBox(height: 24),
                    const Text(
                      'Another Popular Destinations',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 300,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: otherDestinations.length,
                        itemBuilder: (context, index) {
                          final otherDest = otherDestinations[index];
                          return InkWell(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                context,
                                DetailDestination.routeName,
                                arguments: otherDest,
                              );
                            },
                            child: Container(
                              width: 250,
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                image: otherDest.imageUrl.isNotEmpty
                                    ? DecorationImage(
                                        image: AssetImage(otherDest.imageUrl),
                                        fit: BoxFit.cover,
                                      )
                                    : null,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Stack(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        otherDest.name,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        otherDest.location,
                                        style: const TextStyle(
                                          color: Colors.white70,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
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
                                            otherDest.rating,
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
  }
}

class DetailDestinationDesktop extends StatelessWidget {
  final Destination destination;
  const DetailDestinationDesktop({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    final otherDestinations = destinations
        .where((d) => d.name != destination.name)
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          width: MediaQuery.of(context).size.width * 0.6,
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(destination.imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SafeArea(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.all(24),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                destination.name,
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on,
                                        color: Colors.grey,
                                        size: 16,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        destination.location,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                        size: 16,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        destination.rating,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Text(
                                destination.description,
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Another Popular Destinations',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: otherDestinations.length,
                          itemBuilder: (context, index) {
                            final otherDest = otherDestinations[index];
                            return InkWell(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                  context,
                                  DetailDestination.routeName,
                                  arguments: otherDest,
                                );
                              },
                              child: Container(
                                width: 150,
                                margin: const EdgeInsets.only(right: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.asset(
                                          otherDest.imageUrl,
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      otherDest.name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      otherDest.location,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
