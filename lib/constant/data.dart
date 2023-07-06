import 'package:flutter/material.dart';
import 'package:rs_onboard/models/onboard_data_model.dart';

List<OnboardDataModel> onBoardData = [
  OnboardDataModel(
    id: 1,
    imageUrl: 'assets/images/img_1.png',
    title: 'Lorem Ipsum',
    subtitle:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ornare, erat ac auctor gravida.',
    color: Colors.blue.shade900,
  ),
  OnboardDataModel(
    id: 2,
    imageUrl: 'assets/images/img_2.png',
    title: 'Lorem Ipsum',
    subtitle:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ornare, erat ac auctor gravida.',
    color: Colors.red.shade900,
  ),
  OnboardDataModel(
    id: 3,
    imageUrl: 'assets/images/img_3.png',
    title: 'Lorem Ipsum',
    subtitle:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ornare, erat ac auctor gravida.',
    color: Colors.black,
  ),
];
