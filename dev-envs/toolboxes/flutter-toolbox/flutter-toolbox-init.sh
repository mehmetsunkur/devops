
# toolbox specific environment
if ! [[ "$PATH" =~ "$FLUTTER_HOME/bin" ]]
then
    PATH="$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/emulator:$ANDROID_SDK_ROOT/platform-tools:$ANDROID_SDK_ROOT/platforms:$FLUTTER_HOME/bin"
fi
export PATH

if ! [ -f "$SDK_HOME/bin/flutter-setup.done" ]; then
flutter config --no-analytics \
&& flutter precache \
&& yes "y" | flutter doctor --android-licenses \
&& flutter doctor \
&& flutter emulators --create \
&& flutter update-packages \
&& code --install-extension dart-code.flutter \
&& touch "$SDK_HOME/bin/flutter-setup.done"
fi

