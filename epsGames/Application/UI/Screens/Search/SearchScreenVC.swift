
import UIKit

final class SearchScreenVC<View: SearchScreenView>: BaseViewController<View> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .green
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.navigationItem.title = "Search"
    }

}
