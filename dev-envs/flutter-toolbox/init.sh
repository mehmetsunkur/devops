
flutter config --no-analytics;
flutter precache;
yes "y" | flutter doctor --android-licenses;
flutter doctor;
flutter emulators --create;
flutter update-packages;
code --install-extension dart-code.flutter
