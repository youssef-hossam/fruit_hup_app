/// Demo mode runs the app without Firebase, on in-memory data.
/// Used for web previews and screenshots:
///   flutter run -d chrome --dart-define=DEMO=true
const bool kDemoMode = bool.fromEnvironment('DEMO');
