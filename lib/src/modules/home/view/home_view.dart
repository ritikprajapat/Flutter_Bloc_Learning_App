import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:learning_app/src/app/app.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Text(
          'Hello Ritik',
          style: AppStyles.tsBlackSemiBold18,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.person),
            ),
          ),
        ],
      ),
      drawer: Drawer(),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: CommonTextField(
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Search',
                      ),
                    ),
                    SizedBox(width: 12),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.tune_rounded,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 200,
                  child: PageView(
                    onPageChanged: (value) => context.read<HomeBloc>().add(CardDots(cardIndex: value)),
                    children: CardImages,
                  ),
                ),
                DotsIndicator(
                  dotsCount: CardImages.length,
                  position: state.cardIndex,
                  decorator: DotsDecorator(
                    size: const Size.square(9.0),
                    activeSize: const Size(18.0, 9.0),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Choose your course'),
                    TextButton(onPressed: () {}, child: Text('See all')),
                  ],
                ),
                Container(),
              ],
            ),
          );
        },
      ),
    );
  }

  final List<Image> CardImages = [
    Image.asset('assets/icons/Art.png'),
    Image.asset(
      'assets/icons/Image(1).png',
      fit: BoxFit.fill,
    ),
    Image.asset(
      'assets/icons/Image(2).png',
      fit: BoxFit.fill,
    ),
    Image.asset(
      'assets/icons/image(3).png',
      fit: BoxFit.fill,
    ),
    Image.asset(
      'assets/icons/image(4).png',
      fit: BoxFit.fill,
    ),
  ];
}
