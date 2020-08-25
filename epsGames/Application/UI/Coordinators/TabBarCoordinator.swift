import UIKit

final class TabBarCoordinator: BaseCoordinator {
    
    var finishFlow: VoidClosure?
    
    private let screenFactory: ScreenFactory
    private let router: Router
    
    init(router: Router, screenFactory: ScreenFactory) {
        self.screenFactory = screenFactory
        self.router = router
    }
    
    override func start() {
        print("=start in TabBarCoordinator")
        createTabBatVC()
    }
    
    private func createTabBatVC() {
        let tabBarScreen = screenFactory.makeTabBarScreen()
        let mainScreen = screenFactory.makeMainScreen()
        mainScreen.tabBarItem = UITabBarItem(title: "Main", image: UIImage(named: "tab_icon_main"), tag: 0)
        
        let searchScreen = screenFactory.makeSearchScreen()
        searchScreen.tabBarItem = UITabBarItem(title: "Search", image: UIImage(named: "tab_icon_search"), tag: 1)
        
        let gamesScreen = screenFactory.makeGamesScreen()
        gamesScreen.tabBarItem = UITabBarItem(title: "Games", image: UIImage(named: "tab_icon_games"), tag: 2)
        
        let profileScreen = screenFactory.makeProfileScreen()
        profileScreen.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "tab_icon_profile"), tag: 3)
        
        
        tabBarScreen.viewControllers = [mainScreen, searchScreen, gamesScreen, profileScreen]

        router.setRootModule(tabBarScreen)
    }
    
//    private func showMovies() {
//        let moviesScreen = screenFactory.makeMoviesScreen()
//        moviesScreen.onSelectMovie = { [weak self] in self?.showMovie(id: $0) }
//        moviesScreen.onShowFavoriteAlert = { [weak router] data in
//            let alert = UIAlertController(inputData: data)
//            router?.present(alert)
//        }
//        router.setRootModule(moviesScreen, hideBar: false)
//    }
//
//    private func showMovie(id: Movie.Id) {
//        let moviesScreen = screenFactory.makeMovieScreen(id: id)
//        router.push(moviesScreen)
//    }
    
}
