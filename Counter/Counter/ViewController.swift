import UIKit

class ViewController: UIViewController {
    
    // MARK: - Связываем UI элементы из сториборда с view controller
    @IBOutlet private weak var logTextView: UITextView!
    @IBOutlet private weak var textLabel: UILabel!
    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var addButton: UIButton!
    @IBOutlet private weak var delButton: UIButton!
    @IBOutlet private weak var resetButton: UIButton!
    
    // MARK: - Добавляем счетчик (counter) и лог изменений (log)
    private var counter: Int = 0
    private var log: [String] = []
    
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
        
        // MARK: - Блокируем лог для редактирования пользователем:
        logTextView.isEditable = false
        
    }
    
    // MARK: - Вывод даты и времени в лог
    private func time() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        let formattedDate = dateFormatter.string(from: Date())
        log.append(formattedDate + ": ")
    }
    
    // MARK: - Значение счетчика +1
    @IBAction private func addScore(_ sender: Any) {
        counter += 1
        counterLabel.text = "\(counter)"
        time()
        logTextView.insertText((log.last ?? "") + "значение изменено на +1" + "\n")
    }
    
    // MARK: - Значение счетчика -1
    @IBAction private func delScore(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            counterLabel.text = "\(counter)"
            time()
            logTextView.insertText((log.last ?? "") + "значение изменено на -1" + "\n")
        } else {
            time()
            logTextView.insertText((log.last ?? "") + "попытка уменьшить значение счётчика ниже 0" + "\n")
        }
        
    }
    
    // MARK: - Сбросить значение счетчика
    @IBAction private func resetScore(_ sender: Any) {
        counter = 0
        counterLabel.text = "\(counter)"
        time()
        logTextView.insertText((log.last ?? "") + "значение сброшено" + "\n")
    }
    
}

