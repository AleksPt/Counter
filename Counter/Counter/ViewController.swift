import UIKit

class ViewController: UIViewController {
    
// MARK: - Связываем UI элементы из сториборда с view controller
    @IBOutlet weak var logTextView: UITextView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var delButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
// MARK: - Добавляем счетчик (counter) и лог изменений (log)
    var counter: Int = 0
    var log: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // MARK: - Кастомизируем UI (скругление углов, цвет кнопок, скролл для Text View):
                addButton.layer.cornerRadius = 5
                delButton.layer.cornerRadius = 5
                resetButton.layer.cornerRadius = 5
                resetButton.layer.borderWidth = 2
                logTextView.layer.cornerRadius = 5
                
                addButton.backgroundColor = .red
                delButton.backgroundColor = .blue
                resetButton.layer.borderColor = UIColor.white.cgColor
                
                self.logTextView.setContentOffset(.zero, animated: true)
                logTextView.text = "История изменений:\n\n"
        
    }

// MARK: - Вывод даты и времени в лог
    func time() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        let formattedDate = dateFormatter.string(from: Date())
        log.append(formattedDate + ": ")
    }

}

