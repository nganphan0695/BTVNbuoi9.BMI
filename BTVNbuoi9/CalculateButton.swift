

import UIKit

class CalculateButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setTitle("CALCULATE", for: .normal)
        self.setTitleColor(UIColor.white, for: .normal)
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        self.backgroundColor = UIColor(red: 0.91, green: 0.23, blue: 0.43, alpha: 1.00)
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
    }
}
