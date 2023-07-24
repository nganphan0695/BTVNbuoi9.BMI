
import UIKit

class GenderView: UIView {
    
    @IBOutlet var genderView: UIView!
    @IBOutlet weak var labelView: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
    
    private func setupView(){
        Bundle.main.loadNibNamed("GenderView", owner: self)
        self.addSubview(genderView)
        genderView.frame = self.bounds
        genderView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
    }
    
    override func draw(_ rect: CGRect) {
        self.genderView.backgroundColor = UIColor(red: 0.21, green: 0.21, blue: 0.26, alpha: 1.00)
        imageViews()
        labelViews()
        buttons()
    }
    
    func imageViews(){
        imageView.frame = CGRect(
            x: genderView.frame.midX - 25,
            y: genderView.frame.midY - 50,
            width: 50,
            height: 50)
    }
    
    func labelViews(){
        labelView.font = UIFont.systemFont(ofSize: 15)
        labelView.frame = CGRect(
            x: genderView.frame.midX - 50,
            y: genderView.frame.midY,
            width: 100,
            height: 50
        )
        labelView.textColor = UIColor(red: 0.39, green: 0.40, blue: 0.44, alpha: 1.00)
    }
    
    func setMale(){
        imageView.image = UIImage(named: "male")
        labelView.text = "MALE"
    }
    
    func setFemale(){
        imageView.image = UIImage(named: "female")
        labelView.text = "FEMALE"
    }
    
    let button: Button = {
        let button = Button()
        
        return button
    }()
    
    func buttons(){
        
        self.genderView.addSubview(button)
        button.frame = CGRect(x: genderView.frame.minX,
                              y: genderView.frame.minY,
                              width: genderView.bounds.width,
                              height: genderView.bounds.height)
    }
    
}

class Button: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
    }
}


