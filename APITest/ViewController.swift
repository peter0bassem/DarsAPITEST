//
//  ViewController.swift
//  APITest
//
//  Created by Peter Bassem on 11/29/20.
//

import UIKit

class ViewController: UIViewController {
    
    var token: String!
    
    var dispathcGroup = DispatchGroup()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .green
        homeAPI()
        
        
//        dispathcGroup.enter()
//        homeAPI()
//        dispathcGroup.leave()
//
//        dispathcGroup.notify(queue: .main) {
//
//        }
        
    }
    
    func homeAPI() {
        let Url = String(format: "https://dars.in/api/v1/allcourses/5")
        guard let serviceUrl = URL(string: Url) else { return }
//        let parameterDictionary = ["statge_id" : 5]
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "GET"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
//        request.setValue("Bearer \(token ?? "")", forHTTPHeaderField: "Authorization")
        
//        print("headers", request.allHTTPHeaderFields)
        
//        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameterDictionary, options: []) else {
//            return
//        }
//        request.httpBody = httpBody
        
        print(request)
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
            
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
}

