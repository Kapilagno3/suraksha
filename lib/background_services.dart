import 'dart:async';

import 'package:background_location/background_location.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shake/shake.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:telephony/telephony.dart';
import 'package:another_telephony/telephony.dart';
import 'package:vibration/vibration.dart';
import 'package:workmanager/workmanager.dart';

void onStart() async {
  bool check = true;
  if (check) {
    SharedPreferences.setMockInitialValues({});
    check = false;
  }
  print("bye");
  WidgetsFlutterBinding.ensureInitialized();
  final service = FlutterBackgroundService();
  print("bye1");
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  print("bye2");

  service.onDataReceived.listen((event) async {
    if (event?["action"] == "setAsForeground") {
      service.setForegroundMode(true);

      return;
    }

    if (event?["action"] == "setAsBackground") {
      service.setForegroundMode(true);
    }

    if (event?["action"] == "stopService") {
      service.stopBackgroundService();
    }
  });
  String loc;
  // String longg;

  print("he;");
  await BackgroundLocation.setAndroidNotification(
    title: "Location tracking is running in the background!",
    message: "You can turn it off from settings menu inside the app",
    icon: '@mipmap/ic_logo',
  );

  // This is where the location service gets started.
  await BackgroundLocation.startLocationService(
    distanceFilter: 20,
  );

  // GeolocationStatus geolocationStatus =
  //     await Geolocator().checkGeolocationPermissionStatus();
  // Position userLocation = await Geolocator()
  //     .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

  // print(userLocation);
  Future<void> getLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position userLocation = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    print('User location: ${userLocation.latitude}, ${userLocation.longitude}');
  }

  String screenShake = "Be strong, We are with you!";
  ShakeDetector.autoStart(
      shakeThresholdGravity: 7,
      onPhoneShake: () async {
        print("Test 1");
        if (await Vibration.hasVibrator() ?? false) {
          print("Test 2");
          if (await Vibration.hasCustomVibrationsSupport() ?? false) {
            print("Test 3");
            Vibration.vibrate(duration: 1000);
          } else {
            print("Test 4");
            Vibration.vibrate();
            await Future.delayed(Duration(milliseconds: 500));
            Vibration.vibrate();
          }
          print("Test 5");
        }
        print("Test 6");
        String link = '';
        print("Test 7");
        try {
          screenShake = "SOS alert Sent! Help is on the way.";
          double lat = 1.0;
          double long = 2.0;
          print("$lat ... $long");
          print("Test 9");
          link = "http://maps.google.com/?q=$lat,$long";
          SharedPreferences prefs = await SharedPreferences.getInstance();
          List<String> numbers = prefs.getStringList("numbers") ?? [];
          print(numbers);
          String error;
          try {
            if (numbers.isEmpty) {
              screenShake = "SOS alert Sent! Help is on the way.";
              debugPrint(
                'No Contacts Found!',
              );
              return;
            } else {
              for (int i = 0; i < numbers.length; i++) {
                Telephony.backgroundInstance.sendSms(
                    to: numbers[i], message: "Help Me! Track me here.\n$link");
              }
              prefs.setBool("alerted", true);
              screenShake = "SOS alert Sent! Help is on the way.";
            }
          } on PlatformException catch (e) {
            if (e.code == 'PERMISSION_DENIED') {
              error = 'Please grant permission';
              print('Error due to Denied: $error');
            }
            if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
              error = 'Permission denied- please enable it from app settings';
              print("Error due to not Asking: $error");
            }
          }
          print("Test 10");
          print(link);
        } catch (e) {
          print("Test 11");
          print(e);
        }
      });
  print("Test 12");
  service.setForegroundMode(true);
  Timer.periodic(Duration(seconds: 1), (timer) async {
    if (!(await service.isServiceRunning())) timer.cancel();

    service.setNotificationInfo(
      title: "Safe Shake activated!",
      content: screenShake,
    );

    service.sendData(
      {"current_date": DateTime.now().toIso8601String()},
    );
  });
}

void callbackDispatcher() {
  print("hello");
  Workmanager().executeTask((task, inputData) async {
    String contact = inputData?['contact'];
    final prefs = await SharedPreferences.getInstance();
    print(contact);
    List<String>? location = prefs.getStringList("location");
    String link = "http://maps.google.com/?q=${location?[0]},${location?[1]}";
    print(location);
    print(link);
    Telephony.backgroundInstance
        .sendSms(to: contact, message: "I am on my way! Track me here.\n$link");
    return true;
  });
}
