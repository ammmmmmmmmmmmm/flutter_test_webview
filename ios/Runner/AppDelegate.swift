import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
      weak var registrar = self.registrar(forPlugin: "plugins")

              let factory = FLNativeViewFactory(messenger: registrar!.messenger())
              self.registrar(forPlugin: "plugins/native_view")!.register(
                  factory,
                  withId: "plugins/native_view")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
