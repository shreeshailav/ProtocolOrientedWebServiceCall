//
//  NetworkController.swift
//  ProtocolOrientedWebServiceCall
//
//  Created by hasher on 20/08/19.
//  Copyright © 2019 hasher. All rights reserved.
//

import Foundation
class NetworkController {
   /* static let questionsURL = "https://api.stackexchange.com/2.2/questions?order=desc&sort=votes&site=stackoverflow"
    static let usersURL = "https://api.stackexchange.com/2.2/users?order=desc&sort=reputation&site=stackoverflow"
    
    func loadQuestions(withCompletion completion: @escaping ([Question]?) -> Void) {
        let session = URLSession(configuration: .ephemeral, delegate: nil, delegateQueue: OperationQueue.main)
        let url = URL(string: "https://api.stackexchange.com/2.2/questions?order=desc&sort=votes&site=stackoverflow")!
        let task = session.dataTask(with: url, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            guard let data = data else {
                completion(nil)
                return
            }
            guard let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) else {
                completion(nil)
                return
            }
            let questions: [Question] = [] // Transform JSON into Question values
            completion(questions)
        })
        task.resume()
    }
    */
    
    
    
     func load(_ url: URL) {
        let configuration = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: configuration, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: url, completionHandler: { [weak self] (data: Data?, response: URLResponse?, error: Error?) -> Void in
            
            
            do {
                let fetchedDataDictionary = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary
                print(fetchedDataDictionary!)
                
             }
            catch let error as NSError {
                print(error.debugDescription)
            }
            
          
        })
        task.resume()
    }
    
}
