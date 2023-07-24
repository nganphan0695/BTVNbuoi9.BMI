

import UIKit

class CustomView: UIView {

    @IBOutlet var customView: UIView!
    @IBOutlet weak var labelView2: UILabel!
    @IBOutlet weak var buttonView2: UIButton!
    @IBOutlet weak var buttonView1: UIButton!
    @IBOutlet weak var labelView1: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
    
    private func setupView(){
        Bundle.main.loadNibNamed("customView", owner: self)
        self.addSubview(customView)
        customView.frame = self.bounds
        customView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    override func draw(_ rect: CGRect) {
        self.customView.backgroundColor = UIColor(red: 0.21, green: 0.21, blue: 0.26, alpha: 1.00)
        
        labelView2s()
        labelView1s()
        buttonView1s()
        buttonView2s()
    }
    
    func labelView1s(){
        
        labelView1.textColor = UIColor(red: 0.39, green: 0.40, blue: 0.44, alpha: 1.00)
        labelView1.font = UIFont.systemFont(ofSize: 15)
        labelView1.frame = CGRect(
            x: labelView2.center.x - 50,
            y: labelView2.frame.minY - 40,
            width: 100,
            height: 30)
    }
    
    func labelView2s(){
        
        labelView2.font = UIFont.systemFont(ofSize: 20)
        labelView2.textColor = .white
        labelView2.frame = CGRect(
            x: 0,
            y: 0,
            width: 100,
            height: 30)
        labelView2.center = customView.center
    }
    
    func buttonView1s(){
        
        buttonView1.setTitle("-", for: .normal)
        buttonView1.setTitleColor(.white, for: .normal)
        buttonView1.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        buttonView1.frame = CGRect(
            x: labelView2.center.x - 50,
            y: labelView2.frame.maxY + 10,
            width: 35,
            height: 35)
        buttonView1.layer.cornerRadius = buttonView1.frame.width/2
        buttonView1.backgroundColor = UIColor(red: 0.37, green: 0.38, blue: 0.42, alpha: 1.00)
    }
    
    func buttonView2s(){
        
        buttonView2.setTitle("+", for: .normal)
        buttonView2.setTitleColor(.white, for: .normal)
        buttonView2.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        buttonView2.frame = CGRect(
            x: labelView2.center.x + 20,
            y: labelView2.frame.maxY + 10,
            width: 35,
            height: 35)
        buttonView2.layer.cornerRadius = buttonView2.frame.width/2
        buttonView2.backgroundColor = UIColor(red: 0.37, green: 0.38, blue: 0.42, alpha: 1.00)
    }
    
    func labelWeight() {
        labelView2.text = "10"
        labelView1.text = "WEIGHT"
    }
    
    func labelAge(){
        labelView2.text = "1"
        labelView1.text = "AGE"
    }
    
}
