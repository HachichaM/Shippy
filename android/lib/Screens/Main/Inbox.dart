import 'package:infinityCRM/index.dart';


// First, let's define our data models at the top of the file
class Category {
  final String icon;
  final String name;

  Category({required this.icon, required this.name});
}

class Venue {
  final String name;
  final String type;
  final String location;
  final double rating;
  final int reviews;
  final int price;
  final String image;

  Venue({
    required this.name,
    required this.type,
    required this.location,
    required this.rating,
    required this.reviews,
    required this.price,
    required this.image,
  });
}

class Discover extends StatefulWidget {
  static const String routeName = '/Discover';


  const Discover({super.key});

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  final List<Category> categories = [
    Category(icon: '🏰', name: 'Venues'),
    Category(icon: '🍽️', name: 'Catering'),
    Category(icon: '📸', name: 'Photography'),
    Category(icon: '💐', name: 'Florists'),
    Category(icon: '🎵', name: 'Music'),
    Category(icon: '✨', name: 'Decor'),
  ];

  final List<Venue> venues = [
    Venue(
      name: 'Crystal Palace Estate',
      type: 'Luxury Villa',
      location: 'Beverly Hills',
      rating: 4.97,
      reviews: 128,
      price: 15000,
      image: 'assets/venue1.jpg',
    ),
    Venue(
      name: 'The Grand Ballroom',
      type: 'Historic Venue',
      location: 'Manhattan',
      rating: 4.95,
      reviews: 89,
      price: 12000,
      image: 'assets/venue2.jpg',
    ),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.topRight,
            radius: 1.5,
            colors: [
              Colors.white,
              Color(0xFFF7F7F7),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Search Bar and Filter
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(32),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: TextField(
                          style: GoogleFonts.poppins(),
                          decoration: InputDecoration(
                            hintText: 'Search venues, vendors...',
                            hintStyle: GoogleFonts.poppins(
                              color: Colors.grey[400],
                            ),
                            prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: IconButton(
                        icon: Icon(Icons.tune, color: Colors.grey[700]),
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => const FilterBottomSheet(),
                            backgroundColor: Colors.transparent,
                            isScrollControlled: true,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              // Categories
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 24),
                      child: Column(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 10,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                categories[index].icon,
                                style: const TextStyle(fontSize: 24),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            categories[index].name,
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              // Venues List
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: venues.length,
                  itemBuilder: (context, index) {
                    final venue = venues[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(24),
                                  ),
                                  child: AspectRatio(
                                    aspectRatio: 4/3,
                                    child: Image.network(
                                      'https://picsum.photos/400/300',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 16,
                                  right: 16,
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.favorite_border,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        venue.name,
                                        style: GoogleFonts.playfairDisplay(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            size: 18,
                                            color: Color(0xFFFF5A5F),
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            venue.rating.toString(),
                                            style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    venue.type,
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        size: 16,
                                        color: Colors.grey[600],
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        venue.location,
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    '\$${venue.price}/day',
                                    style: GoogleFonts.playfairDisplay(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
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
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          selectedItemColor: const Color(0xFFFF5A5F),
          unselectedItemColor: Colors.grey[400],
          selectedLabelStyle: GoogleFonts.poppins(fontSize: 12),
          unselectedLabelStyle: GoogleFonts.poppins(fontSize: 12),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline),
              label: 'Messages',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

// Filter Bottom Sheet remains the same, just add 'const' constructor
class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
          children: [
      Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Filters',
            style: GoogleFonts.playfairDisplay(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    ),
    Expanded(
    child: SingleChildScrollView(
    padding: const EdgeInsets.all(16),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    'Price Range',
    style: GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    ),
    ),
    const SizedBox(height: 16),
    RangeSlider(
    values: const RangeValues(5000, 50000),
    min: 0,
    max: 100000,
    activeColor: const Color(0xFFFF5A5F),
    inactiveColor: Colors.grey[200],
    onChanged: (RangeValues values) {},
    ),

    const SizedBox(height: 24),
    Text(
    'Guest Capacity',
    style: GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    ),
    ),
    const SizedBox(height: 16),
    Wrap(
    spacing: 8,
    children: [
    '50-100',
    '100-200',
    '200-500',
    '500+',
    ].map((capacity) => FilterChip(
    label: Text(capacity),
    selected: false,
    onSelected: (bool selected) {},
    )).toList(),
    ),

    const SizedBox(height: 24),
    Text(
    'Venue Type',
    style: GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    ),
    ),
    const SizedBox(height: 16),
    Wrap(
    spacing: 8,
    children: [
    'Hotel',
    'Garden',
    'Beach',
    'Historic',
    'Modern',
    'Rustic',
    ].map((type) => FilterChip(
    label: Text(type),
    selected: false,
    onSelected: (bool selected) {},
    )).toList(),
    ),
    ],
    ),
    ),
    ),
    Padding(
    padding: const EdgeInsets.all(16),
    child: ElevatedButton(
    onPressed: () => Navigator.pop(context),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFFF5A5F),
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        'Show Results',
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
    ),
          ],
      ),
    );
  }
}