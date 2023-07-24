import UIKit
import Foundation
class BMI{
    var height: Float
    var weight: Float
    var bmi: Float
    
    init(height: Float, weight: Int) {

        self.height = height
        self.weight = Float(weight)
        let heightM = self.height / 100
        self.bmi = self.weight / (heightM * heightM)
    }
    
    func bmiTitle() -> String{
        switch bmi {
        case 0...18.5:
            return "Thiếu cân"
        case 18.5..<25:
            return "Cân đối"
        case 25..<30:
            return "Thừa cân"
        case 30..<35:
            return "Béo phì"
        default:
            return "Béo phì nguy hiểm"
        }
    }
    func bmiColor() -> UIColor{
        switch bmi {
        case 0...18.5:
            return UIColor.blue
        case 18.5..<25:
            return UIColor.green
        case 25..<30:
            return UIColor.orange
        case 30..<35:
            return UIColor.red
        default:
            return UIColor.systemPink
        }
    }
    
    func nhanXet() -> String{
        switch bmi {
        case 0...18.5:
            return "Thân hình bạn hơi gầy. Cần tăng cân"
        case 18.5..<25:
            return "Thân hình bạn cân đối. Rất tốt"
        case 25..<30:
            return "Thân hình bạn hơi thừa cân. Cần giảm cân"
        case 30..<35:
            return "Thân hình bạn hơi béo. Hãy giảm cân"
        default:
            return "Thân hình bạn quá béo. Rất nguy hiểm"
        }
    }
}




