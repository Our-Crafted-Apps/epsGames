import UIKit

private struct Constants {

    static let animationKey = "hand.animation"

    static let animationDuration: TimeInterval = 2
}

final class SplashScreenVC<View: SplashScreenView>: BaseViewController<View> {
    
    var onCheck: BoolClosure?
    
    var progressIndicatorImageView = UIImageView()
    
    
    let settingServiceProvider: SettingProvider

    init(settingServiceProvider: SettingProvider) {
        self.settingServiceProvider = settingServiceProvider
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressIndicatorImageView.image = UIImage(named: "splash_load")
        progressIndicatorImageView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(progressIndicatorImageView)
        
        progressIndicatorImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        progressIndicatorImageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        progressIndicatorImageView.layer.shouldRasterize = true
        progressIndicatorImageView.layer.rasterizationScale = UIScreen.main.scale
        
        settingServiceProvider.loadSetting { (loadData) in
            print("=loadSetting: \(loadData)")
            self.onCheck?(loadData)
        }
        
//      Нужно предусмотреть загрузку данных о пользователе если он авторизован
        //checkLoginStatus()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        startAnimation()
    }
    
    deinit {
        print("=deinit SplashScreenVC")
    }
    
    private func checkLoginStatus() {
        let isLogin = false //loginStatusProvider.isLogin
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.onCheck?(isLogin)
        }
    }
}

extension SplashScreenVC {

    fileprivate var animationActive: Bool {
        return progressIndicatorImageView.layer.animation(forKey: Constants.animationKey) != nil
    }

    fileprivate func startAnimation() {
        guard !animationActive else {
            return
        }

        let animation = CABasicAnimation(keyPath: "transform.rotation.z")

        animation.byValue = CGFloat(.pi * 2.0)
        animation.repeatCount = .infinity
        animation.duration = Constants.animationDuration

        progressIndicatorImageView.layer.add(animation, forKey: Constants.animationKey)
    }
}
