import UIKit

final class GamesScreenVC<View: GamesScreenView>: BaseViewController<View> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.navigationItem.title = "Games"
    }

}
