import 'package:flutter/material.dart';
import 'package:gosecure/Dashboard/DashWidgets/OtherFeatures/CameraDetection.dart';
import 'package:gosecure/Dashboard/DashWidgets/OtherFeatures/Complaint.dart';
import 'package:gosecure/Dashboard/DashWidgets/OtherFeatures/FakeCall.dart';
import 'package:gosecure/Dashboard/DashWidgets/OtherFeatures/SelfDefence.dart';

class OtherFeature extends StatelessWidget {
  const OtherFeature({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 180,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          FakeCall(
            key: UniqueKey(),
          ),
          Complaint(
            key: UniqueKey(),
          ),
          CameraDetection(
            key: UniqueKey(),
          ),
          Defence(
            key: UniqueKey(),
          )
        ],
      ),
    );
  }
}
