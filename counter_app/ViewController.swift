import UIKit

class ViewController: UIViewController {
    
    private var counter: Int = 0
    
    private var date = Date.now
    private let formatter = DateFormatter()
    
    
    @IBOutlet private weak var incrementButton: UIButton!
    @IBOutlet private weak var resetCounterButton: UIButton!
    @IBOutlet private weak var decrementButton: UIButton!
    @IBOutlet private weak var tapHistoryTextView: UITextView!
    @IBOutlet private weak var counterLabel: UILabel!
    
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
    
    
    private func customButton(_ title: String, _ color: UIColor, _ button: UIButton){
        button.setTitle(title, for: .normal)
        button.tintColor = color
    }
    
    private func changesHistory(_ tapHistory: UITextView, _ valueChanges: String){
        date = Date.now
        tapHistory.text += "История изменений: [\(formatter.string(from: date))]  \(valueChanges)\r\n"
    }
    
    private func counterValue(_ counter: Int){
        counterLabel.text = "Значение счётчика: \(counter)"
    }
    
    @IBAction private func increment(_ sender: Any) {
        counter += 1
        counterValue(counter)
        changesHistory(tapHistoryTextView, "+1")
    }
    
    
    @IBAction private func decrement(_ sender: Any) {
        if(counter > 0){
            counter -= 1
            changesHistory(tapHistoryTextView, "-1")
        }else {
            changesHistory(tapHistoryTextView, "попытка уменьшить значение счётчика ниже 0")
        }
        counterValue(counter)
    }
    
    
    @IBAction private func resetCounter(_ sender: Any) {
        counter = 0
        counterValue(counter)
        changesHistory(tapHistoryTextView, "значение сброшено")
    }
}
