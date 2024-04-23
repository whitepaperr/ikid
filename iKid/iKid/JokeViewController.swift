//
//  JokeViewController.swift
//  iKid
//
//  Created by 이하은 on 4/22/24.
//

import UIKit

class JokeViewController: UIViewController {
    var joke: Joke?
    var jokeLabel: UILabel!
    var nextButton: UIButton!
    var isQuestionShown = true

    init(category: JokeCategory) {
        super.init(nibName: nil, bundle: nil)
        switch category {
        case .good:
            joke = Joke(question: "Why don't scientists trust atoms?", answer: "Because they make up everything.")
        case .pun:
            joke = Joke(question: "How does a penguin build its house?", answer: "Igloos it together.")
        case .dad:
            joke = Joke(question: "What do you call fake spaghetti?", answer: "An impasta.")
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        view.backgroundColor = .white

        jokeLabel = UILabel()
        jokeLabel.translatesAutoresizingMaskIntoConstraints = false
        jokeLabel.numberOfLines = 0
        jokeLabel.textAlignment = .center
        jokeLabel.textColor = .black
        view.addSubview(jokeLabel)
        
        nextButton = UIButton(type: .system)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.setTitle("Next", for: .normal)
        nextButton.backgroundColor = .blue
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.layer.cornerRadius = 5 
        nextButton.addTarget(self, action: #selector(flipJoke), for: .touchUpInside)
        view.addSubview(nextButton)

        NSLayoutConstraint.activate([
            jokeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            jokeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            jokeLabel.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 20),
            jokeLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -20),
            
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
        ])
        
        // Initially set to question
        jokeLabel.text = joke?.question
    }


    @objc func flipJoke() {
        jokeLabel.text = isQuestionShown ? joke?.answer : joke?.question
        isQuestionShown.toggle()
    }
}

enum JokeCategory {
    case good, pun, dad
}
