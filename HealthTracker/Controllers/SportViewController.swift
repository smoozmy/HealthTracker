import UIKit

final class SportViewController: UIViewController {
    
    // MARK: - UI and Lyfe Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
        setupConstraints()
    }
    private func setView() {
        // Здесь добавляются новые элементы для отображения на экране
    }
    
    // MARK: - Actions
    
}

// MARK: - Constraints

extension SportViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // Здесь прописываются констрейнты для элементов
        ])
    }
}

