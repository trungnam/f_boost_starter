import UIKit
import Flutter
import image_picker
import Foundation
import flutter_boost

@UIApplicationMain
@objc class AppDelegate: UIResponder, UIApplicationDelegate {

    var navController: UINavigationController?
    lazy var fluttervc = FBFlutterViewContainer.init()
    var window: UIWindow?

    func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    
        self.window = UIWindow(frame: UIScreen.main.bounds)

//    myFlutterBoostDelegate.navigationController = self.navController
    let myFlutterBoostDelegate = MyFlutterBoostDelegate()

    FlutterBoost.instance().setup(application, delegate: myFlutterBoostDelegate, callback: { [unowned self] engine in
            print("\(self) \(engine.debugDescription)")
            
    })

    let rootviewController = UITabBarController()
        rootviewController.view.frame = window?.frame ?? UIScreen.main.bounds
    rootviewController.tabBarItem = UITabBarItem(title: "hybrid", image: nil, tag: 0)
    
    rootviewController.tabBarItem = UITabBarItem(title: "flutter_tab", image: nil, tag: 1)

    rootviewController.view.backgroundColor = .blue
    let vc1 = UIViewControllerDemo(nibName: "UIViewControllerDemo", bundle: Bundle.main)
    
    vc1.title = "test"
    
    fluttervc?.view.backgroundColor = .yellow
    fluttervc?.title = "fluttervc"
    fluttervc?.setName("tab_friend", uniqueId: nil, params: [:])
    rootviewController.viewControllers = [vc1, (fluttervc ?? UIViewController.init()) as UIViewController]
    navController = UINavigationController.init(rootViewController: rootviewController)
    myFlutterBoostDelegate.navigationController = navController

//    self.navController!.pushViewController(rootviewController, animated: false)

    self.window = UIWindow(frame: UIScreen.main.bounds)

    self.window!.rootViewController = navController

    self.window!.backgroundColor = UIColor.white

    self.window!.makeKeyAndVisible()
    

    let nativeButton = UIButton(type: .custom)
        nativeButton.frame = CGRect(x: window?.frame.size.width ?? UIScreen.main.bounds.width * 0.5 - 50, y: 200, width: 100, height: 40)
    nativeButton.backgroundColor = UIColor.red
    nativeButton.setTitle("push native", for: .normal)
    nativeButton.addTarget(self, action: #selector(pushNative), for: .touchUpInside)
        window?.addSubview(nativeButton)

    let pushEmbededbtn = UIButton(type: .custom)
        pushEmbededbtn.frame = CGRect(x: window?.frame.size.width ?? UIScreen.main.bounds.width * 0.5 - 70, y: 150, width: 140, height: 40)
    pushEmbededbtn.backgroundColor = UIColor.red
    pushEmbededbtn.setTitle("push embedded", for: .normal)
    pushEmbededbtn.addTarget(self, action: #selector(pushEmbeded), for: .touchUpInside)
        window?.addSubview(pushEmbededbtn)
    
    return true
  }
    
    @objc func pushEmbeded() {
        let nvc = window?.rootViewController as? UINavigationController
        let vc = NativeViewController() as? UIViewController
        if let vc = vc {
            nvc?.pushViewController(vc, animated: true)
        }
    }
    
    @objc func pushNative() {
        let nvc = window?.rootViewController as? UINavigationController
        let vc = UIViewControllerDemo(nibName: "UIViewControllerDemo", bundle: Bundle.main)
        nvc?.pushViewController(vc, animated: true)
        
    }
}

