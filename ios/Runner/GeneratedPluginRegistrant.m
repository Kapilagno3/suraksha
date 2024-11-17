//
//  Generated file. Do not edit.
//

// clang-format off

#import "GeneratedPluginRegistrant.h"

#if __has_include(<alan_voice/AlanVoicePlugin.h>)
#import <alan_voice/AlanVoicePlugin.h>
#else
@import alan_voice;
#endif

#if __has_include(<another_telephony/TelephonyPlugin.h>)
#import <another_telephony/TelephonyPlugin.h>
#else
@import another_telephony;
#endif

#if __has_include(<audio_streamer/SwiftAudioStreamerPlugin.h>)
#import <audio_streamer/SwiftAudioStreamerPlugin.h>
#else
@import audio_streamer;
#endif

#if __has_include(<audioplayers_darwin/AudioplayersDarwinPlugin.h>)
#import <audioplayers_darwin/AudioplayersDarwinPlugin.h>
#else
@import audioplayers_darwin;
#endif

#if __has_include(<background_location/BackgroundLocationPlugin.h>)
#import <background_location/BackgroundLocationPlugin.h>
#else
@import background_location;
#endif

#if __has_include(<battery_plus/FLTBatteryPlusPlugin.h>)
#import <battery_plus/FLTBatteryPlusPlugin.h>
#else
@import battery_plus;
#endif

#if __has_include(<contacts_service/ContactsServicePlugin.h>)
#import <contacts_service/ContactsServicePlugin.h>
#else
@import contacts_service;
#endif

#if __has_include(<flutter_background_service/FlutterBackgroundServicePlugin.h>)
#import <flutter_background_service/FlutterBackgroundServicePlugin.h>
#else
@import flutter_background_service;
#endif

#if __has_include(<flutter_inappwebview_ios/InAppWebViewFlutterPlugin.h>)
#import <flutter_inappwebview_ios/InAppWebViewFlutterPlugin.h>
#else
@import flutter_inappwebview_ios;
#endif

#if __has_include(<flutter_incoming_call/FlutterIncomingCallPlugin.h>)
#import <flutter_incoming_call/FlutterIncomingCallPlugin.h>
#else
@import flutter_incoming_call;
#endif

#if __has_include(<flutter_phone_direct_caller/FlutterPhoneDirectCallerPlugin.h>)
#import <flutter_phone_direct_caller/FlutterPhoneDirectCallerPlugin.h>
#else
@import flutter_phone_direct_caller;
#endif

#if __has_include(<flutter_ringtone_player/FlutterRingtonePlayerPlugin.h>)
#import <flutter_ringtone_player/FlutterRingtonePlayerPlugin.h>
#else
@import flutter_ringtone_player;
#endif

#if __has_include(<fluttertoast/FluttertoastPlugin.h>)
#import <fluttertoast/FluttertoastPlugin.h>
#else
@import fluttertoast;
#endif

#if __has_include(<geocoding_ios/GeocodingPlugin.h>)
#import <geocoding_ios/GeocodingPlugin.h>
#else
@import geocoding_ios;
#endif

#if __has_include(<geolocator_apple/GeolocatorPlugin.h>)
#import <geolocator_apple/GeolocatorPlugin.h>
#else
@import geolocator_apple;
#endif

#if __has_include(<location/LocationPlugin.h>)
#import <location/LocationPlugin.h>
#else
@import location;
#endif

#if __has_include(<motion_sensors/MotionSensorsPlugin.h>)
#import <motion_sensors/MotionSensorsPlugin.h>
#else
@import motion_sensors;
#endif

#if __has_include(<package_info/FLTPackageInfoPlugin.h>)
#import <package_info/FLTPackageInfoPlugin.h>
#else
@import package_info;
#endif

#if __has_include(<path_provider_foundation/PathProviderPlugin.h>)
#import <path_provider_foundation/PathProviderPlugin.h>
#else
@import path_provider_foundation;
#endif

#if __has_include(<permission_handler_apple/PermissionHandlerPlugin.h>)
#import <permission_handler_apple/PermissionHandlerPlugin.h>
#else
@import permission_handler_apple;
#endif

#if __has_include(<sensors/FLTSensorsPlugin.h>)
#import <sensors/FLTSensorsPlugin.h>
#else
@import sensors;
#endif

#if __has_include(<shared_preferences_foundation/SharedPreferencesPlugin.h>)
#import <shared_preferences_foundation/SharedPreferencesPlugin.h>
#else
@import shared_preferences_foundation;
#endif

#if __has_include(<sms_advanced/UssdAdvancedPlugin.h>)
#import <sms_advanced/UssdAdvancedPlugin.h>
#else
@import sms_advanced;
#endif

#if __has_include(<url_launcher_ios/URLLauncherPlugin.h>)
#import <url_launcher_ios/URLLauncherPlugin.h>
#else
@import url_launcher_ios;
#endif

#if __has_include(<vibration/VibrationPlugin.h>)
#import <vibration/VibrationPlugin.h>
#else
@import vibration;
#endif

#if __has_include(<wakelock/WakelockPlugin.h>)
#import <wakelock/WakelockPlugin.h>
#else
@import wakelock;
#endif

#if __has_include(<workmanager/WorkmanagerPlugin.h>)
#import <workmanager/WorkmanagerPlugin.h>
#else
@import workmanager;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [AlanVoicePlugin registerWithRegistrar:[registry registrarForPlugin:@"AlanVoicePlugin"]];
  [TelephonyPlugin registerWithRegistrar:[registry registrarForPlugin:@"TelephonyPlugin"]];
  [SwiftAudioStreamerPlugin registerWithRegistrar:[registry registrarForPlugin:@"SwiftAudioStreamerPlugin"]];
  [AudioplayersDarwinPlugin registerWithRegistrar:[registry registrarForPlugin:@"AudioplayersDarwinPlugin"]];
  [BackgroundLocationPlugin registerWithRegistrar:[registry registrarForPlugin:@"BackgroundLocationPlugin"]];
  [FLTBatteryPlusPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTBatteryPlusPlugin"]];
  [ContactsServicePlugin registerWithRegistrar:[registry registrarForPlugin:@"ContactsServicePlugin"]];
  [FlutterBackgroundServicePlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterBackgroundServicePlugin"]];
  [InAppWebViewFlutterPlugin registerWithRegistrar:[registry registrarForPlugin:@"InAppWebViewFlutterPlugin"]];
  [FlutterIncomingCallPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterIncomingCallPlugin"]];
  [FlutterPhoneDirectCallerPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterPhoneDirectCallerPlugin"]];
  [FlutterRingtonePlayerPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterRingtonePlayerPlugin"]];
  [FluttertoastPlugin registerWithRegistrar:[registry registrarForPlugin:@"FluttertoastPlugin"]];
  [GeocodingPlugin registerWithRegistrar:[registry registrarForPlugin:@"GeocodingPlugin"]];
  [GeolocatorPlugin registerWithRegistrar:[registry registrarForPlugin:@"GeolocatorPlugin"]];
  [LocationPlugin registerWithRegistrar:[registry registrarForPlugin:@"LocationPlugin"]];
  [MotionSensorsPlugin registerWithRegistrar:[registry registrarForPlugin:@"MotionSensorsPlugin"]];
  [FLTPackageInfoPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTPackageInfoPlugin"]];
  [PathProviderPlugin registerWithRegistrar:[registry registrarForPlugin:@"PathProviderPlugin"]];
  [PermissionHandlerPlugin registerWithRegistrar:[registry registrarForPlugin:@"PermissionHandlerPlugin"]];
  [FLTSensorsPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTSensorsPlugin"]];
  [SharedPreferencesPlugin registerWithRegistrar:[registry registrarForPlugin:@"SharedPreferencesPlugin"]];
  [UssdAdvancedPlugin registerWithRegistrar:[registry registrarForPlugin:@"UssdAdvancedPlugin"]];
  [URLLauncherPlugin registerWithRegistrar:[registry registrarForPlugin:@"URLLauncherPlugin"]];
  [VibrationPlugin registerWithRegistrar:[registry registrarForPlugin:@"VibrationPlugin"]];
  [WakelockPlugin registerWithRegistrar:[registry registrarForPlugin:@"WakelockPlugin"]];
  [WorkmanagerPlugin registerWithRegistrar:[registry registrarForPlugin:@"WorkmanagerPlugin"]];
}

@end
