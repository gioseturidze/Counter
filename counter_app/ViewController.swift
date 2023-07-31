import UIKit

class ViewController: UIViewController {
    
    var counter: Int = 0
    
    var date = Date.now
    let formatter = DateFormatter()
    
    var historyArray: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        counterValue(counter)
        counterText.textAlignment = NSTextAlignment.center
        
        customButton("+", .red, incrementButton)
        customButton("-", .blue, decrementButton)
        customButton("reset", .black, resetCounterButton)
        
        tapHistoryValue(tapHistory, "\(counter)")
        tapHistory.isEditable = false
        tapHistory.isScrollEnabled = true
        
        
    }
    @IBOutlet weak var counterText: UILabel!
    
    @IBAction func increment(_ sender: Any) {
        
        date = Date.now
        counter += 1
        counterValue(counter)
        tapHistoryValue(tapHistory, "+1")
    }
    
    @IBOutlet weak var incrementButton: UIButton!
    
    @IBAction func decrement(_ sender: Any) {
        
        date = Date.now
        if(counter > 0){
            counter -= 1
            tapHistoryValue(tapHistory, "-1")
        }else {
            tapHistoryValue(tapHistory, "попытка уменьшить значение счётчика ниже 0")
        }
        counterValue(counter)
    }
    
    @IBOutlet weak var decrementButton: UIButton!
    
    
    @IBAction func resetCounterButtonAction(_ sender: Any) {
        counter = 0
        counterValue(counter)
        tapHistoryValue(tapHistory, "значение сброшено")
    
    }
    @IBOutlet weak var resetCounterButton: UIButton!
    
    
    @IBOutlet weak var tapHistory: UITextView!
    
    func showTapHistory(){
        historyArray.append(tapHistory.text)
    }
    
    func customButton(_ title: String, _ color: UIColor, _ button: UIButton){
        button.setTitle(title, for: .normal)
        button.tintColor = color
    }
    
    func tapHistoryValue(_ tapHistory: UITextView, _ valueChanges: String){
        tapHistory.text = "История изменений: [\(formatter.string(from: date))]  \(valueChanges)"
    }
    
    func counterValue(_ counter: Int){
        counterText.text = "Значение счётчика: \(counter)"
    }
}
