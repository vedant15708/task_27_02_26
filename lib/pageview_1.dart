import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageView1 extends StatefulWidget {
  const PageView1({super.key});

  @override
  State<PageView1> createState() => _PageView1State();
}

class _PageView1State extends State<PageView1> {
  final PageController _controller = PageController();
  final ValueNotifier<int> currentPage = ValueNotifier(0);

  final List<Widget> pages = [
    PageLayoutOne(),
    PageLayoutTwo(),
    PageLayoutThree(),
  ];

  @override
  void dispose() {
    _controller.dispose();
    currentPage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              onPageChanged: (index) => currentPage.value = index,
              children: pages,
            ),
          ),
        ],
      ),
    );
  }
}

class PageLayoutOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          BlueBlock(height: 60, color: Colors.blue[800]),
          12.verticalSpace,
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(child: BlueBlock(color: Colors.blue[400])),
                12.horizontalSpace,
                Expanded(child: BlueBlock(color: Colors.blue[400])),
              ],
            ),
          ),
          12.verticalSpace,
          Expanded(
            flex: 3,
            child: BlueBlock(
              color: Colors.blue[600],
              child: Center(
                child: Text(
                  'PageView 1',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
          12.verticalSpace,
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(child: BlueBlock(color: Colors.blue[400])),
                12.horizontalSpace,
                Expanded(child: BlueBlock(color: Colors.blue[400])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PageLayoutTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: .start,
              children: [
                Expanded(child: BlueBlock(height: 60, color: Colors.blue[800])),
                12.horizontalSpace,
                Expanded(child: BlueBlock(height: 60, color: Colors.blue[800])),
              ],
            ),
          ),
          12.verticalSpace,
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(child: BlueBlock(color: Colors.blue[400])),
                12.horizontalSpace,
                Expanded(child: BlueBlock(color: Colors.blue[400])),
              ],
            ),
          ),
          12.verticalSpace,
          Expanded(
            flex: 8,
            child: BlueBlock(
              color: Colors.blue[600],
              child: Center(
                child: Text(
                  'PageView 2',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
          12.verticalSpace,
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(child: BlueBlock(color: Colors.blue[400])),
                12.horizontalSpace,
                Expanded(child: BlueBlock(color: Colors.blue[400])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PageLayoutThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(child: BlueBlock(color: Colors.blue[800])),
                12.horizontalSpace,
                Expanded(child: BlueBlock(color: Colors.blue[800])),
              ],
            ),
          ),
          12.verticalSpace,
          Expanded(
            flex: 9,
            child: BlueBlock(
              color: Colors.blue[600],
              child: Center(
                child: Text(
                  'PageView 3',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
          12.verticalSpace,
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Expanded(child: BlueBlock(color: Colors.blue[400])),
                12.horizontalSpace,
                Expanded(child: BlueBlock(color: Colors.blue[400])),
                12.horizontalSpace,
                Expanded(child: BlueBlock(color: Colors.blue[400])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BlueBlock extends StatelessWidget {
  final double? height;
  final Widget? child;
  final Color? color;

  const BlueBlock({super.key, this.height, this.child, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(color: color),
      child: child,
    );
  }
}
