// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(count) => "${count} kcal";

  static String m1(count) => "You have ${count} products in your cart";

  static String m2(total) => "Checkout  ${total} EGP";

  static String m3(count) => "${count} items";

  static String m4(count) => "${count} months";

  static String m5(id) => "Order number: ${id}";

  static String m6(percent) => "${percent}% OFF";

  static String m7(count) => "${count} results";

  static String m8(count) => "${count} reviews";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "DontHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("Don\'t have an account ?"),
        "PleaseEnterSomeText":
            MessageLookupByLibrary.simpleMessage("Please enter some text"),
        "aboutText": MessageLookupByLibrary.simpleMessage(
            "FruitHub is an online store for fresh fruit. We pick fruit carefully from the farms and deliver it to your door."),
        "aboutUs": MessageLookupByLibrary.simpleMessage("About us"),
        "acceptTerms": MessageLookupByLibrary.simpleMessage(
            "By creating an account, you agree to"),
        "addToCart": MessageLookupByLibrary.simpleMessage("Add to cart"),
        "addedToCart":
            MessageLookupByLibrary.simpleMessage("Added to your cart"),
        "address": MessageLookupByLibrary.simpleMessage("Address"),
        "addressLine": MessageLookupByLibrary.simpleMessage("Street address"),
        "allProducts": MessageLookupByLibrary.simpleMessage("Our products"),
        "alreadyHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("Already have an account? "),
        "anErrorOccurred": MessageLookupByLibrary.simpleMessage(
            "An error occurred. Please try again later."),
        "arabic": MessageLookupByLibrary.simpleMessage("العربية"),
        "backToHome": MessageLookupByLibrary.simpleMessage("Back to home"),
        "calories": MessageLookupByLibrary.simpleMessage("Calories"),
        "caloriesValue": m0,
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "cart": MessageLookupByLibrary.simpleMessage("Cart"),
        "cartEmptySubtitle": MessageLookupByLibrary.simpleMessage(
            "Add your favorite fruits and they will show up here"),
        "cartEmptyTitle":
            MessageLookupByLibrary.simpleMessage("Your cart is empty"),
        "cartItemsCount": m1,
        "cashOnDelivery":
            MessageLookupByLibrary.simpleMessage("Cash on delivery"),
        "cashOnDeliveryDesc":
            MessageLookupByLibrary.simpleMessage("Pay when your order arrives"),
        "categoryAll": MessageLookupByLibrary.simpleMessage("All"),
        "categoryBerries": MessageLookupByLibrary.simpleMessage("Berries"),
        "categoryCitrus": MessageLookupByLibrary.simpleMessage("Citrus"),
        "categoryFruits": MessageLookupByLibrary.simpleMessage("Fruits"),
        "categoryTropical": MessageLookupByLibrary.simpleMessage("Tropical"),
        "checkYourConection": MessageLookupByLibrary.simpleMessage(
            "Check your connection, then try again"),
        "checkout": MessageLookupByLibrary.simpleMessage("Checkout"),
        "checkoutWithTotal": m2,
        "city": MessageLookupByLibrary.simpleMessage("City"),
        "comingSoon": MessageLookupByLibrary.simpleMessage("Soon"),
        "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
        "confirmOrder": MessageLookupByLibrary.simpleMessage("Confirm order"),
        "createAccount":
            MessageLookupByLibrary.simpleMessage("Create an Account"),
        "createNewAccount":
            MessageLookupByLibrary.simpleMessage("Create New Account"),
        "currency": MessageLookupByLibrary.simpleMessage("EGP"),
        "deliverTo": MessageLookupByLibrary.simpleMessage("Deliver to"),
        "delivery": MessageLookupByLibrary.simpleMessage("Delivery"),
        "discount": MessageLookupByLibrary.simpleMessage("25% Offers"),
        "earlier": MessageLookupByLibrary.simpleMessage("Earlier"),
        "edit": MessageLookupByLibrary.simpleMessage("Edit"),
        "eidVoucher": MessageLookupByLibrary.simpleMessage("Eid Offers"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "emailAlreadyInUse": MessageLookupByLibrary.simpleMessage(
            "You have already registered, please log in"),
        "english": MessageLookupByLibrary.simpleMessage("English"),
        "errorOccurredTryAgain": MessageLookupByLibrary.simpleMessage(
            "An error occurred. Please try again later."),
        "expiry": MessageLookupByLibrary.simpleMessage("Shelf life"),
        "favorites": MessageLookupByLibrary.simpleMessage("Favorites"),
        "floor": MessageLookupByLibrary.simpleMessage("Floor, apartment"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Forgot Password?"),
        "free": MessageLookupByLibrary.simpleMessage("Free"),
        "freeDeliveryDesc":
            MessageLookupByLibrary.simpleMessage("On orders over 300 EGP"),
        "freeDeliveryOffer":
            MessageLookupByLibrary.simpleMessage("Free delivery"),
        "fullName": MessageLookupByLibrary.simpleMessage("Full Name"),
        "general": MessageLookupByLibrary.simpleMessage("General"),
        "goodMorning": MessageLookupByLibrary.simpleMessage("Good morning!"),
        "help": MessageLookupByLibrary.simpleMessage("Help"),
        "home": MessageLookupByLibrary.simpleMessage("Home"),
        "invalidEmail": MessageLookupByLibrary.simpleMessage("Invalid email"),
        "invalidPhone":
            MessageLookupByLibrary.simpleMessage("Invalid phone number"),
        "itemsCountShort": m3,
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "logout": MessageLookupByLibrary.simpleMessage("Log out"),
        "logoutConfirm":
            MessageLookupByLibrary.simpleMessage("Do you want to log out?"),
        "mangoSeason": MessageLookupByLibrary.simpleMessage("Mango season"),
        "markAllRead": MessageLookupByLibrary.simpleMessage("Mark all as read"),
        "monthsCount": m4,
        "more": MessageLookupByLibrary.simpleMessage("More"),
        "mostSelled": MessageLookupByLibrary.simpleMessage(" Most Sold"),
        "myOrders": MessageLookupByLibrary.simpleMessage("My orders"),
        "newAccount": MessageLookupByLibrary.simpleMessage("New Account"),
        "newLabel": MessageLookupByLibrary.simpleMessage("New"),
        "next": MessageLookupByLibrary.simpleMessage("Next"),
        "noFavorites": MessageLookupByLibrary.simpleMessage("No favorites yet"),
        "noOrders": MessageLookupByLibrary.simpleMessage("No orders yet"),
        "noResults": MessageLookupByLibrary.simpleMessage(
            "Sorry, nothing matches your search"),
        "noUserFoundForThatEmail": MessageLookupByLibrary.simpleMessage(
            "No user found for that email"),
        "notOrganic": MessageLookupByLibrary.simpleMessage("Regular"),
        "notifications": MessageLookupByLibrary.simpleMessage("Notifications"),
        "offers": MessageLookupByLibrary.simpleMessage("Offers"),
        "onBoardingSubTitle1": MessageLookupByLibrary.simpleMessage(
            "Discover a unique shopping experience with FruitHUB. Explore our wide selection of premium fresh fruits and enjoy the best deals and top quality."),
        "onBoardingSubTitle2": MessageLookupByLibrary.simpleMessage(
            "We offer you the finest carefully selected fruits. Check details, images, and reviews to make sure you pick the perfect fruit."),
        "onBoardingTitle1": MessageLookupByLibrary.simpleMessage("Welcome to"),
        "onBoardingTitle2":
            MessageLookupByLibrary.simpleMessage("Search and Shop"),
        "or": MessageLookupByLibrary.simpleMessage("Or"),
        "orderNumber": m5,
        "orderPlaced": MessageLookupByLibrary.simpleMessage("Order placed!"),
        "orderPlacedDesc": MessageLookupByLibrary.simpleMessage(
            "We are preparing your order and will deliver it soon"),
        "orderSummary": MessageLookupByLibrary.simpleMessage("Order summary"),
        "organic": MessageLookupByLibrary.simpleMessage("Organic"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "payOnline": MessageLookupByLibrary.simpleMessage("Pay online"),
        "payOnlineDesc":
            MessageLookupByLibrary.simpleMessage("Visa / Mastercard"),
        "payment": MessageLookupByLibrary.simpleMessage("Payment"),
        "paymentMethod": MessageLookupByLibrary.simpleMessage("Payment method"),
        "per100g": MessageLookupByLibrary.simpleMessage("per 100 g"),
        "percentOff": m6,
        "phone": MessageLookupByLibrary.simpleMessage("Phone number"),
        "pleaseAcceptTerms": MessageLookupByLibrary.simpleMessage(
            "Please accept the terms and conditions"),
        "popularSearches":
            MessageLookupByLibrary.simpleMessage("Popular searches"),
        "products": MessageLookupByLibrary.simpleMessage("Products"),
        "profile": MessageLookupByLibrary.simpleMessage("Profile"),
        "quantity": MessageLookupByLibrary.simpleMessage("Quantity"),
        "rating": MessageLookupByLibrary.simpleMessage("Rating"),
        "registerWithApple":
            MessageLookupByLibrary.simpleMessage("Register with Apple"),
        "registerWithFacebook":
            MessageLookupByLibrary.simpleMessage("Register with Facebook"),
        "registerWithGoogle":
            MessageLookupByLibrary.simpleMessage("Register with Google"),
        "resultsCount": m7,
        "reviews": MessageLookupByLibrary.simpleMessage("Reviews"),
        "reviewsCount": m8,
        "search": MessageLookupByLibrary.simpleMessage("Search"),
        "searchHint": MessageLookupByLibrary.simpleMessage("Search for..."),
        "shipping": MessageLookupByLibrary.simpleMessage("Shipping"),
        "shoppingNow": MessageLookupByLibrary.simpleMessage("Shop Now"),
        "skip": MessageLookupByLibrary.simpleMessage("Skip"),
        "sortBy": MessageLookupByLibrary.simpleMessage("Sort by"),
        "sortPriceHigh":
            MessageLookupByLibrary.simpleMessage("Price: high to low"),
        "sortPriceLow":
            MessageLookupByLibrary.simpleMessage("Price: low to high"),
        "sortRating": MessageLookupByLibrary.simpleMessage("Top rated"),
        "startNow": MessageLookupByLibrary.simpleMessage("Start Now"),
        "statusCancelled": MessageLookupByLibrary.simpleMessage("Cancelled"),
        "statusDelivered": MessageLookupByLibrary.simpleMessage("Delivered"),
        "statusOnTheWay": MessageLookupByLibrary.simpleMessage("On the way"),
        "statusPending": MessageLookupByLibrary.simpleMessage("Pending"),
        "statusPreparing": MessageLookupByLibrary.simpleMessage("Preparing"),
        "subtotal": MessageLookupByLibrary.simpleMessage("Subtotal"),
        "termsAndConditions":
            MessageLookupByLibrary.simpleMessage("our Terms and Conditions"),
        "total": MessageLookupByLibrary.simpleMessage("Total"),
        "trackOrders": MessageLookupByLibrary.simpleMessage("Track my orders"),
        "tryAgain": MessageLookupByLibrary.simpleMessage("Try again"),
        "weakPassword": MessageLookupByLibrary.simpleMessage(
            "The password provided is too weak."),
        "wrongEmailOrPassword": MessageLookupByLibrary.simpleMessage(
            "Email or password is incorrect"),
        "wrongPasswordProvidedForThatUser":
            MessageLookupByLibrary.simpleMessage(
                "The password provided for that user is incorrect")
      };
}
