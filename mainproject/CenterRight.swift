import UIKit


class CenterRight: UIViewController {
    
    
    @IBOutlet weak var background: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.background.layer.shadowOpacity = 1
        self.background.layer.shadowColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1).cgColor
        self.background.layer.shadowOffset = CGSize(width: 5 ,height: 5)
        self.background.layer.shadowRadius = 5
        
        
        
    }
    
}
