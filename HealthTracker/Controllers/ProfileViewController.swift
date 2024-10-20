import UIKit

final class ProfileViewController: UIViewController {
    
    var startWeight: Double = 104.4
    var name: String = "Александр"
    var actualWeight: Double = 94.2
    var comment: String = "ты отлично справляешься 🔥"
    
    // MARK: - UI and Lyfe Cycle
    
    private lazy var backImage: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: "backGreen")
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    
    private lazy var backView: UIView = {
        let element = UIView()
        element.backgroundColor = .background
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    
    private lazy var mainStackView: UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var headerStackView: UIStackView = {
        let element = UIStackView()
        element.axis = .horizontal
//        element.backgroundColor = .green
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var weightStackView: UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
//        element.backgroundColor = .yellow
        element.distribution = .fillProportionally
        element.spacing = 0
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var statisticStackView: UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.distribution = .fillEqually
        element.spacing = 10
//        element.backgroundColor = .orange
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var helloLabel: UILabel = {
        let element = UILabel()
        element.text = "\(name),\n\(comment)"
        element.numberOfLines = 0
        element.font = .systemFont(ofSize: 22, weight: .semibold)
        element.textColor = .white
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var logoutButton: UIButton = {
        let element = UIButton()
        element.setImage(.init(systemName: "rectangle.portrait.and.arrow.right"), for: .normal)
        element.tintColor = .gray
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var actualWeightDescriptionLabel: UILabel = {
        let element = UILabel()
        element.text = "Текущий вес:"
        element.font = .systemFont(ofSize: 16, weight: .semibold)
        element.textColor = .lightText
        element.textAlignment = .center
//        element.backgroundColor = .red
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var actualWeightLabel: UILabel = {
        let element = UILabel()
        element.text = "\(actualWeight)"
        element.textAlignment = .center
        element.font = .systemFont(ofSize: 72, weight: .bold)
        element.textColor = .white
//        element.backgroundColor = .blue
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var equalWeightStackView: UIStackView = {
        let element = UIStackView()
        element.axis = .horizontal
        element.distribution = .equalSpacing

        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var equalWeightLabel: UILabel = {
        let element = UILabel()
        element.font = .systemFont(ofSize: 16, weight: .semibold)
        element.textColor = .darkGray
        element.text = "Сброшено: 5 кг"
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var goalRemainWeightLabel: UILabel = {
        let element = UILabel()
        element.font = .systemFont(ofSize: 16, weight: .semibold)
        element.textColor = .darkGray
        element.text = "Осталось: 25 кг"
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var updateWeight: UIButton = {
        let element = UIButton()
        element.setTitle("+ Добавить взвешивание", for: .normal)
//        element.backgroundColor = .brown
        element.setTitleColor(.accent, for: .normal)
        element.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var foodStatisticView: UIView = {
        let element = UIView()
        element.backgroundColor = .white
        element.layer.cornerRadius = 18
        element.layer.masksToBounds = true
//        element.layer.borderColor = UIColor.lightText.cgColor
//        element.layer.borderWidth = 1
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var foodStackView: UIStackView = {
        let element = UIStackView()
        element.axis = .horizontal
        element.distribution = .equalSpacing
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    private lazy var foodLabel: UILabel = {
        let element = UILabel()
        element.text = "🥩 Калории"
        element.font = .systemFont(ofSize: 16, weight: .semibold)
        element.textColor = .black
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    private lazy var foodCount: UILabel = {
        let element = UILabel()
        element.text = "1234 / 2000 ккал"
        element.font = .systemFont(ofSize: 16, weight: .regular)
        element.textColor = .black
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var waterStatisticView: UIView = {
        let element = UIView()
        element.backgroundColor = .white
        element.layer.cornerRadius = 18
        element.layer.masksToBounds = true
//        element.layer.borderColor = UIColor.lightGray.cgColor
//        element.layer.borderWidth = 1
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var waterStackView: UIStackView = {
        let element = UIStackView()
        element.axis = .horizontal
        element.distribution = .equalSpacing
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    private lazy var waterLabel: UILabel = {
        let element = UILabel()
        element.text = "💧 Вода"
        element.font = .systemFont(ofSize: 16, weight: .semibold)
        element.textColor = .black
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    private lazy var waterCount: UILabel = {
        let element = UILabel()
        element.text = "0.5 / 2 л"
        element.font = .systemFont(ofSize: 16, weight: .regular)
        element.textColor = .black
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var sportStatisticView: UIView = {
        let element = UIView()
        element.backgroundColor = .white
        element.layer.cornerRadius = 18
        element.layer.masksToBounds = true
//        element.layer.borderColor = UIColor.black.cgColor
//        element.layer.borderWidth = 1
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var sportStackView: UIStackView = {
        let element = UIStackView()
        element.axis = .horizontal
        element.distribution = .equalSpacing
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    private lazy var sportLabel: UILabel = {
        let element = UILabel()
        element.text = "💪 Тренировка"
        element.font = .systemFont(ofSize: 16, weight: .semibold)
        element.textColor = .black
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    private lazy var sportStatus: UILabel = {
        let element = UILabel()
        element.text = "выполнена"
        element.font = .systemFont(ofSize: 16, weight: .regular)
        element.textColor = .black
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var updateGoalButton: UIButton = {
        let element = UIButton()
        element.setTitle("Обновить цель", for: .normal)
        element.setTitleColor(.systemRed, for: .normal)
        element.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        
        
        
        setView()
        setupConstraints()
    }
    private func setView() {
        view.addSubview(backImage)
        view.addSubview(backView)
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(headerStackView)
        headerStackView.addArrangedSubview(helloLabel)
        headerStackView.addArrangedSubview(logoutButton)
        mainStackView.addArrangedSubview(weightStackView)
        weightStackView.addArrangedSubview(actualWeightDescriptionLabel)
        weightStackView.addArrangedSubview(actualWeightLabel)
        weightStackView.addArrangedSubview(equalWeightStackView)
        equalWeightStackView.addArrangedSubview(equalWeightLabel)
        equalWeightStackView.addArrangedSubview(goalRemainWeightLabel)
        weightStackView.addArrangedSubview(updateWeight)
        mainStackView.addArrangedSubview(statisticStackView)
        statisticStackView.addArrangedSubview(foodStatisticView)
        
        foodStatisticView.addSubview(foodStackView)
        foodStackView.addArrangedSubview(foodLabel)
        foodStackView.addArrangedSubview(foodCount)
        
        
        statisticStackView.addArrangedSubview(waterStatisticView)
        statisticStackView.addArrangedSubview(sportStatisticView)
        mainStackView.addArrangedSubview(updateGoalButton)
        
        statisticStackView.addArrangedSubview(waterStatisticView)
        waterStatisticView.addSubview(waterStackView)
        waterStackView.addArrangedSubview(waterLabel)
        waterStackView.addArrangedSubview(waterCount)
        
        statisticStackView.addArrangedSubview(sportStatisticView)
        sportStatisticView.addSubview(sportStackView)
        sportStackView.addArrangedSubview(sportLabel)
        sportStackView.addArrangedSubview(sportStatus)
    }
    
    // MARK: - Actions
    
}

// MARK: - Constraints

extension ProfileViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            backImage.topAnchor.constraint(equalTo: view.topAnchor),
            backImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            backView.topAnchor.constraint(equalTo: equalWeightStackView.topAnchor),
            backView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            headerStackView.topAnchor.constraint(equalTo: mainStackView.topAnchor),
            headerStackView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
            headerStackView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
            headerStackView.heightAnchor.constraint(equalToConstant: 120),
            
            logoutButton.topAnchor.constraint(equalTo: headerStackView.topAnchor, constant: -55),
//            logoutButton.bottomAnchor.constraint(equalTo: headerStackView.bottomAnchor),
            logoutButton.trailingAnchor.constraint(equalTo: headerStackView.trailingAnchor),
            
            weightStackView.topAnchor.constraint(equalTo: headerStackView.bottomAnchor),
            weightStackView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
            weightStackView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
            weightStackView.bottomAnchor.constraint(equalTo: statisticStackView.topAnchor, constant: -80),
            
            actualWeightDescriptionLabel.topAnchor.constraint(equalTo: weightStackView.topAnchor, constant: 10),
            actualWeightDescriptionLabel.heightAnchor.constraint(equalToConstant: 40),
            
            actualWeightLabel.topAnchor.constraint(equalTo: actualWeightDescriptionLabel.bottomAnchor, constant: -20),
//            actualWeightLabel.centerXAnchor.constraint(equalTo: weightStackView.centerXAnchor),
//            actualWeightLabel.centerYAnchor.constraint(equalTo: weightStackView.centerYAnchor),
            actualWeightLabel.heightAnchor.constraint(equalToConstant: 150),
            
            equalWeightStackView.topAnchor.constraint(equalTo: actualWeightLabel.bottomAnchor, constant: 10),
            
            
//            equalWeightStackView.bottomAnchor.constraint(equalTo: weightStackView.bottomAnchor, constant: -250),
            
            equalWeightLabel.topAnchor.constraint(equalTo: equalWeightStackView.topAnchor),
            equalWeightLabel.leadingAnchor.constraint(equalTo: equalWeightStackView.leadingAnchor),
            equalWeightLabel.bottomAnchor.constraint(equalTo: equalWeightStackView.bottomAnchor),
            
            goalRemainWeightLabel.topAnchor.constraint(equalTo: equalWeightStackView.topAnchor),
            goalRemainWeightLabel.trailingAnchor.constraint(equalTo: equalWeightStackView.trailingAnchor),
            goalRemainWeightLabel.bottomAnchor.constraint(equalTo: equalWeightStackView.bottomAnchor),
                        
            updateWeight.topAnchor.constraint(equalTo: equalWeightStackView.bottomAnchor, constant: 20),
            updateWeight.bottomAnchor.constraint(equalTo: weightStackView.bottomAnchor),
            updateWeight.heightAnchor.constraint(equalToConstant: 50),
            
            statisticStackView.topAnchor.constraint(equalTo: weightStackView.bottomAnchor),
            statisticStackView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
            statisticStackView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
            statisticStackView.bottomAnchor.constraint(equalTo: updateGoalButton.topAnchor, constant: -70),
//            statisticStackView.heightAnchor.constraint(equalToConstant: 250),
            
            foodStatisticView.topAnchor.constraint(equalTo: statisticStackView.topAnchor),
            foodStatisticView.heightAnchor.constraint(equalToConstant: 50),
            
            updateGoalButton.topAnchor.constraint(equalTo: statisticStackView.bottomAnchor),
            updateGoalButton.bottomAnchor.constraint(equalTo: mainStackView.bottomAnchor),
            
            
//            
            foodStackView.topAnchor.constraint(equalTo: foodStatisticView.topAnchor),
            foodStackView.leadingAnchor.constraint(equalTo: foodStatisticView.leadingAnchor, constant: 10),
            foodStackView.trailingAnchor.constraint(equalTo: foodStatisticView.trailingAnchor, constant: -10),
            foodStackView.bottomAnchor.constraint(equalTo: foodStatisticView.bottomAnchor),
            
            waterStackView.topAnchor.constraint(equalTo: waterStatisticView.topAnchor),
            waterStackView.leadingAnchor.constraint(equalTo: waterStatisticView.leadingAnchor, constant: 10),
            waterStackView.trailingAnchor.constraint(equalTo: waterStatisticView.trailingAnchor, constant: -10),
            waterStackView.bottomAnchor.constraint(equalTo: waterStatisticView.bottomAnchor),
            
            sportStackView.topAnchor.constraint(equalTo: sportStatisticView.topAnchor),
            sportStackView.leadingAnchor.constraint(equalTo: sportStatisticView.leadingAnchor, constant: 10),
            sportStackView.trailingAnchor.constraint(equalTo: sportStatisticView.trailingAnchor, constant: -10),
            sportStackView.bottomAnchor.constraint(equalTo: sportStatisticView.bottomAnchor)
                    
            
            
            
        ])
    }
}
