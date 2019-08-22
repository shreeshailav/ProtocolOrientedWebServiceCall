//
//  ViewController.swift
//  ProtocolOrientedWebServiceCall
//
//  Created by hasher on 20/08/19.
//  Copyright © 2019 hasher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    fileprivate var request: AnyObject?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        
        fetchQuestion()
        
        let url = URL(string: "https://api.stackexchange.com/2.2/questions?order=desc&sort=votes&site=stackoverflow")!
        
        var obj : NetworkController = NetworkController()
        //obj.load(url)
    }

    func fetchQuestion() {
        let questionsResource = QuestionsResource()
        let questionsRequest = ApiRequest(resource: questionsResource)
        request = questionsRequest
        questionsRequest.load { [weak self] (questions: [Question]?) in
           // self?.activityIndicator.stopAnimating()
            guard let questions = questions,
                let topQuestion = questions.first else {
                    return
            }
            //self?.configureUI(with: topQuestion)
            /*if let owner = topQuestion.owner {
                //self?.fetchAvatar(for: owner)
            }*/
        }
    }
}

