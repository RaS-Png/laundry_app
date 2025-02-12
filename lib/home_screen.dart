import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<String> imageList = [
    'assets/images/discount1.png',
    'assets/images/discount1.png',
    'assets/images/discount1.png',
  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    Future.delayed(Duration(seconds: 3), () {
      if (_currentPage < imageList.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      }
      _startAutoScroll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // GREET
              const Text(
                'Good morning, User!',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(221, 154, 154, 154),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Ready For',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Colors.black87,
                ),
              ),
              const Text(
                'Clean Your Clothes?',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),
              // Carousel with rounded corners
              Container(
                height: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20), // Rounded corners
                  child: Stack(
                    children: [
                      PageView.builder(
                        controller: _pageController,
                        onPageChanged: (int page) {
                          setState(() {
                            _currentPage = page;
                          });
                        },
                        itemCount: imageList.length,
                        itemBuilder: (context, index) {
                          return Image.asset(
                            imageList[index],
                            width: double.infinity,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                      // Dots indicator
                      Positioned(
                        bottom: 10,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: imageList.asMap().entries.map((entry) {
                            return Container(
                              width: 8.0,
                              height: 8.0,
                              margin: EdgeInsets.symmetric(horizontal: 4.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _currentPage == entry.key
                                    ? Colors.white
                                    : Colors.white.withOpacity(0.4),
                              ),
                            );
                          }).toList(),
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
