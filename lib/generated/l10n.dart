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

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to`
  String get onBoardingTitle1 {
    return Intl.message(
      'Welcome to',
      name: 'onBoardingTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Discover a unique shopping experience with FruitHUB. Explore our wide selection of premium fresh fruits and enjoy the best deals and top quality.`
  String get onBoardingSubTitle1 {
    return Intl.message(
      'Discover a unique shopping experience with FruitHUB. Explore our wide selection of premium fresh fruits and enjoy the best deals and top quality.',
      name: 'onBoardingSubTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Search and Shop`
  String get onBoardingTitle2 {
    return Intl.message(
      'Search and Shop',
      name: 'onBoardingTitle2',
      desc: '',
      args: [],
    );
  }

  /// `We offer you the finest carefully selected fruits. Check details, images, and reviews to make sure you pick the perfect fruit.`
  String get onBoardingSubTitle2 {
    return Intl.message(
      'We offer you the finest carefully selected fruits. Check details, images, and reviews to make sure you pick the perfect fruit.',
      name: 'onBoardingSubTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Start Now`
  String get startNow {
    return Intl.message(
      'Start Now',
      name: 'startNow',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account ?`
  String get DontHaveAnAccount {
    return Intl.message(
      'Don\'t have an account ?',
      name: 'DontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Create an Account`
  String get createAccount {
    return Intl.message(
      'Create an Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get or {
    return Intl.message(
      'Or',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Register with Google`
  String get registerWithGoogle {
    return Intl.message(
      'Register with Google',
      name: 'registerWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Register with Facebook`
  String get registerWithFacebook {
    return Intl.message(
      'Register with Facebook',
      name: 'registerWithFacebook',
      desc: '',
      args: [],
    );
  }

  /// `Register with Apple`
  String get registerWithApple {
    return Intl.message(
      'Register with Apple',
      name: 'registerWithApple',
      desc: '',
      args: [],
    );
  }

  /// `New Account`
  String get newAccount {
    return Intl.message(
      'New Account',
      name: 'newAccount',
      desc: '',
      args: [],
    );
  }

  /// `Create New Account`
  String get createNewAccount {
    return Intl.message(
      'Create New Account',
      name: 'createNewAccount',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message(
      'Full Name',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `By creating an account, you agree to`
  String get acceptTerms {
    return Intl.message(
      'By creating an account, you agree to',
      name: 'acceptTerms',
      desc: '',
      args: [],
    );
  }

  /// `our Terms and Conditions`
  String get termsAndConditions {
    return Intl.message(
      'our Terms and Conditions',
      name: 'termsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account? `
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Already have an account? ',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Please enter some text`
  String get PleaseEnterSomeText {
    return Intl.message(
      'Please enter some text',
      name: 'PleaseEnterSomeText',
      desc: '',
      args: [],
    );
  }

  /// `The password provided is too weak.`
  String get weakPassword {
    return Intl.message(
      'The password provided is too weak.',
      name: 'weakPassword',
      desc: '',
      args: [],
    );
  }

  /// `You have already registered, please log in`
  String get emailAlreadyInUse {
    return Intl.message(
      'You have already registered, please log in',
      name: 'emailAlreadyInUse',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred. Please try again later.`
  String get errorOccurredTryAgain {
    return Intl.message(
      'An error occurred. Please try again later.',
      name: 'errorOccurredTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Please accept the terms and conditions`
  String get pleaseAcceptTerms {
    return Intl.message(
      'Please accept the terms and conditions',
      name: 'pleaseAcceptTerms',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred. Please try again later.`
  String get anErrorOccurred {
    return Intl.message(
      'An error occurred. Please try again later.',
      name: 'anErrorOccurred',
      desc: '',
      args: [],
    );
  }

  /// `Check your connection, then try again`
  String get checkYourConection {
    return Intl.message(
      'Check your connection, then try again',
      name: 'checkYourConection',
      desc: '',
      args: [],
    );
  }

  /// `No user found for that email`
  String get noUserFoundForThatEmail {
    return Intl.message(
      'No user found for that email',
      name: 'noUserFoundForThatEmail',
      desc: '',
      args: [],
    );
  }

  /// `The password provided for that user is incorrect`
  String get wrongPasswordProvidedForThatUser {
    return Intl.message(
      'The password provided for that user is incorrect',
      name: 'wrongPasswordProvidedForThatUser',
      desc: '',
      args: [],
    );
  }

  /// `Email or password is incorrect`
  String get wrongEmailOrPassword {
    return Intl.message(
      'Email or password is incorrect',
      name: 'wrongEmailOrPassword',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email`
  String get invalidEmail {
    return Intl.message(
      'Invalid email',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Eid Offers`
  String get eidVoucher {
    return Intl.message(
      'Eid Offers',
      name: 'eidVoucher',
      desc: '',
      args: [],
    );
  }

  /// `25% Offers`
  String get discount {
    return Intl.message(
      '25% Offers',
      name: 'discount',
      desc: '',
      args: [],
    );
  }

  /// `Shop Now`
  String get shoppingNow {
    return Intl.message(
      'Shop Now',
      name: 'shoppingNow',
      desc: '',
      args: [],
    );
  }

  /// ` Most Sold`
  String get mostSelled {
    return Intl.message(
      ' Most Sold',
      name: 'mostSelled',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get more {
    return Intl.message(
      'More',
      name: 'more',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cart {
    return Intl.message(
      'Cart',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Products`
  String get products {
    return Intl.message(
      'Products',
      name: 'products',
      desc: '',
      args: [],
    );
  }

  /// `Good morning!`
  String get goodMorning {
    return Intl.message(
      'Good morning!',
      name: 'goodMorning',
      desc: '',
      args: [],
    );
  }

  /// `Search for...`
  String get searchHint {
    return Intl.message(
      'Search for...',
      name: 'searchHint',
      desc: '',
      args: [],
    );
  }

  /// `Offers`
  String get offers {
    return Intl.message(
      'Offers',
      name: 'offers',
      desc: '',
      args: [],
    );
  }

  /// `Our products`
  String get allProducts {
    return Intl.message(
      'Our products',
      name: 'allProducts',
      desc: '',
      args: [],
    );
  }

  /// `{count} results`
  String resultsCount(int count) {
    return Intl.message(
      '$count results',
      name: 'resultsCount',
      desc: '',
      args: [count],
    );
  }

  /// `Sort by`
  String get sortBy {
    return Intl.message(
      'Sort by',
      name: 'sortBy',
      desc: '',
      args: [],
    );
  }

  /// `Price: low to high`
  String get sortPriceLow {
    return Intl.message(
      'Price: low to high',
      name: 'sortPriceLow',
      desc: '',
      args: [],
    );
  }

  /// `Price: high to low`
  String get sortPriceHigh {
    return Intl.message(
      'Price: high to low',
      name: 'sortPriceHigh',
      desc: '',
      args: [],
    );
  }

  /// `Top rated`
  String get sortRating {
    return Intl.message(
      'Top rated',
      name: 'sortRating',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get categoryAll {
    return Intl.message(
      'All',
      name: 'categoryAll',
      desc: '',
      args: [],
    );
  }

  /// `Fruits`
  String get categoryFruits {
    return Intl.message(
      'Fruits',
      name: 'categoryFruits',
      desc: '',
      args: [],
    );
  }

  /// `Citrus`
  String get categoryCitrus {
    return Intl.message(
      'Citrus',
      name: 'categoryCitrus',
      desc: '',
      args: [],
    );
  }

  /// `Tropical`
  String get categoryTropical {
    return Intl.message(
      'Tropical',
      name: 'categoryTropical',
      desc: '',
      args: [],
    );
  }

  /// `Berries`
  String get categoryBerries {
    return Intl.message(
      'Berries',
      name: 'categoryBerries',
      desc: '',
      args: [],
    );
  }

  /// `EGP`
  String get currency {
    return Intl.message(
      'EGP',
      name: 'currency',
      desc: '',
      args: [],
    );
  }

  /// `Add to cart`
  String get addToCart {
    return Intl.message(
      'Add to cart',
      name: 'addToCart',
      desc: '',
      args: [],
    );
  }

  /// `Added to your cart`
  String get addedToCart {
    return Intl.message(
      'Added to your cart',
      name: 'addedToCart',
      desc: '',
      args: [],
    );
  }

  /// `Reviews`
  String get reviews {
    return Intl.message(
      'Reviews',
      name: 'reviews',
      desc: '',
      args: [],
    );
  }

  /// `{count} reviews`
  String reviewsCount(int count) {
    return Intl.message(
      '$count reviews',
      name: 'reviewsCount',
      desc: '',
      args: [count],
    );
  }

  /// `Rating`
  String get rating {
    return Intl.message(
      'Rating',
      name: 'rating',
      desc: '',
      args: [],
    );
  }

  /// `Shelf life`
  String get expiry {
    return Intl.message(
      'Shelf life',
      name: 'expiry',
      desc: '',
      args: [],
    );
  }

  /// `{count} months`
  String monthsCount(int count) {
    return Intl.message(
      '$count months',
      name: 'monthsCount',
      desc: '',
      args: [count],
    );
  }

  /// `Organic`
  String get organic {
    return Intl.message(
      'Organic',
      name: 'organic',
      desc: '',
      args: [],
    );
  }

  /// `Regular`
  String get notOrganic {
    return Intl.message(
      'Regular',
      name: 'notOrganic',
      desc: '',
      args: [],
    );
  }

  /// `Calories`
  String get calories {
    return Intl.message(
      'Calories',
      name: 'calories',
      desc: '',
      args: [],
    );
  }

  /// `{count} kcal`
  String caloriesValue(int count) {
    return Intl.message(
      '$count kcal',
      name: 'caloriesValue',
      desc: '',
      args: [count],
    );
  }

  /// `per 100 g`
  String get per100g {
    return Intl.message(
      'per 100 g',
      name: 'per100g',
      desc: '',
      args: [],
    );
  }

  /// `Your cart is empty`
  String get cartEmptyTitle {
    return Intl.message(
      'Your cart is empty',
      name: 'cartEmptyTitle',
      desc: '',
      args: [],
    );
  }

  /// `Add your favorite fruits and they will show up here`
  String get cartEmptySubtitle {
    return Intl.message(
      'Add your favorite fruits and they will show up here',
      name: 'cartEmptySubtitle',
      desc: '',
      args: [],
    );
  }

  /// `You have {count} products in your cart`
  String cartItemsCount(int count) {
    return Intl.message(
      'You have $count products in your cart',
      name: 'cartItemsCount',
      desc: '',
      args: [count],
    );
  }

  /// `Checkout  {total} EGP`
  String checkoutWithTotal(String total) {
    return Intl.message(
      'Checkout  $total EGP',
      name: 'checkoutWithTotal',
      desc: '',
      args: [total],
    );
  }

  /// `Checkout`
  String get checkout {
    return Intl.message(
      'Checkout',
      name: 'checkout',
      desc: '',
      args: [],
    );
  }

  /// `Shipping`
  String get shipping {
    return Intl.message(
      'Shipping',
      name: 'shipping',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get payment {
    return Intl.message(
      'Payment',
      name: 'payment',
      desc: '',
      args: [],
    );
  }

  /// `Cash on delivery`
  String get cashOnDelivery {
    return Intl.message(
      'Cash on delivery',
      name: 'cashOnDelivery',
      desc: '',
      args: [],
    );
  }

  /// `Pay when your order arrives`
  String get cashOnDeliveryDesc {
    return Intl.message(
      'Pay when your order arrives',
      name: 'cashOnDeliveryDesc',
      desc: '',
      args: [],
    );
  }

  /// `Pay online`
  String get payOnline {
    return Intl.message(
      'Pay online',
      name: 'payOnline',
      desc: '',
      args: [],
    );
  }

  /// `Visa / Mastercard`
  String get payOnlineDesc {
    return Intl.message(
      'Visa / Mastercard',
      name: 'payOnlineDesc',
      desc: '',
      args: [],
    );
  }

  /// `Soon`
  String get comingSoon {
    return Intl.message(
      'Soon',
      name: 'comingSoon',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Confirm order`
  String get confirmOrder {
    return Intl.message(
      'Confirm order',
      name: 'confirmOrder',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get phone {
    return Intl.message(
      'Phone number',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Street address`
  String get addressLine {
    return Intl.message(
      'Street address',
      name: 'addressLine',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message(
      'City',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `Floor, apartment`
  String get floor {
    return Intl.message(
      'Floor, apartment',
      name: 'floor',
      desc: '',
      args: [],
    );
  }

  /// `Invalid phone number`
  String get invalidPhone {
    return Intl.message(
      'Invalid phone number',
      name: 'invalidPhone',
      desc: '',
      args: [],
    );
  }

  /// `Order summary`
  String get orderSummary {
    return Intl.message(
      'Order summary',
      name: 'orderSummary',
      desc: '',
      args: [],
    );
  }

  /// `Subtotal`
  String get subtotal {
    return Intl.message(
      'Subtotal',
      name: 'subtotal',
      desc: '',
      args: [],
    );
  }

  /// `Delivery`
  String get delivery {
    return Intl.message(
      'Delivery',
      name: 'delivery',
      desc: '',
      args: [],
    );
  }

  /// `Free`
  String get free {
    return Intl.message(
      'Free',
      name: 'free',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Deliver to`
  String get deliverTo {
    return Intl.message(
      'Deliver to',
      name: 'deliverTo',
      desc: '',
      args: [],
    );
  }

  /// `Payment method`
  String get paymentMethod {
    return Intl.message(
      'Payment method',
      name: 'paymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Order placed!`
  String get orderPlaced {
    return Intl.message(
      'Order placed!',
      name: 'orderPlaced',
      desc: '',
      args: [],
    );
  }

  /// `We are preparing your order and will deliver it soon`
  String get orderPlacedDesc {
    return Intl.message(
      'We are preparing your order and will deliver it soon',
      name: 'orderPlacedDesc',
      desc: '',
      args: [],
    );
  }

  /// `Order number: {id}`
  String orderNumber(String id) {
    return Intl.message(
      'Order number: $id',
      name: 'orderNumber',
      desc: '',
      args: [id],
    );
  }

  /// `Track my orders`
  String get trackOrders {
    return Intl.message(
      'Track my orders',
      name: 'trackOrders',
      desc: '',
      args: [],
    );
  }

  /// `Back to home`
  String get backToHome {
    return Intl.message(
      'Back to home',
      name: 'backToHome',
      desc: '',
      args: [],
    );
  }

  /// `My orders`
  String get myOrders {
    return Intl.message(
      'My orders',
      name: 'myOrders',
      desc: '',
      args: [],
    );
  }

  /// `No orders yet`
  String get noOrders {
    return Intl.message(
      'No orders yet',
      name: 'noOrders',
      desc: '',
      args: [],
    );
  }

  /// `Pending`
  String get statusPending {
    return Intl.message(
      'Pending',
      name: 'statusPending',
      desc: '',
      args: [],
    );
  }

  /// `Preparing`
  String get statusPreparing {
    return Intl.message(
      'Preparing',
      name: 'statusPreparing',
      desc: '',
      args: [],
    );
  }

  /// `On the way`
  String get statusOnTheWay {
    return Intl.message(
      'On the way',
      name: 'statusOnTheWay',
      desc: '',
      args: [],
    );
  }

  /// `Delivered`
  String get statusDelivered {
    return Intl.message(
      'Delivered',
      name: 'statusDelivered',
      desc: '',
      args: [],
    );
  }

  /// `Cancelled`
  String get statusCancelled {
    return Intl.message(
      'Cancelled',
      name: 'statusCancelled',
      desc: '',
      args: [],
    );
  }

  /// `{count} items`
  String itemsCountShort(int count) {
    return Intl.message(
      '$count items',
      name: 'itemsCountShort',
      desc: '',
      args: [count],
    );
  }

  /// `Favorites`
  String get favorites {
    return Intl.message(
      'Favorites',
      name: 'favorites',
      desc: '',
      args: [],
    );
  }

  /// `No favorites yet`
  String get noFavorites {
    return Intl.message(
      'No favorites yet',
      name: 'noFavorites',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `العربية`
  String get arabic {
    return Intl.message(
      'العربية',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `About us`
  String get aboutUs {
    return Intl.message(
      'About us',
      name: 'aboutUs',
      desc: '',
      args: [],
    );
  }

  /// `FruitHub is an online store for fresh fruit. We pick fruit carefully from the farms and deliver it to your door.`
  String get aboutText {
    return Intl.message(
      'FruitHub is an online store for fresh fruit. We pick fruit carefully from the farms and deliver it to your door.',
      name: 'aboutText',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get logout {
    return Intl.message(
      'Log out',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to log out?`
  String get logoutConfirm {
    return Intl.message(
      'Do you want to log out?',
      name: 'logoutConfirm',
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

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `General`
  String get general {
    return Intl.message(
      'General',
      name: 'general',
      desc: '',
      args: [],
    );
  }

  /// `Help`
  String get help {
    return Intl.message(
      'Help',
      name: 'help',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Sorry, nothing matches your search`
  String get noResults {
    return Intl.message(
      'Sorry, nothing matches your search',
      name: 'noResults',
      desc: '',
      args: [],
    );
  }

  /// `Try again`
  String get tryAgain {
    return Intl.message(
      'Try again',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Free delivery`
  String get freeDeliveryOffer {
    return Intl.message(
      'Free delivery',
      name: 'freeDeliveryOffer',
      desc: '',
      args: [],
    );
  }

  /// `On orders over 300 EGP`
  String get freeDeliveryDesc {
    return Intl.message(
      'On orders over 300 EGP',
      name: 'freeDeliveryDesc',
      desc: '',
      args: [],
    );
  }

  /// `Mango season`
  String get mangoSeason {
    return Intl.message(
      'Mango season',
      name: 'mangoSeason',
      desc: '',
      args: [],
    );
  }

  /// `{percent}% OFF`
  String percentOff(int percent) {
    return Intl.message(
      '$percent% OFF',
      name: 'percentOff',
      desc: '',
      args: [percent],
    );
  }

  /// `Quantity`
  String get quantity {
    return Intl.message(
      'Quantity',
      name: 'quantity',
      desc: '',
      args: [],
    );
  }

  /// `Popular searches`
  String get popularSearches {
    return Intl.message(
      'Popular searches',
      name: 'popularSearches',
      desc: '',
      args: [],
    );
  }

  /// `Mark all as read`
  String get markAllRead {
    return Intl.message(
      'Mark all as read',
      name: 'markAllRead',
      desc: '',
      args: [],
    );
  }

  /// `New`
  String get newLabel {
    return Intl.message(
      'New',
      name: 'newLabel',
      desc: '',
      args: [],
    );
  }

  /// `Earlier`
  String get earlier {
    return Intl.message(
      'Earlier',
      name: 'earlier',
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
