import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/locator.dart';
import '../../app/router.dart';
import '../../core/services/utility_storage_service.dart';

class OnboardingViewModel extends ReactiveViewModel {

  final NavigationService _navigationService = locator<NavigationService>();
  final StorageService _storageService = locator<StorageService>();

  bool get skipOnBoarding => _storageService.getBool('skipOnBoarding') ?? false;
  PageController pageController = PageController();
  int currentIndex = 0;

  final List<String> headers = [
    "Welcome to Aucarga",
    "Quick & Effortless Repair Requests",
    "Personalized Service Recommendations",
    "Real-time Service Tracking",
    "Secure and Convenient Payments"
  ];

  final List<String> bodies = [
    "Discover a seamless way to find and connect with trusted garages for prompt and reliable vehicle maintenance and service.",
    "Easily submit and manage repair requests with a few taps. Aucarga puts you in control, making vehicle maintenance a breeze.",
    "Receive personalized service recommendations based on your vehicle's make, model, and maintenance history.",
    "Stay informed throughout the repair process with real-time service tracking. Track the progress of your vehicle's maintenance easily.",
    "Easily complete transactions within the app after the service is done, ensuring a seamless and trustworthy payment process for all your vehicle maintenance needs."
  ];

  final List<String> images = [
    "assets/icons/Illustration.png",
    "assets/icons/Illustration.png",
    "assets/icons/Illustration.png",
    "assets/icons/Illustration.png",
    "assets/icons/Illustration.png"
  ];

  void setup(){

  }


  void changePage(int index){
    currentIndex = index;
    notifyListeners();
  }

  void navigateToStartUp(){
    StorageService().addBool('skipOnBoarding', true);

    Future.delayed(const Duration(milliseconds: 210),
            () =>_navigationService.clearStackAndShow(Routes.startupViewRoute));
    notifyListeners();
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [];

}