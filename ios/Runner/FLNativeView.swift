import Flutter
import UIKit
import WebKit
class FLNativeViewFactory: NSObject, FlutterPlatformViewFactory {
    private var messenger: FlutterBinaryMessenger

    init(messenger: FlutterBinaryMessenger) {
        self.messenger = messenger
        super.init()
    }

    func create(
        withFrame frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?
    ) -> FlutterPlatformView {
        if #available(iOS 11.0, *) {
            return FLNativeView(
                frame: frame,
                viewIdentifier: viewId,
                arguments: args,
                binaryMessenger: messenger)
        } else {
            
            return UIView() as! FlutterPlatformView
        }
    }
}

@available(iOS 11.0, *)
class FLNativeView: NSObject, FlutterPlatformView,WKUIDelegate,UIGestureRecognizerDelegate {
    private var _view: UIView
    var webView:UIView!

    init(
        frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?,
        binaryMessenger messenger: FlutterBinaryMessenger?
    ) {
        _view = UIView()
        super.init()
        // iOS views can be created here
        createNativeView(view: _view)
    }

    func view() -> UIView {
        return _view
    }

    func createNativeView(view _view: UIView){
        _view.backgroundColor = UIColor.blue
      
            
        let webConfiguration = WKWebViewConfiguration()
        webView = FLWebView(frame: CGRect.init(x: 0, y: 0, width: 500, height: 500))
        self._view.addSubview(webView)
        
    }

}

class FLWebView: UIView,UIGestureRecognizerDelegate {
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        let  webview = WKWebView.init(frame: frame)
        
        self.addSubview(webview)
        
        let html = """
  <!DOCTYPE html>
  <html lang="en">
  <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Document</title>
  </head>
  <body>
      <button onclick="myFunction()">click</button>
      <div id="click-preview"></div>
  </body>
  <script>
      var a = 1;
      function myFunction(event) {
         console.log("on click call");
         a ++;

         document.getElementById("click-preview").innerText = a.toString();
      }
  </script>
  </html>
  """
        webview.loadHTMLString(html, baseURL: nil)
    }
    
 
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        
        let view = super.hitTest(point, with: event);
        
        let gestureRecognizers = self.superview?.superview?.gestureRecognizers ?? []
        for gesture in gestureRecognizers{
            print(gesture)
                //gesture.isEnabled = false
        }
        return view
    }
    
}
