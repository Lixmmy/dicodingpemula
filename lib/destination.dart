class Destination {
  String name;
  String description;
  String imageUrl;
  bool isLoved;
  String location;
  String rating;

  Destination({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.isLoved,
    required this.location,
    required this.rating,
  });
}

List<Destination> destinations = [
  Destination(
    name: 'Blue Lagoon',
    description:
        'The Blue Lagoon is a geothermal spa located in a lava field in Grindavík on the Reykjanes Peninsula, southwestern Iceland. The spa is known for its milky-blue waters, which are rich in minerals like silica and sulfur, and are believed to have healing properties for the skin.',
    imageUrl: 'images/blue_lagoon_iceland.jpg',
    isLoved: false,
    location: 'Iceland',
    rating: '4.8',
  ),
  Destination(
    name: 'Galapagos Island',
    description:
        'The Galápagos Islands are an archipelago of volcanic islands located in the Pacific Ocean, about 1,000 kilometers (620 miles) off the coast of Ecuador. The islands are renowned for their unique and diverse wildlife, which played a crucial role in Charles Darwin\'s theory of evolution by natural selection.',
    imageUrl: 'images/galapagos_island_ecuador.jpg',
    isLoved: false,
    location: 'Ecuador',
    rating: '4.7',
  ),
  Destination(
    name: 'Pyramids of Giza',
    description:
        'The Pyramids of Giza are a group of ancient pyramid structures located on the Giza Plateau, near Cairo, Egypt. They were built during the Fourth Dynasty of the Old Kingdom of Egypt, around 2580 to 2560 BC, and are among the most iconic and enduring symbols of ancient Egyptian civilization.',
    imageUrl: 'images/pyramids_of_giza_egypt.jpg',
    isLoved: false,
    location: 'Egypt',
    rating: '4.6',
  ),
  Destination(
    name: 'Taj Mahal',
    description:
        'The Taj Mahal is an iconic mausoleum located in Agra, India. It was commissioned by the Mughal emperor Shah Jahan in 1632 as a memorial for his beloved wife Mumtaz Mahal, who passed away during childbirth. The Taj Mahal is renowned for its stunning architecture, intricate craftsmanship, and its status as a UNESCO World Heritage Site.',
    imageUrl: 'images/taj_mahal_india.jpg',
    isLoved: false,
    location: 'India',
    rating: '4.5',
  ),
  Destination(
    name: 'The Great Wall of China',
    description:
        'The Great Wall of China is a series of fortifications that stretches across northern China, built to protect against invasions and raids from nomadic tribes. The wall is one of the most iconic symbols of China\'s rich history and culture, and it is recognized as a UNESCO World Heritage Site.',
    imageUrl: 'images/the_great_wall_of_china.jpg',
    isLoved: false,
    location: 'China',
    rating: '4.4',
  ),
];
