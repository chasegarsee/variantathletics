# variantExerciseLibrary

A new Flutter project.

## Getting Started

FlutterFlow projects are built to run on the Flutter _stable_ release.


## Deployment Steps iOS: 

1. Push changes to GitHub
2. Open project in X-Code
3. Open project in VS-Code
4. Ensure you are in the ios folder | `cd /ios`
5. ensure the following two lines of code are in `/ios/runner/Info.plist`
  - `<key>NSMicrophoneUsageDescription</key>`
	- `<string>This app does needs access to your microphone, but does not collect audio data. This is access is not used within the app, but belongs to a third party API in use</string>`
6. Ensure version is updated and not reused
5. run `sudo gem update cocoapods --pre` (this takes a while)
6. run `pod update`
7. X-Code will ask to use the X-Code version or the Version on Disk. Select `Version on Disk`
8. Quit and reopen project in X-Code
9. Build App in X-Code (this can take some time)
10. Commit and Push changes to GitHub
11. In Flutterflow, change deployment source to `GitHub`
12. Click `Deploy to App Store` (this can take some time)



## Deployment Steps Android

1. In flutterflow ensure version is not resused
2. Click the `Deploy` button in `Settings -> Mobile Deployment -> Android`
3. Wait for process to complete, and it will fail to push to the Play Store
4. Download `AAB` file
5. Navigate to `https://play.google.com/console/u/0/developers/5899320776802528057/app/49738934` and select `Create New Release`
6. Rename the AAB file to the current release name, and upload to App Bundles
7. Follow prompts to promote to production.