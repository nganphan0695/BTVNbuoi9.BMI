

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var viewTitle: UIView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var view2: UIView!
    
    
    var width: CGFloat = 0
    var selectGender: Gender = .none
    var height: Float = 0
    var weight: Int = 10
    var age: Int = 1
    var timer: Timer!
    var currentTimer: Timer!
    var isRunTimer: Bool = false
    
    let calculateButton: CalculateButton = {
        let button = CalculateButton()
        
        return button
    }()
    
    let maleView: GenderView = {
        let view = GenderView()
        return view
    }()
    
    let femaleView: GenderView = {
        let view = GenderView()
        return view
    }()
    
    let weightView: CustomView = {
        let view = CustomView()
        return view
    }()
    
    let ageView: CustomView = {
        let view = CustomView()
        return view
    }()
    
    let heightview: HeightView = {
        let view = HeightView()
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        self.width = self.view.frame.size.width
        
        viewTitles()
        view2s()
        labelTitles()
        maleViews()
        femaleViews()
        weightViews()
        ageViews()
        heightViews()
        
        self.view2.addSubview(calculateButton)
        calculateButton.frame = CGRect(x: 20,
                                       y: view2.frame.height - 70,
                                       width: width - 40,
                                       height: 50)
        calculateButton.addTarget(self, action: #selector(goToSecondVC), for: .touchUpInside)
    }
    @objc func goToSecondVC() {
        
        if selectGender == .none {
            print("Chưa chọn giới tính")
            return
        }
        
        if height == 0 {
            print("Chưa chọn chiều cao")
            return
        }
        
        let secondVC = SecondViewController()
        let bmi = BMI(height: self.height, weight: self.weight)
        secondVC.bmi = bmi
        secondVC.modalPresentationStyle = .fullScreen
        present(secondVC, animated: true)
        secondVC.passData = {
            self.weight = 10
            self.age = 1
            self.weightView.labelView2.text = "\(self.weight)"
            self.ageView.labelView2.text = "\(self.age)"
            self.selectGender = .none
            self.maleView.genderView.backgroundColor = UIColor(red: 0.21, green: 0.21, blue: 0.26, alpha: 1.00)
            self.femaleView.genderView.backgroundColor = UIColor(red: 0.21, green: 0.21, blue: 0.26, alpha: 1.00)
            self.heightview.slider.value = 0.0
            self.heightview.heightValueLabel.text = String(self.heightview.slider.value)
            self.height = 0.0
        }
    }
    
    func viewTitles(){
        
        viewTitle.frame = CGRect(
            x: 0,
            y: 0,
            width: width,
            height: 100)
        viewTitle.backgroundColor = UIColor(red: 0.10, green: 0.13, blue: 0.20, alpha: 1.00)
    }
    
    func view2s(){
        
        view2.frame = CGRect(
            x: 0,
            y: viewTitle.frame.maxY + 10,
            width: width,
            height: view.frame.size.height - viewTitle.frame.size.height - 10)
        view2.backgroundColor = viewTitle.backgroundColor
    }
    
    func labelTitles(){
        
        labelTitle.text = "BMI CALCULATOR"
        labelTitle.textColor = .white
        labelTitle.font = UIFont.systemFont(ofSize: 20)
        labelTitle.frame = CGRect(
            x: 0,
            y: viewTitle.frame.maxY - 40,
            width: width,
            height: 40)
    }
    
    func maleViews(){
        
        maleView.frame = CGRect(
            x: 20,
            y: view2.frame.minY + 20,
            width: (view2.frame.width - 60)/2,
            height: (view2.frame.height - 150)/3)
        view.addSubview(maleView)
        maleView.setMale()
        maleView.button.addTarget(self, action: #selector(setColor1), for: .touchUpInside)
        
    }
    
    @objc func setColor1() {
        
        maleView.genderView.backgroundColor = .green
        femaleView.genderView.backgroundColor = UIColor(red: 0.21, green: 0.21, blue: 0.26, alpha: 1.00)
        selectGender = .male
    }
    
    
    func femaleViews(){
        
        femaleView.frame = CGRect(
            x: maleView.frame.maxX + 20,
            y: view2.frame.minY + 20,
            width: (view2.frame.width - 60)/2,
            height: (view2.frame.height - 150)/3)
        view.addSubview(femaleView)
        femaleView.setFemale()
        femaleView.button.addTarget(self, action: #selector(setColor2), for: .touchUpInside)
        
    }
    
    @objc func setColor2() {
        
        femaleView.genderView.backgroundColor = .green
        maleView.genderView.backgroundColor = UIColor(red: 0.21, green: 0.21, blue: 0.26, alpha: 1.00)
        selectGender = .female
    }
    
    func weightViews(){
        
        view.addSubview(weightView)
        weightView.frame = CGRect(
            x: maleView.frame.minX,
            y: view2.frame.maxY - calculateButton.bounds.height - maleView.bounds.height - 90,
            width: maleView.bounds.width,
            height: maleView.bounds.height)
        weightView.buttonView1.addTarget(self, action: #selector(weightSubtract), for: .touchUpInside)
        weightView.buttonView2.addTarget(self, action: #selector(weightSum), for: .touchUpInside)
        weightView.labelWeight()
        weightView.labelView2.text = "\(weight)"
        
        let subtractLongPress1 = UILongPressGestureRecognizer(target: self, action: #selector(subtractLongPress1(_:)))
        weightView.buttonView1.addGestureRecognizer(subtractLongPress1)
        
        let sumLongPress1 = UILongPressGestureRecognizer(target: self, action: #selector(sumLongPress1(_:)))
        weightView.buttonView2.addGestureRecognizer(sumLongPress1)
        
    }
    
    @objc func subtractLongPress1(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began{
            if weight < 10 {
                return
            }
            currentTimer = Timer.scheduledTimer(timeInterval: 0.01,
                                                target: self,
                                                selector: #selector(weightSubtract),
                                                userInfo: nil,
                                                repeats: true)
        }else if gesture.state == .ended{
            currentTimer.invalidate()
        }
    }
    
    @objc func sumLongPress1(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began{
            if weight > 150 {
                return
            }
            currentTimer = Timer.scheduledTimer(timeInterval: 0.01,
                                                target: self,
                                                selector: #selector(weightSum),
                                                userInfo: nil,
                                                repeats: true)
        }else if gesture.state == .ended{
            currentTimer.invalidate()
        }
    }
    
    @objc func weightSubtract(){
        let newValue = weight - 1
        if newValue < 10 {
            weight = 10
        } else {
            weight = newValue
        }
        weightView.labelView2.text = "\(weight)"
    }
    
    @objc func weightSum(){
        let newValue = weight + 1
        if newValue > 150 {
            weight = 150
        } else {
            weight = newValue
        }
        weightView.labelView2.text = "\(weight)"
    }
    
    
    func ageViews(){
        
        view.addSubview(ageView)
        ageView.frame = CGRect(
            x: femaleView.frame.minX,
            y: weightView.frame.minY,
            width: maleView.bounds.width,
            height: maleView.bounds.height)
        ageView.buttonView1.addTarget(self, action: #selector(ageSubtract), for: .touchUpInside)
        ageView.buttonView2.addTarget(self, action: #selector(ageSum), for: .touchUpInside)
        ageView.labelAge()
        ageView.labelView2.text = "\(age)"
        
        let subtractLongPress2 = UILongPressGestureRecognizer(target: self, action: #selector(subtractLongPress2(_:)))
        ageView.buttonView1.addGestureRecognizer(subtractLongPress2)
        
        let sumLongPress2 = UILongPressGestureRecognizer(target: self, action: #selector(sumLongPress2(_:)))
        ageView.buttonView2.addGestureRecognizer(sumLongPress2)
        
    }
    
    @objc func subtractLongPress2(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began{
            if age < 1 {
                return
            }
            currentTimer = Timer.scheduledTimer(timeInterval: 0.01,
                                                target: self,
                                                selector: #selector(ageSubtract),
                                                userInfo: nil,
                                                repeats: true)
        }else if gesture.state == .ended{
            currentTimer.invalidate()
        }
    }
    
    @objc func sumLongPress2(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began{
            if age > 120 {
                return
            }
            currentTimer = Timer.scheduledTimer(timeInterval: 0.01,
                                                target: self,
                                                selector: #selector(ageSum),
                                                userInfo: nil,
                                                repeats: true)
        }else if gesture.state == .ended{
            currentTimer.invalidate()
        }
    }
    
    @objc func ageSubtract(){
        let newValue = age - 1
        if newValue < 1 {
            age = 1
        } else {
            age = newValue
        }
        ageView.labelView2.text = "\(age)"
    }
    
    @objc func ageSum(){
        let newValue = age + 1
        if newValue > 120 {
            age = 120
        } else {
            age = newValue
        }
        ageView.labelView2.text = "\(age)"
    }
    
    func heightViews(){
        view.addSubview(heightview)
        heightview.frame = CGRect(
            x: maleView.frame.minX,
            y: maleView.frame.maxY + 20,
            width: maleView.bounds.width * 2 + 20,
            height: maleView.bounds.height)
        heightview.slider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
    }
    
    @objc func sliderValueChanged(sender: UISlider){
        heightview.valueLabel()
        height = sender.value
    }
    
}

