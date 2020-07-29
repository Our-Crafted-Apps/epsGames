import Foundation

final class ApplicationCoordinator: BaseCoordinator {
    
    private let coordinatorFactory: CoordinatorFactoryImpl
    private let router: Router
    
    private var isFirstLaunch = true
    private var isLogin = false
    
    init(router: Router, coordinatorFactory: CoordinatorFactoryImpl) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start() {
        print("=start in ApplicationCoordinator")
        runStartFlow()
//если первый запуск приложения - показываем анимацию подсказок
//        if isFirstLaunch {
//            runStartFlow()
//            isFirstLaunch = false
//            return
//        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.runTabBarFlow()
        }
        
//        if isLogin {
//            runMovieFlow()
//        } else {
//            runLoginFlow()
//        }
    }
    
    private func runStartFlow() {
        
        let coordinator = coordinatorFactory.makeStartCoordinator(router: router)
        coordinator.finishFlow = { [weak self, weak coordinator] isLogin in
            self?.isLogin = isLogin
            self?.start()
            self?.removeDependency(coordinator)
        }
        self.addDependency(coordinator)
        coordinator.start()
    }
    
//    private func runLoginFlow() {
//
//        let coordinator = coordinatorFactory.makeLoginCoordinator(router: router)
//        coordinator.finishFlow = { [weak self, weak coordinator] in
//            self?.isLogin = true
//            self?.start()
//            self?.removeDependency(coordinator)
//        }
//        self.addDependency(coordinator)
//        coordinator.start()
//    }
//
    private func runTabBarFlow() {
        print("=runTabBarFlow")
        let coordinator = coordinatorFactory.makeTabBarCoordinator(router: router)
//        coordinator.finishFlow = { [weak self, weak coordinator] in
//            self?.isLogin = true
//            self?.start()
//            self?.removeDependency(coordinator)
//        }
        coordinator.removeDependency(coordinator)
        self.addDependency(coordinator)
        coordinator.start()
    }
    
}
