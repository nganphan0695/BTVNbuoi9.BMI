
import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var recaculator: UIButton!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var labelTitle: UILabel!
    
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label1: UILabel!
    
    var bmi: BMI!
    var passData: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 0.10, green: 0.13, blue: 0.20, alpha: 1.00)
        label3.numberOfLines = 2
        
        labelTitles()
        recaculators()
        
        view2.backgroundColor = UIColor(red: 0.21, green: 0.21, blue: 0.26, alpha: 1.00)
        view2.frame = CGRect(
            x: 20,
            y: labelTitle.frame.maxY + 10,
            width: view.bounds.width - 40,
            height: view.bounds.height - 280)
        
        label1s()
        label2s()
        label3s()
        
    }
    func labelTitles(){
        
        labelTitle.frame = CGRect(
            x: 20,
            y: 110,
            width: view.bounds.width - 40,
            height: 50)
        labelTitle.text = "YOUR RESULT"
        labelTitle.textColor = .white
        labelTitle.font = UIFont.systemFont(ofSize: 30)
    }
    
    func recaculators(){
        recaculator.frame = CGRect(
            x: 20,
            y: view.frame.maxY - 90,
            width: view.bounds.width - 40,
            height: 50)
        recaculator.setTitle("RE-CACULATOR", for: .normal)
        recaculator.setTitleColor(UIColor.white, for: .normal)
        recaculator.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        recaculator.backgroundColor = UIColor(red: 0.91, green: 0.23, blue: 0.43, alpha: 1.00)
        recaculator.layer.cornerRadius = 10
        recaculator.layer.masksToBounds = true

    }
    
    func label1s(){
        
        label1.frame = CGRect(
            x: 0,
            y: 50,
            width: view2.bounds.width,
            height: 50)
        label1.font = UIFont.systemFont(ofSize: 20)
        label1.textColor = bmi.bmiColor()
        label1.text = bmi.bmiTitle()
        
    }
    
    func label2s(){
        label2.frame = CGRect(
            x: 0,
            y: 250,
            width: view2.bounds.width,
            height: 70)
        label2.textColor = .white
        label2.font = UIFont.systemFont(ofSize: 25)
        let formatBMI = String(format: "%.02f", bmi.bmi)
        label2.text = "\(formatBMI)"
    }
    
    func label3s(){
        
        label3.frame = CGRect(
            x: 0,
            y: 450,
            width: view2.bounds.width,
            height: 100)
        label3.font = UIFont.systemFont(ofSize: 15)
        label3.textColor = .white
        label3.text = bmi.nhanXet()
        
    }

    @IBAction func reCaculatorButton(_ sender: Any) {
        passData?()
        dismiss(animated: true)
    }
    
}
