import UIKit

class ViewController: UIViewController {
    
    var counter: Int = 0
    
    var date = Date.now
    let formatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        counterValue(counter)
        counterLabel.textAlignment = NSTextAlignment.center
        
        customButton("+", .red, incrementButton)
        customButton("-", .blue, decrementButton)
        customButton("reset", .black, resetCounterButton)
        
        changesHistory(tapHistoryTextView, "\(counter)")
        tapHistoryTextView.isEditable = false
        tapHistoryTextView.isScrollEnabled = true
    }
    
    
    @IBOutlet weak var incrementButton: UIButton!
    @IBOutlet weak var resetCounterButton: UIButton!
    @IBOutlet weak var decrementButton: UIButton!
    
    
    @IBOutlet weak var tapHistoryTextView: UITextView!
    @IBOutlet weak var counterLabel: UILabel!
    
    
    @IBAction func increment(_ sender: Any) {
        counter += 1
        counterValue(counter)
        changesHistory(tapHistoryTextView, "+1")
    }
    
    
    @IBAction func decrement(_ sender: Any) {
        if(counter > 0){
            counter -= 1
            changesHistory(tapHistoryTextView, "-1")
        }else {
            changesHistory(tapHistoryTextView, "попытка уменьшить значение счётчика ниже 0")
        }
        counterValue(counter)
    }

    
    @IBAction func resetCounter(_ sender: Any) {
        counter = 0
        counterValue(counter)
        changesHistory(tapHistoryTextView, "значение сброшено")
    }
    
    func customButton(_ title: String, _ color: UIColor, _ button: UIButton){
        button.setTitle(title, for: .normal)
        button.tintColor = color
    }
    
    func changesHistory(_ tapHistory: UITextView, _ valueChanges: String){
        date = Date.now
        tapHistory.text += "История изменений: [\(formatter.string(from: date))]  \(valueChanges)\r\n"
    }
    
    func counterValue(_ counter: Int){
        counterLabel.text = "Значение счётчика: \(counter)"
    }
}
