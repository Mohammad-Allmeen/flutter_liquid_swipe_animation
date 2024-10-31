import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePageMain extends StatefulWidget {
  const HomePageMain({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePageMain> {
  final LiquidController liquidController = LiquidController();

  final pages = [
    SizedBox(
      height: double.infinity,
      child: CachedNetworkImage(
        imageUrl:
            'https://images.pexels.com/photos/5004002/pexels-photo-5004002.jpeg?auto=compress&cs=tinysrgb&w=1200',
        fit: BoxFit.cover,
        placeholder: (context, url) =>
            const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) =>
            const Center(child: Icon(Icons.error)),
      ),
    ),
    SizedBox(
      height: double.infinity,
      child: CachedNetworkImage(
        imageUrl:
            'https://images.pexels.com/photos/2406731/pexels-photo-2406731.jpeg?auto=compress&cs=tinysrgb&w=1200',
        fit: BoxFit.cover,
        placeholder: (context, url) =>
            const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) =>
            const Center(child: Icon(Icons.error)),
      ),
    ),
    SizedBox(
      height: double.infinity,
      child: CachedNetworkImage(
        imageUrl:
            'https://images.pexels.com/photos/23557054/pexels-photo-23557054/free-photo-of-dome-of-the-rock-in-old-city-of-jerusalem.jpeg?auto=compress&cs=tinysrgb&w=1200',
        fit: BoxFit.cover,
        placeholder: (context, url) =>
            const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) =>
            const Center(child: Icon(Icons.error)),
      ),
    ),
    SizedBox(
      height: double.infinity,
      child: CachedNetworkImage(
        imageUrl:
            'https://images.pexels.com/photos/3624566/pexels-photo-3624566.jpeg?auto=compress&cs=tinysrgb&w=1200',
        fit: BoxFit.cover,
        placeholder: (context, url) =>
            const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) =>
            const Center(child: Icon(Icons.error)),
      ),
    ),
    SizedBox(
      height: double.infinity,
      child: CachedNetworkImage(imageUrl:
      'https://images.pexels.com/photos/11118835/pexels-photo-11118835.jpeg?auto=compress&cs=tinysrgb&w=1200',
      fit: BoxFit.cover,
        placeholder: (context, url)=> const Center(child: CircularProgressIndicator(),),
        errorWidget: (context, url,error) => const Center(child: Icon(Icons.error),),
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          LiquidSwipe(
            pages: pages,
            waveType: WaveType.liquidReveal,
            //enableSideReveal: true,
            slideIconWidget: const Icon(Icons.arrow_back_ios, color: Colors.white),
            positionSlideIcon: 0.9,
            onPageChangeCallback: (page) {
              print(page);
              setState(() {

              });
            },
            liquidController: liquidController,
          ),
          Positioned(
            bottom: 20,
            child: AnimatedSmoothIndicator(
              activeIndex: liquidController.currentPage,
              count: pages.length,
              effect: ExpandingDotsEffect(
                dotHeight: 10,
                dotWidth: 10,
                activeDotColor: Colors.white,
                dotColor: Colors.grey.shade400,
              ),
              onDotClicked: (index) {
                liquidController.animateToPage(page: index);
              },
            ),
          ),
        ],
      ),

    );
  }
}
