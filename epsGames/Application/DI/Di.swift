import UIKit

final class Di {
    
    fileprivate let screenFactory: ScreenFactoryImpl
    fileprivate let coordinatorFactory: CoordinatorFactoryImpl
    //fileprivate let apiClient: ApiClient
    //fileprivate let settingProvider: SettingProvider
    fileprivate let settingService: SettingService
    
    fileprivate var settingProvider: SettingProviderImpl {
        return SettingProviderImpl(settingService: settingService)
    }
    
    init() {
        screenFactory = ScreenFactoryImpl()
        coordinatorFactory = CoordinatorFactoryImpl(screenFactory: screenFactory)
        settingService = SettingServiceImpl()
        
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
//        Нужно подумать над тем как реализовать выбор типа нав бара
        //rootVC.navigationBar.prefersLargeTitles = true
        let router = RouterImp(rootController: rootVC)
        let cooridnator = coordinatorFactory.makeApplicationCoordinator(router: router)
        window.rootViewController = rootVC
        return (window, cooridnator)
    }
    
}

protocol ScreenFactory {
    
    func makeSplashScreen() -> SplashScreenVC<SplashScreenViewImpl>
    func makeTabBarScreen() -> TabBarVC
    func makeMainScreen() -> MainScreenVC<MainScreenViewImpl>
    func makeSearchScreen() -> SearchScreenVC<SearchScreenViewImpl>
    func makeGamesScreen() -> GamesScreenVC<GamesScreenViewImpl>
    func makeProfileScreen() -> ProfileScreenVC<ProfileScreenViewImpl>
    
}

final class ScreenFactoryImpl: ScreenFactory {
    
    fileprivate weak var di: Di!
    fileprivate init(){}
    
    func makeSplashScreen() -> SplashScreenVC<SplashScreenViewImpl> {
        return SplashScreenVC<SplashScreenViewImpl>(settingServiceProvider: di.settingProvider)
        //(loginStatusProvider: di.loginStatusProvider)
    }
    
    func makeTabBarScreen() -> TabBarVC {
        return TabBarVC()
    }
    
    func makeMainScreen() -> MainScreenVC<MainScreenViewImpl> {
        return MainScreenVC<MainScreenViewImpl>()
    }
    
    func makeSearchScreen() -> SearchScreenVC<SearchScreenViewImpl> {
        return SearchScreenVC<SearchScreenViewImpl>()
    }
    
    func makeGamesScreen() -> GamesScreenVC<GamesScreenViewImpl> {
        return GamesScreenVC<GamesScreenViewImpl>()
    }
    
    func makeProfileScreen() -> ProfileScreenVC<ProfileScreenViewImpl> {
        return ProfileScreenVC<ProfileScreenViewImpl>()
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


