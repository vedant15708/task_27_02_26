import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageView2 extends StatefulWidget {
  const PageView2({super.key});

  @override
  State<PageView2> createState() => _PageView2State();
}

class _PageView2State extends State<PageView2> {
  final PageController _controller = PageController();
  final ValueNotifier<double> _pageNotifier = ValueNotifier(0);

  final List<IconData> icons = [
    Icons.home,
    Icons.thumb_up,
    Icons.image,
    Icons.edit,
  ];

  final List<String> titles = [
    "Welcome",
    "Simple to use",
    "Easy Parallax",
    "Customizable",
  ];

  final List<String> subtitles = [
    "Flutter TransformerPageView, for welcome screen, banner, image catalog and more",
    "Simple api,easy to understand,powerful adn strong",
    "Create parallax by a few lines of code",
    "Highly customizable, the only boundary is our mind. :)",
  ];

  final List<Color> colors = [
    const Color(0xffF67904),
    const Color(0xffD12D2E),
    const Color(0xff7A1EA1),
    const Color(0xff1773CF),
  ];

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      _pageNotifier.value = _controller.page ?? 0;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _pageNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _pageNotifier,
      builder: (context, double value, child) {
        int floor = value.floor();
        int ceil = value.ceil();

        Color bgColor;

        if (floor == ceil) {
          bgColor = colors[floor];
        } else {
          bgColor = Color.lerp(colors[floor], colors[ceil], value - floor)!;
        }

        return Scaffold(
          backgroundColor: bgColor,
          body: PageView.builder(
            controller: _controller,
            itemCount: icons.length,
            itemBuilder: (context, index) {
              double difference = (value - index).clamp(-1.0, 1.0);

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 6,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeOut,
                      margin: EdgeInsets.only(
                        left: difference > 0 ? 100.w * difference : 0,
                        right: difference < 0 ? -100.w * difference : 0,
                      ),
                      child: Icon(
                        icons[index],
                        size: 200.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeOut,
                          margin: EdgeInsets.only(
                            left: difference > 0 ? 50.w * difference : 0,
                            right: difference < 0 ? -50.w * difference : 0,
                          ),
                          child: Text(
                            titles[index],
                            style: TextStyle(
                              fontSize: 28.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        20.verticalSpace,
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.easeOut,
                          margin: EdgeInsets.only(
                            left: difference > 0 ? 30.w * difference : 0,
                            right: difference < 0 ? -30.w * difference : 0,
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 40.w),
                          child: Text(
                            subtitles[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
