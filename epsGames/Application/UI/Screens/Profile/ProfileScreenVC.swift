import UIKit

final class ProfileScreenVC<View: ProfileScreenView>: BaseViewController<View> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.navigationItem.title = "Profile"
    }

}
