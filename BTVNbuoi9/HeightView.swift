

import UIKit

class HeightView: UIView {

    @IBOutlet var heightView: UIView!
    @IBOutlet weak var labelHeight: UILabel!
    @IBOutlet weak var heightValueLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
    
    private func setupView(){
        Bundle.main.loadNibNamed("heightView", owner: self)
        self.addSubview(heightView)
        heightView.frame = self.bounds
        heightView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    override func draw(_ rect: CGRect) {
        self.heightView.backgroundColor = UIColor(red: 0.21, green: 0.21, blue: 0.26, alpha: 1.00)
        
        labelHeights()
        sliders()
        heightValueLabels()
    }
    
    func labelHeights(){
        
        labelHeight.text = "HEIGHT"
        labelHeight.textColor = UIColor(red: 0.39, green: 0.40, blue: 0.44, alpha: 1.00)
        labelHeight.font = UIFont.systemFont(ofSize: 15)
        labelHeight.frame = CGRect(
            x: heightView.center.x - 40,
            y: heightView.frame.origin.y + 10,
            width: 80,
            height: 50)
    }
    
    func heightValueLabels(){
        heightValueLabel.center = heightView.center
        heightValueLabel.font = UIFont.systemFont(ofSize: 20)
        heightValueLabel.textColor = .white
        heightValueLabel.text = "0.0"
    }
    
    func sliders(){
        slider.frame = CGRect(
            x: heightView.frame.minX + 30,
            y: heightView.frame.maxY - 70,
            width: heightView.bounds.width - 60,
            height: 50)
        slider.tintColor = UIColor(red: 0.91, green: 0.23, blue: 0.43, alpha: 1.00)
        slider.minimumValue = 50.0
        slider.maximumValue = 250.0
        slider.value = 0.0
        slider.isContinuous = true
       
    }
    
    func valueLabel(){
        let formatValue = String(format: "%.1f", slider.value)
        heightValueLabel.text = "\(formatValue) cm"
    }
}
