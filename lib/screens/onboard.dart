import 'package:flutter/material.dart';
import 'package:rs_onboard/components/sidebar_clipper.dart';
import 'package:rs_onboard/components/tracker_box.dart';
import 'package:rs_onboard/constant/data.dart';
import 'package:rs_onboard/constant/style.dart';
import 'package:rs_onboard/screens/home.dart';
import 'package:rs_onboard/utils/route.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
                right: 75,
                left: 10,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        onPressed: () {
                          CustomRoute()
                              .pushRemove(context: context, page: const Home());
                        },
                        child: Text('Skip',
                            style: CustomStyle.headingTextStyle
                                .copyWith(color: Colors.black, fontSize: 15.0)),
                      ),
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image.asset(
                            onBoardData[currentIndex].imageUrl.toString(),
                            height: 400.0,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(onBoardData[currentIndex].title.toString(),
                              style: CustomStyle.headingTextStyle
                                  .copyWith(fontWeight: FontWeight.bold)),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            onBoardData[currentIndex].subtitle.toString(),
                            style: CustomStyle.subHeadingTextStyle.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.0,
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            children: [
                              TrackerBox(
                                  isFilled: currentIndex == 0 ? true : false),
                              const SizedBox(
                                width: 5.0,
                              ),
                              TrackerBox(
                                  isFilled: currentIndex == 1 ? true : false),
                              const SizedBox(
                                width: 5.0,
                              ),
                              TrackerBox(
                                  isFilled: currentIndex == 2 ? true : false),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                )),
            Positioned(
              width: 90,
              top: 0,
              bottom: 0,
              right: 0,
              child: ClipPath(
                clipper: SidebarClipper(
                  510 - 40,
                  510 + 80,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: onBoardData[currentIndex].color,
                  ),
                ),
              ),
            ),
            Positioned(
                right: 15,
                bottom: 195,
                child: Column(
                  children: [
                    FloatingActionButton(
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(100)),
                      backgroundColor: Colors.transparent,
                      onPressed: () {
                        currentIndex == onBoardData.length - 1
                            ? CustomRoute().pushRemove(
                                context: context, page: const Home())
                            : null;
                        setState(() {
                          currentIndex != onBoardData.length - 1
                              ? currentIndex++
                              : null;
                        });
                      },
                      child: const RotatedBox(
                        quarterTurns: 2,
                        child: Icon(Icons.arrow_back_ios_new),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
