// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Hello !`
  String get Hello {
    return Intl.message(
      'Hello !',
      name: 'Hello',
      desc: '',
      args: [],
    );
  }

  /// `Hello User !`
  String get HelloUser {
    return Intl.message(
      'Hello User !',
      name: 'HelloUser',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back, you have been missed for long Time`
  String get loginmessage {
    return Intl.message(
      'Welcome Back, you have been missed for long Time',
      name: 'loginmessage',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get EmailAddress {
    return Intl.message(
      'Email Address',
      name: 'EmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Password {
    return Intl.message(
      'Password',
      name: 'Password',
      desc: '',
      args: [],
    );
  }

  /// `Remember me`
  String get Rememberme {
    return Intl.message(
      'Remember me',
      name: 'Rememberme',
      desc: '',
      args: [],
    );
  }

  /// `Forget password`
  String get Forgetpassword {
    return Intl.message(
      'Forget password',
      name: 'Forgetpassword',
      desc: '',
      args: [],
    );
  }

  /// `LogIn`
  String get LogIn {
    return Intl.message(
      'LogIn',
      name: 'LogIn',
      desc: '',
      args: [],
    );
  }

  /// `Dont have an account?`
  String get Donthaveanaccount {
    return Intl.message(
      'Dont have an account?',
      name: 'Donthaveanaccount',
      desc: '',
      args: [],
    );
  }

  /// `SignUp`
  String get SignUp {
    return Intl.message(
      'SignUp',
      name: 'SignUp',
      desc: '',
      args: [],
    );
  }

  /// `SignIn`
  String get SignIn {
    return Intl.message(
      'SignIn',
      name: 'SignIn',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get GetStrated {
    return Intl.message(
      'Get Started',
      name: 'GetStrated',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get Skip {
    return Intl.message(
      'Skip',
      name: 'Skip',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get Category {
    return Intl.message(
      'Category',
      name: 'Category',
      desc: '',
      args: [],
    );
  }

  /// `Book Service`
  String get BookService {
    return Intl.message(
      'Book Service',
      name: 'BookService',
      desc: '',
      args: [],
    );
  }

  /// `Step1`
  String get Step1 {
    return Intl.message(
      'Step1',
      name: 'Step1',
      desc: '',
      args: [],
    );
  }

  /// `Step2`
  String get Step2 {
    return Intl.message(
      'Step2',
      name: 'Step2',
      desc: '',
      args: [],
    );
  }

  /// `Enter Detail Information`
  String get EnterDetailInformation {
    return Intl.message(
      'Enter Detail Information',
      name: 'EnterDetailInformation',
      desc: '',
      args: [],
    );
  }

  /// `Date And Time :`
  String get DateAndTime {
    return Intl.message(
      'Date And Time :',
      name: 'DateAndTime',
      desc: '',
      args: [],
    );
  }

  /// `Your Address`
  String get YourAddress {
    return Intl.message(
      'Your Address',
      name: 'YourAddress',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get Next {
    return Intl.message(
      'Next',
      name: 'Next',
      desc: '',
      args: [],
    );
  }

  /// `Introducing Customer Rating`
  String get IntroducingCustomerRating {
    return Intl.message(
      'Introducing Customer Rating',
      name: 'IntroducingCustomerRating',
      desc: '',
      args: [],
    );
  }

  /// `See Your Rating`
  String get SeeYourRating {
    return Intl.message(
      'See Your Rating',
      name: 'SeeYourRating',
      desc: '',
      args: [],
    );
  }

  /// `Houseman User`
  String get HousemanUser {
    return Intl.message(
      'Houseman User',
      name: 'HousemanUser',
      desc: '',
      args: [],
    );
  }

  /// `Welcome To Houseman`
  String get WelcomeToHouseman {
    return Intl.message(
      'Welcome To Houseman',
      name: 'WelcomeToHouseman',
      desc: '',
      args: [],
    );
  }

  /// `Find Your Service`
  String get FindYourService {
    return Intl.message(
      'Find Your Service',
      name: 'FindYourService',
      desc: '',
      args: [],
    );
  }

  /// `Book The Appointment`
  String get BookTheAppointment {
    return Intl.message(
      'Book The Appointment',
      name: 'BookTheAppointment',
      desc: '',
      args: [],
    );
  }

  /// `Payment Gateway`
  String get PaymentGateway {
    return Intl.message(
      'Payment Gateway',
      name: 'PaymentGateway',
      desc: '',
      args: [],
    );
  }

  /// `Or Continue With`
  String get OrContinueWith {
    return Intl.message(
      'Or Continue With',
      name: 'OrContinueWith',
      desc: '',
      args: [],
    );
  }

  /// `Create your account for better Experience`
  String get registermessage {
    return Intl.message(
      'Create your account for better Experience',
      name: 'registermessage',
      desc: '',
      args: [],
    );
  }

  /// ` This mail account is already used , please use  another account`
  String get Thismailaccountisalreadyusedpleaseuseanotheraccount {
    return Intl.message(
      ' This mail account is already used , please use  another account',
      name: 'Thismailaccountisalreadyusedpleaseuseanotheraccount',
      desc: '',
      args: [],
    );
  }

  /// `We send you an Email to reset your password.`
  String get WesendyouanEmailtoresetyourpassword {
    return Intl.message(
      'We send you an Email to reset your password.',
      name: 'WesendyouanEmailtoresetyourpassword',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get FullName {
    return Intl.message(
      'Full Name',
      name: 'FullName',
      desc: '',
      args: [],
    );
  }

  /// `User Name`
  String get UserName {
    return Intl.message(
      'User Name',
      name: 'UserName',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get PhoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'PhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Apartment Cleaning`
  String get ApartmentCleaning {
    return Intl.message(
      'Apartment Cleaning',
      name: 'ApartmentCleaning',
      desc: '',
      args: [],
    );
  }

  /// `phone number is not correct`
  String get phonenumberisnotcorrect {
    return Intl.message(
      'phone number is not correct',
      name: 'phonenumberisnotcorrect',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get Alreadyhaveanaccount {
    return Intl.message(
      'Already have an account?',
      name: 'Alreadyhaveanaccount',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back `
  String get WelcomeBack {
    return Intl.message(
      'Welcome Back ',
      name: 'WelcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Hello {name}`
  String Helloname(Object name) {
    return Intl.message(
      'Hello $name',
      name: 'Helloname',
      desc: '',
      args: [name],
    );
  }

  /// `Home`
  String get Home {
    return Intl.message(
      'Home',
      name: 'Home',
      desc: '',
      args: [],
    );
  }

  /// `Commision Type`
  String get CommisionType {
    return Intl.message(
      'Commision Type',
      name: 'CommisionType',
      desc: '',
      args: [],
    );
  }

  /// `My Commision`
  String get MyCommision {
    return Intl.message(
      'My Commision',
      name: 'MyCommision',
      desc: '',
      args: [],
    );
  }

  /// `Company`
  String get Company {
    return Intl.message(
      'Company',
      name: 'Company',
      desc: '',
      args: [],
    );
  }

  /// `Fixed`
  String get Fixed {
    return Intl.message(
      'Fixed',
      name: 'Fixed',
      desc: '',
      args: [],
    );
  }

  /// `Total Earning`
  String get TotalEarning {
    return Intl.message(
      'Total Earning',
      name: 'TotalEarning',
      desc: '',
      args: [],
    );
  }

  /// `Total Service`
  String get TotalService {
    return Intl.message(
      'Total Service',
      name: 'TotalService',
      desc: '',
      args: [],
    );
  }

  /// `Total Booking`
  String get TotalBooking {
    return Intl.message(
      'Total Booking',
      name: 'TotalBooking',
      desc: '',
      args: [],
    );
  }

  /// `upcoming services`
  String get upcomingservices {
    return Intl.message(
      'upcoming services',
      name: 'upcomingservices',
      desc: '',
      args: [],
    );
  }

  /// `Monthly Revenue USD`
  String get MonthlyRevenueUSD {
    return Intl.message(
      'Monthly Revenue USD',
      name: 'MonthlyRevenueUSD',
      desc: '',
      args: [],
    );
  }

  /// `Jan`
  String get Jan {
    return Intl.message(
      'Jan',
      name: 'Jan',
      desc: '',
      args: [],
    );
  }

  /// `Feb`
  String get Feb {
    return Intl.message(
      'Feb',
      name: 'Feb',
      desc: '',
      args: [],
    );
  }

  /// `Mar`
  String get Mar {
    return Intl.message(
      'Mar',
      name: 'Mar',
      desc: '',
      args: [],
    );
  }

  /// `Apr`
  String get Apr {
    return Intl.message(
      'Apr',
      name: 'Apr',
      desc: '',
      args: [],
    );
  }

  /// `May`
  String get May {
    return Intl.message(
      'May',
      name: 'May',
      desc: '',
      args: [],
    );
  }

  /// `June`
  String get june {
    return Intl.message(
      'June',
      name: 'june',
      desc: '',
      args: [],
    );
  }

  /// `July`
  String get July {
    return Intl.message(
      'July',
      name: 'July',
      desc: '',
      args: [],
    );
  }

  /// `Reviews`
  String get Reviews {
    return Intl.message(
      'Reviews',
      name: 'Reviews',
      desc: '',
      args: [],
    );
  }

  /// `View All`
  String get ViewAll {
    return Intl.message(
      'View All',
      name: 'ViewAll',
      desc: '',
      args: [],
    );
  }

  /// `Provider`
  String get Provider {
    return Intl.message(
      'Provider',
      name: 'Provider',
      desc: '',
      args: [],
    );
  }

  /// `Houseman`
  String get Houseman {
    return Intl.message(
      'Houseman',
      name: 'Houseman',
      desc: '',
      args: [],
    );
  }

  /// `Services`
  String get Services {
    return Intl.message(
      'Services',
      name: 'Services',
      desc: '',
      args: [],
    );
  }

  /// `ServiceList`
  String get ServiceList {
    return Intl.message(
      'ServiceList',
      name: 'ServiceList',
      desc: '',
      args: [],
    );
  }

  /// `Booking List`
  String get BookingList {
    return Intl.message(
      'Booking List',
      name: 'BookingList',
      desc: '',
      args: [],
    );
  }

  /// `Pending`
  String get Pending {
    return Intl.message(
      'Pending',
      name: 'Pending',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'BookingHistory ' key

  /// `Floor Cleaning`
  String get FloorCleaning {
    return Intl.message(
      'Floor Cleaning',
      name: 'FloorCleaning',
      desc: '',
      args: [],
    );
  }

  /// `Accept`
  String get Accept {
    return Intl.message(
      'Accept',
      name: 'Accept',
      desc: '',
      args: [],
    );
  }

  /// `Decline`
  String get Decline {
    return Intl.message(
      'Decline',
      name: 'Decline',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get EditProfile {
    return Intl.message(
      'Edit Profile',
      name: 'EditProfile',
      desc: '',
      args: [],
    );
  }

  /// `Search here...`
  String get Searchhere {
    return Intl.message(
      'Search here...',
      name: 'Searchhere',
      desc: '',
      args: [],
    );
  }

  /// `No users found.`
  String get Nousersfound {
    return Intl.message(
      'No users found.',
      name: 'Nousersfound',
      desc: '',
      args: [],
    );
  }

  /// `Oops, There is an error`
  String get OopsThereisanerror {
    return Intl.message(
      'Oops, There is an error',
      name: 'OopsThereisanerror',
      desc: '',
      args: [],
    );
  }

  /// `Phone number is not correct`
  String get Phonenumberisnotcorrect {
    return Intl.message(
      'Phone number is not correct',
      name: 'Phonenumberisnotcorrect',
      desc: '',
      args: [],
    );
  }

  /// `Password is weak`
  String get Passwordisweak {
    return Intl.message(
      'Password is weak',
      name: 'Passwordisweak',
      desc: '',
      args: [],
    );
  }

  /// `loading`
  String get loading {
    return Intl.message(
      'loading',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `wait Please`
  String get waitPlease {
    return Intl.message(
      'wait Please',
      name: 'waitPlease',
      desc: '',
      args: [],
    );
  }

  /// `No messages available.`
  String get Nomessagesavailable {
    return Intl.message(
      'No messages available.',
      name: 'Nomessagesavailable',
      desc: '',
      args: [],
    );
  }

  /// `House Cleaninng`
  String get HouseCleaninng {
    return Intl.message(
      'House Cleaninng',
      name: 'HouseCleaninng',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Booking`
  String get Booking {
    return Intl.message(
      'Booking',
      name: 'Booking',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get All {
    return Intl.message(
      'All',
      name: 'All',
      desc: '',
      args: [],
    );
  }

  /// `Booking ID`
  String get BookingID {
    return Intl.message(
      'Booking ID',
      name: 'BookingID',
      desc: '',
      args: [],
    );
  }

  /// `Date : {date}`
  String Datee(Object date) {
    return Intl.message(
      'Date : $date',
      name: 'Datee',
      desc: '',
      args: [date],
    );
  }

  /// `Date`
  String get date {
    return Intl.message(
      'Date',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Time : {time}`
  String Timee(Object time) {
    return Intl.message(
      'Time : $time',
      name: 'Timee',
      desc: '',
      args: [time],
    );
  }

  /// `Time`
  String get Time {
    return Intl.message(
      'Time',
      name: 'Time',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get Loction {
    return Intl.message(
      'Location',
      name: 'Loction',
      desc: '',
      args: [],
    );
  }

  /// `About Customer`
  String get AboutCustomer {
    return Intl.message(
      'About Customer',
      name: 'AboutCustomer',
      desc: '',
      args: [],
    );
  }

  /// `About Houseman`
  String get AboutHouseman {
    return Intl.message(
      'About Houseman',
      name: 'AboutHouseman',
      desc: '',
      args: [],
    );
  }

  /// `Payment Details`
  String get PaymentDetails {
    return Intl.message(
      'Payment Details',
      name: 'PaymentDetails',
      desc: '',
      args: [],
    );
  }

  /// `Payment Method`
  String get PaymentMethod {
    return Intl.message(
      'Payment Method',
      name: 'PaymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `amount`
  String get amount {
    return Intl.message(
      'amount',
      name: 'amount',
      desc: '',
      args: [],
    );
  }

  /// `ID`
  String get ID {
    return Intl.message(
      'ID',
      name: 'ID',
      desc: '',
      args: [],
    );
  }

  /// `Method`
  String get Method {
    return Intl.message(
      'Method',
      name: 'Method',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get Status {
    return Intl.message(
      'Status',
      name: 'Status',
      desc: '',
      args: [],
    );
  }

  /// `Service Status`
  String get ServiceStatus {
    return Intl.message(
      'Service Status',
      name: 'ServiceStatus',
      desc: '',
      args: [],
    );
  }

  /// `Cancle Booking`
  String get CancleBooking {
    return Intl.message(
      'Cancle Booking',
      name: 'CancleBooking',
      desc: '',
      args: [],
    );
  }

  /// `Subtotal`
  String get Subtotal {
    return Intl.message(
      'Subtotal',
      name: 'Subtotal',
      desc: '',
      args: [],
    );
  }

  /// `Price Detail`
  String get PriceDetail {
    return Intl.message(
      'Price Detail',
      name: 'PriceDetail',
      desc: '',
      args: [],
    );
  }

  /// `Rate`
  String get Rate {
    return Intl.message(
      'Rate',
      name: 'Rate',
      desc: '',
      args: [],
    );
  }

  /// `Duration :`
  String get Duration {
    return Intl.message(
      'Duration :',
      name: 'Duration',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get Description {
    return Intl.message(
      'Description',
      name: 'Description',
      desc: '',
      args: [],
    );
  }

  /// `Quantity`
  String get Quantity {
    return Intl.message(
      'Quantity',
      name: 'Quantity',
      desc: '',
      args: [],
    );
  }

  /// `Discount`
  String get Discount {
    return Intl.message(
      'Discount',
      name: 'Discount',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get Gallery {
    return Intl.message(
      'Gallery',
      name: 'Gallery',
      desc: '',
      args: [],
    );
  }

  /// `Coupon`
  String get Coupon {
    return Intl.message(
      'Coupon',
      name: 'Coupon',
      desc: '',
      args: [],
    );
  }

  /// `Total Amount`
  String get TotalAmount {
    return Intl.message(
      'Total Amount',
      name: 'TotalAmount',
      desc: '',
      args: [],
    );
  }

  /// `Booking History`
  String get BookingHistory {
    return Intl.message(
      'Booking History',
      name: 'BookingHistory',
      desc: '',
      args: [],
    );
  }

  /// `Rate Houseman`
  String get RateHouseman {
    return Intl.message(
      'Rate Houseman',
      name: 'RateHouseman',
      desc: '',
      args: [],
    );
  }

  /// `Review On Services`
  String get ReviewOnServices {
    return Intl.message(
      'Review On Services',
      name: 'ReviewOnServices',
      desc: '',
      args: [],
    );
  }

  /// `Booking Summary`
  String get BookingSummary {
    return Intl.message(
      'Booking Summary',
      name: 'BookingSummary',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get Notification {
    return Intl.message(
      'Notification',
      name: 'Notification',
      desc: '',
      args: [],
    );
  }

  /// `NoNotificationyet`
  String get NoNotificationyet {
    return Intl.message(
      'NoNotificationyet',
      name: 'NoNotificationyet',
      desc: '',
      args: [],
    );
  }

  /// `min ago {min} `
  String minago(Object min) {
    return Intl.message(
      'min ago $min ',
      name: 'minago',
      desc: '',
      args: [min],
    );
  }

  /// `Service Delivered`
  String get ServiceDelivered {
    return Intl.message(
      'Service Delivered',
      name: 'ServiceDelivered',
      desc: '',
      args: [],
    );
  }

  /// `Years of Experience`
  String get YearsofExperience {
    return Intl.message(
      'Years of Experience',
      name: 'YearsofExperience',
      desc: '',
      args: [],
    );
  }

  /// `App Language`
  String get AppLanguage {
    return Intl.message(
      'App Language',
      name: 'AppLanguage',
      desc: '',
      args: [],
    );
  }

  /// `App Theme`
  String get AppTheme {
    return Intl.message(
      'App Theme',
      name: 'AppTheme',
      desc: '',
      args: [],
    );
  }

  /// `Add Service`
  String get AddService {
    return Intl.message(
      'Add Service',
      name: 'AddService',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get Save {
    return Intl.message(
      'Save',
      name: 'Save',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Booking`
  String get ConfirmBooking {
    return Intl.message(
      'Confirm Booking',
      name: 'ConfirmBooking',
      desc: '',
      args: [],
    );
  }

  /// `Cancle`
  String get Cancle {
    return Intl.message(
      'Cancle',
      name: 'Cancle',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to confirm the booking`
  String get Areyousureyouwanttoconfirmthebooking {
    return Intl.message(
      'Are you sure you want to confirm the booking',
      name: 'Areyousureyouwanttoconfirmthebooking',
      desc: '',
      args: [],
    );
  }

  /// `Description of service`
  String get Descriptionofservice {
    return Intl.message(
      'Description of service',
      name: 'Descriptionofservice',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get Price {
    return Intl.message(
      'Price',
      name: 'Price',
      desc: '',
      args: [],
    );
  }

  /// `Service Name`
  String get ServiceName {
    return Intl.message(
      'Service Name',
      name: 'ServiceName',
      desc: '',
      args: [],
    );
  }

  /// `Houseman Name`
  String get HousemanName {
    return Intl.message(
      'Houseman Name',
      name: 'HousemanName',
      desc: '',
      args: [],
    );
  }

  /// `Add Address`
  String get AddAddress {
    return Intl.message(
      'Add Address',
      name: 'AddAddress',
      desc: '',
      args: [],
    );
  }

  /// `Choose Image Support JPG and PNG  `
  String get ChooseImageSupportJPGPNG {
    return Intl.message(
      'Choose Image Support JPG and PNG  ',
      name: 'ChooseImageSupportJPGPNG',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get ChangePassword {
    return Intl.message(
      'Change Password',
      name: 'ChangePassword',
      desc: '',
      args: [],
    );
  }

  /// `Earning List`
  String get EarningList {
    return Intl.message(
      'Earning List',
      name: 'EarningList',
      desc: '',
      args: [],
    );
  }

  /// `Oh No, Your are leaving`
  String get OhNoYourareleaving {
    return Intl.message(
      'Oh No, Your are leaving',
      name: 'OhNoYourareleaving',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get Logout {
    return Intl.message(
      'Logout',
      name: 'Logout',
      desc: '',
      args: [],
    );
  }

  /// `Taxes`
  String get Taxes {
    return Intl.message(
      'Taxes',
      name: 'Taxes',
      desc: '',
      args: [],
    );
  }

  /// `Tax Name`
  String get TaxName {
    return Intl.message(
      'Tax Name',
      name: 'TaxName',
      desc: '',
      args: [],
    );
  }

  /// `My Tax`
  String get MyTax {
    return Intl.message(
      'My Tax',
      name: 'MyTax',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get Edit {
    return Intl.message(
      'Edit',
      name: 'Edit',
      desc: '',
      args: [],
    );
  }

  /// `Deactivate`
  String get Deactivate {
    return Intl.message(
      'Deactivate',
      name: 'Deactivate',
      desc: '',
      args: [],
    );
  }

  /// `Activate`
  String get Activate {
    return Intl.message(
      'Activate',
      name: 'Activate',
      desc: '',
      args: [],
    );
  }

  /// `Service Address`
  String get ServiceAddress {
    return Intl.message(
      'Service Address',
      name: 'ServiceAddress',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to logout`
  String get Areyousureyouwanttologout {
    return Intl.message(
      'Are you sure you want to logout',
      name: 'Areyousureyouwanttologout',
      desc: '',
      args: [],
    );
  }

  /// `Failed to update profile`
  String get Failedtoupdateprofile {
    return Intl.message(
      'Failed to update profile',
      name: 'Failedtoupdateprofile',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get No {
    return Intl.message(
      'No',
      name: 'No',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get Yes {
    return Intl.message(
      'Yes',
      name: 'Yes',
      desc: '',
      args: [],
    );
  }

  /// `OTP`
  String get OTP {
    return Intl.message(
      'OTP',
      name: 'OTP',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get Verify {
    return Intl.message(
      'Verify',
      name: 'Verify',
      desc: '',
      args: [],
    );
  }

  /// `OTP sent to your phone`
  String get OTPsenttoyourphone {
    return Intl.message(
      'OTP sent to your phone',
      name: 'OTPsenttoyourphone',
      desc: '',
      args: [],
    );
  }

  /// `LOGIN  with phone`
  String get LOGINwithphone {
    return Intl.message(
      'LOGIN  with phone',
      name: 'LOGINwithphone',
      desc: '',
      args: [],
    );
  }

  /// `Chat`
  String get Chat {
    return Intl.message(
      'Chat',
      name: 'Chat',
      desc: '',
      args: [],
    );
  }

  /// `New Chat`
  String get NewChat {
    return Intl.message(
      'New Chat',
      name: 'NewChat',
      desc: '',
      args: [],
    );
  }

  /// `Call`
  String get Call {
    return Intl.message(
      'Call',
      name: 'Call',
      desc: '',
      args: [],
    );
  }

  /// `Light Mode`
  String get LightMode {
    return Intl.message(
      'Light Mode',
      name: 'LightMode',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get DarkMode {
    return Intl.message(
      'Dark Mode',
      name: 'DarkMode',
      desc: '',
      args: [],
    );
  }

  /// `Check App Theme`
  String get CheckAppTheme {
    return Intl.message(
      'Check App Theme',
      name: 'CheckAppTheme',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get Continue {
    return Intl.message(
      'Continue',
      name: 'Continue',
      desc: '',
      args: [],
    );
  }

  /// `Unknown User`
  String get UnknownUser {
    return Intl.message(
      'Unknown User',
      name: 'UnknownUser',
      desc: '',
      args: [],
    );
  }

  /// `Type a message`
  String get Typeamessage {
    return Intl.message(
      'Type a message',
      name: 'Typeamessage',
      desc: '',
      args: [],
    );
  }

  /// `Return to Log in`
  String get ReturntoLogin {
    return Intl.message(
      'Return to Log in',
      name: 'ReturntoLogin',
      desc: '',
      args: [],
    );
  }

  /// `Check Status`
  String get CheckStatus {
    return Intl.message(
      'Check Status',
      name: 'CheckStatus',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get English {
    return Intl.message(
      'English',
      name: 'English',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get Arabic {
    return Intl.message(
      'Arabic',
      name: 'Arabic',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
