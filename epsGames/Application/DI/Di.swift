import UIKit

final class Di {
    
    fileprivate let screenFactory: ScreenFactoryImpl
    fileprivate let coordinatorFactory: CoordinatorFactoryImpl
    
    init() {
        screenFactory = ScreenFactoryImpl()
        coordinatorFactory = CoordinatorFactoryImpl(screenFactory: screenFactory)
        
        screenFactory.di = self
    }
}

protocol AppFactory {
    
    func makeKeyWindowWithCoordinator() -> (UIWindow, Coordinator)
}

extension Di: AppFactory {
    
    func makeKeyWindowWithCoordinator() -> (UIWindow, Coordinator) {
        let window = UIWindow()
        let rootVC = UINavigationController()
        //rootVC.navigationBar.prefersLargeTitles = true
        let router = RouterImp(rootController: rootVC)
        let cooridnator = coordinatorFactory.makeApplicationCoordinator(router: router)
        window.rootViewController = rootVC
        return (window, cooridnator)
    }
    
}

protocol ScreenFactory {
    
    func makeSplashScreen() -> SplashScreenVC<SplashScreenViewImpl>
    func makeTabBarScreen() -> MainScreenVC<MainScreenViewImpl>
    
}

final class ScreenFactoryImpl: ScreenFactory {
    
    fileprivate weak var di: Di!
    fileprivate init(){}
    
    func makeSplashScreen() -> SplashScreenVC<SplashScreenViewImpl> {
        return SplashScreenVC<SplashScreenViewImpl>()
        //(loginStatusProvider: di.loginStatusProvider)
    }
    
    func makeTabBarScreen() ->MainScreenVC<MainScreenViewImpl> {
        return MainScreenVC<MainScreenViewImpl>()
    }
}

protocol CoordinatorFactory {
    
    func makeApplicationCoordinator(router: Router) -> ApplicationCoordinator
    
    func makeStartCoordinator(router: Router) -> StartCoordinator
    
    func makeTabBarCoordinator(router: Router) -> TabBarCoordinator
}

final class CoordinatorFactoryImpl: CoordinatorFactory {
    
    private let screenFactory: ScreenFactory
    
    fileprivate init(screenFactory: ScreenFactory) {
        self.screenFactory = screenFactory
    }
    
    func makeApplicationCoordinator(router: Router) -> ApplicationCoordinator {
        return ApplicationCoordinator(router: router, coordinatorFactory: self)
    }

    func makeStartCoordinator(router: Router) -> StartCoordinator {
        return StartCoordinator(router: router, screenFactory: screenFactory)
    }
    
    func makeTabBarCoordinator(router: Router) -> TabBarCoordinator {
        return TabBarCoordinator(router: router, screenFactory: screenFactory)
    }
}


